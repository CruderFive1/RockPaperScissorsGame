//
//  ContentView.swift
//  RockPaperScissorsGame
//
//  Created by Adrian Senften on 09.12.2023.
//

import SwiftUI



struct ContentView: View {
    @State private var randomNumber = Bool.random() ? 1 : 0
    @State private var score: Int = 0
    @State private var userChoise: Int = 0
    @State private var computerChoise: Int = Int.random(in: 0...2)
    @State private var showingAlert = false
    @State private var winOrLose = ""
    
    let gameOptions = ["Rock", "Paper", "Scissors"]
    let winningMovces = ["Paper", "Scissors", "Rock"]
    
    
    // var computerOption = gameOptions[computerChoise]
    var winCondition: String {
        if randomNumber == 1 {
            return "win"
        } else {
            return "loose"
        }
    }
    
    var body: some View {
        NavigationStack {
            let computerOption = gameOptions[computerChoise]
            ZStack {
                LinearGradient(colors: [.white, .blue], startPoint: .bottom, endPoint: .top)
            
            VStack {
                Spacer()
                Text("Choose the correct answer")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.black)
                Spacer()
               
                    Text("You have to \(winCondition) the game")
                            .font(.title2)
                        .fontWeight(.heavy)
                
                
                
                Text("The computer chooses \(computerOption)")
                    .font(.title2)
                    .fontWeight(.medium)
                    
                Spacer()
                HStack{
                    
                    ForEach(0..<3) {number in Button {
                        game(User: number, Computer: computerChoise, Result: randomNumber)
                        print(number)
                        refreshGame()
                        showingAlert = true
                    } label: {
                        Text("\(gameOptions[number])")
                        
                    }
                    .buttonStyle(.borderedProminent)
                    }
                    
                
                   
                }

                
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("\(winOrLose)"),
                          message: Text("Your score is: \(score)"),
                          dismissButton: .default(Text("Got it!")))

                    
                }

                Spacer()
            }
                

            }.ignoresSafeArea()
            
        }
        
    }
    func game(User: Int, Computer: Int, Result: Int) {
        if Result == 1 && gameOptions[User] == winningMovces[Computer] {
            score += 1
            print("Win")
            print(winningMovces[User])
            winOrLose = "you Win"
            
        } else if Result == 0 && gameOptions[User] != winningMovces[Computer] {
            score += 1
            print("Win")
            print(winningMovces[User])
            winOrLose = "you Win"
            
        } else {
            print("You lose")
            print(winningMovces[User])
            winOrLose = "you loose"
            
        }
        
        print("User: \(User), Computer: \(Computer), Result: \(Result), Score: \(score)")
    }
    func refreshGame() {
        randomNumber = Bool.random() ? 1 : 0
        computerChoise = Int.random(in: 0...2)
    }
    
}




#Preview {
    ContentView()
}
