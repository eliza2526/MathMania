//
//  CustomAlertView.swift
//  mathmania
//
//  Created by Elizabeth Thomas on 2025-02-17.
//

import SwiftUI

struct CustomAlertView: View {
    @Binding var username: String
    let onSubmit: () -> Void
    
    var body: some View {
        VStack {
            Text("Game Over!")
                .font(.headline)
            Text("Enter your name for the leaderboard")
            TextField(")Your Name ", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            HStack {
                Button(action: { onSubmit() }) { 
                    Text("Submit")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                Button(action: {}) {
                    Text("Cancel")
                        .padding()
                        .background(Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}
