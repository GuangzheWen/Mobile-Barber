//
//  ViewController.swift
//  ApplePie
//
//  Created by Wayne on 2021/11/11.
//

import UIKit

class ViewController: UIViewController {
    
    var listOfWords:[String] = ["buccaneer", "swift", "glorious", "incandescent", "bug", "program"]
    let incorrectMoveAllowed = 7
    
    var totalWins = 0 {
        didSet {
            newRound()
        }
    }
    var totalLosses = 0 {
        didSet {
            newRound()
        }
    }
    
    var currentGame: Game!

    @IBOutlet var letterButtons: [UIButton]!
    @IBOutlet var scoreLabel: UILabel!
    @IBOutlet var correctWordLabel: UILabel!
    @IBOutlet var treeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        newRound()
    }

    @IBAction func letterButtonPressed(_ sender: UIButton) {
        sender.isEnabled = false
//        print(sender.currentTitle)
        let letterString = sender.title(for: .normal)!
        print(letterString)
        let letter = Character(letterString.lowercased())
        currentGame.playerGuessed(letter: letter)
        updateGameState()
    }
    
    
    func newRound() {
        
        if !listOfWords.isEmpty {
            let newWord = listOfWords.removeFirst()
            currentGame = Game(word: newWord, incorrectMovesRemaining: incorrectMoveAllowed, guessedLetters: [])
            enableLetterButtons(true)
            updateUI()
            
        } else {
            enableLetterButtons(false)
        }
    }
    
    func updateUI() {
        var letters:[String] = []
        for letter in currentGame.formattedWord {
            letters.append(String(letter))
        }
        let wordWithSpacing = letters.joined(separator: " ")
        correctWordLabel.text = wordWithSpacing
        scoreLabel.text = "Wins: \(totalWins), Losses: \(totalLosses)"
        treeImageView.image = UIImage(named: "Tree \(currentGame.incorrectMovesRemaining)")
        
    }
    
    func updateGameState() {
        if currentGame.incorrectMovesRemaining == 0 {
            totalLosses += 1
        } else if currentGame.formattedWord == currentGame.word {
            totalWins += 1
        } else {
            updateUI()
        }
    }
    
    func enableLetterButtons(_ enable: Bool) {
        for button in letterButtons {
            button.isEnabled = enable
        }
    }
}

