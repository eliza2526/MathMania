//
//  GameManager.swift
//  mathmania
//
//  Created by Elizabeth Thomas on 2025-02-17.
//

import Foundation

class GameManager: ObservableObject {
    
    @Published var currentLevel = 1
    @Published var score = 0
    @Published var gameOver = false
    @Published var randomNumber = 0
    @Published var number1 = 0
    @Published var number2 = 0
    @Published var correctAnswer = 0
    @Published var question = ""
    @Published var leaderboard = Leaderboard()
    
    init(){
        generateQuestion()
    }
    
    func generateQuestion() {
        switch currentLevel {
        case 1:
            randomNumber = Int.random(in: 1...100)
            question = "Is \(randomNumber) Odd or Even?"
            
        case 2:
            number1 = Int.random(in: 1...50)
            number2 = Int.random(in: 1...50)
            correctAnswer = number1 + number2
            question = "What is \(number1) + \(number2)?"
        case 3:
            number1 = Int.random(in: 20...100)
            number2 = Int.random(in: 1...number1)
            correctAnswer = number1 - number2
            question = "What is \(number1) - \(number2)?"
        default:
            gameOver = true
        }
        
    }
    
    func checkGuess(guess: String) {
        let isOdd = randomNumber % 2 != 0
        if (guess == "Odd" && isOdd ) || (guess == "Even" && !isOdd) {
            score += 10
            nextLevel()
        } else {
            gameOver = true
        }
    }
    
    func checkAnswer(answer: Int) {
        if answer == correctAnswer {
            score += 10
            nextLevel()
        } else {
            gameOver = true
        }
    }
    
    private func nextLevel() {
        if currentLevel < 3 {
            currentLevel += 1
            generateQuestion()
        } else {
            gameOver = true
        }
    }
    
    func resetGame() {
        currentLevel = 1
        score = 0
        gameOver = false
        generateQuestion()
    }
    
    func endGame(with username: String) {
        gameOver = true
        leaderboard.addScore(username: username, score: score)
    }
    
}
