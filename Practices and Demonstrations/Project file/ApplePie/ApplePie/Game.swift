//
//  Game.swift
//  ApplePie
//
//  Created by Wayne on 2021/11/12.
//

import Foundation
import CoreText

struct Game {
    var word: String
    var incorrectMovesRemaining: Int
    var guessedLetters:[Character]
    
    var formattedWord: String {
        var guessedWord = ""
        for letter in word {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            } else {
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    mutating func playerGuessed(letter: Character) {
        guessedLetters.append(letter)
        if !word.contains(letter) {
            incorrectMovesRemaining -= 1
        }
    }
    
}
