import UIKit
import Foundation

var greeting = "Hello, playground"
struct Note: Codable {
    var title: String
    var text: String
    var timeStamp: Date
}

let note = Note(title: "title", text: "text", timeStamp: Date())



let docDir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

let archiveURL = docDir.appendingPathComponent("notes_test").appendingPathExtension("plist")

let propertyListEncoder = PropertyListEncoder()
let encodedNote = try? propertyListEncoder.encode(note)
try? encodedNote?.write(to: archiveURL, options: .noFileProtection)

let propertyListDecoder = PropertyListDecoder()
if let noteData = try? Data(contentsOf: archiveURL),
   let decodedNote = try? propertyListDecoder.decode(Note.self, from: noteData) {
    print(decodedNote)
}
