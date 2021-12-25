//
//  ToDo.swift
//  ToDoList
//
//  Created by Wayne on 2021/12/10.
//

import Foundation
struct ToDo: Equatable, Codable {
    let id = UUID()
    var title: String
    var isComplete: Bool
    var dueDate: Date
    var notes: String?
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter
    } ()
    
    static func ==(lhs: ToDo, rhs: ToDo) -> Bool {
        return lhs.id == rhs.id
    }
    
    static func loadToDos() -> [ToDo]? {
        guard let codedToDos = try? Data(contentsOf: archiveURL) else{
            return nil
        }
        let propertyDecoder = PropertyListDecoder()
        return try? propertyDecoder.decode(Array<ToDo>.self, from: codedToDos)
    }
    static func saveToDos(toDos: [ToDo]) {
        let propertyEncoder = PropertyListEncoder()
        let codedToDos = try? propertyEncoder.encode(toDos)
        try? codedToDos?.write(to: archiveURL, options: .noFileProtection)
    }
    static func loadSampleToDos() -> [ToDo] {
        let todo1 = ToDo(title: "ToDo One", isComplete: false,
           dueDate: Date(), notes: "Notes 1")
        let todo2 = ToDo(title: "ToDo Two", isComplete: false,
           dueDate: Date(), notes: "Notes 2")
        let todo3 = ToDo(title: "ToDo Three", isComplete: false,
           dueDate: Date(), notes: "Notes 3")

        return [todo1, todo2, todo3]
    }

    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL = documentsDirectory.appendingPathComponent("toDos").appendingPathExtension("plist")
    
}


