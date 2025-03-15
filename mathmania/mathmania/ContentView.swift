//
//  ContentView.swift
//  mathmania
//
//  Created by Elizabeth Thomas on 2025-02-17.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var gameManager = GameManager()
    @State private var userAnswer = ""
    @State private var username = ""
    @State private var showingUsernameAlert = false
    
    
    var body: some View {
        VStack {
            
            Text("MathMania")
                .font(.largeTitle)
                .padding()
            
            if gameManager.gameOver{
                Text("Game Over! Your Score: \(gameManager.score)")
                    .padding()
                Text("Leaderboard")
                    .font(.headline)
                    .padding()
                
                List(gameManager.leaderboard.leaderboard) {
                    item in HStack {
                        Text(item.username)
                        Spacer()
                        Text("\(item.score)")
                        
                    }
                }
                
                
                Button(action: {
                    gameManager.resetGame()
                }) {
                    Text("Play Again")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            } else {
                Text(gameManager.question)
                    .font(.headline)
                    .padding()
                
                if gameManager.currentLevel == 1 {
                    HStack {
                        Button(action: { gameManager.checkGuess(guess: "Odd")}) {
                            Text("Odd")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                        Button(action: {
                            gameManager.checkGuess(guess: "Even")
                        }) {
                            Text("Even")
                                .padding()
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                } else {
                    TextField("Enter your answer", text: $userAnswer)
                        .padding()
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: { if let answer = Int(userAnswer) {
                        gameManager.checkAnswer(answer: answer)
                    }
                        userAnswer = ""
                        if gameManager.gameOver {
                            showingUsernameAlert = true
                        }
                    }) {
                        Text("Submit Answer")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    }
                }
                Text("Score: \(gameManager.score)")
                    .padding()
            }
            
        }
        .padding()
        .sheet(isPresented: $showingUsernameAlert){
            CustomAlertView (username: $username) {
                gameManager.endGame(with: username)
            showingUsernameAlert = false
            }
        }
    }

}
    
    
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
