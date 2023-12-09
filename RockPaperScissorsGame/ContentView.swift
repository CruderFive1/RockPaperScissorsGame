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
            var computerOption = gameOptions[computerChoise]
            
            VStack {
                Spacer()
                Text("Choose the correct answer")
                Text("You have to \(winCondition) the game")
                Spacer()
                Text("The computer chooses \(computerOption)")
                Spacer()
                HStack{
                    
                    ForEach(0..<3) {number in Button {
                        game(User: number, Computer: computerChoise, Result: randomNumber)
                        print(number)
                        refreshGame()
                    } label: {
                        Text("\(gameOptions[number])")
                        
                    }
                    }
                    
                }
                Text("\(gameOptions[computerChoise])")
                
                Text("\(score)")
                Spacer()
            }
        }
        
    }
    func game(User: Int, Computer: Int, Result: Int) {
        if Result == 1 && gameOptions[Computer] == winningMovces[User] {
            score += 1
            print("Win")
            print(winningMovces[User])
            
        } else if Result == 0 && gameOptions[Computer] == winningMovces[User] {
            score += 1
            print("Win")
            print(winningMovces[User])
            
        } else {
            print("You lose")
            print(winningMovces[User])
            
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
