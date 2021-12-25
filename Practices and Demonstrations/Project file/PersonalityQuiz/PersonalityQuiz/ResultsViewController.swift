//
//  ResultsViewController.swift
//  PersonalityQuiz
//
//  Created by Wayne on 2021/11/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var responses: [Answer]
    
    init?(coder: NSCoder, responses: [Answer]) {
        self.responses = responses
        
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var resultDefinitionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateResults()
        // Do any additional setup after loading the view.
        navigationItem.hidesBackButton = true
    }
    
    func calculateResults() {
        let frequencyOfAnswers = responses.reduce(into: [:]) {
            (counts, answers) in
            counts[answers.type, default: 0] += 1
        }
        
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by: {
            (pair1, pair2) in
            return pair1.value > pair2.value
        })
        
        let mostFrequentAnswer = frequentAnswerSorted.first!.key
        resultLabel.text = "You are a \(mostFrequentAnswer.rawValue)!"
        resultDefinitionLabel.text = mostFrequentAnswer.definition
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
