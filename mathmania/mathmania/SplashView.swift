//
//  SplashView.swift
//  mathmania
//
//  Created by Elizabeth Thomas on 2025-02-17.
//

import SwiftUI

struct SplashView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            ContentView()
        } else {
            VStack {
                Text("Math Mania")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding()
                
                Text(" Instructions: ")
                    .font(.title2)
                    .padding(.top, 20)
                
                Text("""
                    - a random number ...

                    """)
                Text("Created By")
                    .font(.title3)
                
                Spacer()
            }
            
            .padding()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
                    withAnimation { isActive = true }
                }
                
            }   
        }
    }
}

#Preview {
    SplashView()
}
