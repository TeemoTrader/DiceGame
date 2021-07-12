//
//  ContentView.swift
//  Dicey
//
//  Created by Teemo Norman on 7/12/21.
//

import SwiftUI

struct ContentView: View {
    
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    @State var botRightDice = 1
    @State var botLeftDice = 1
    
    
    var body: some View {
        let botScore = botRightDice + botLeftDice
        let youScore = leftDiceNumber + rightDiceNumber
        
        ZStack {
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack{
                Image("diceeLogo")
                Spacer()
                VStack{
                    if botScore > youScore {
                        Text("BOT WINS!").bold()
                    } else {
                        Text("YOU WIN!").bold()
                    }
                    Text("You Score: \(leftDiceNumber + rightDiceNumber)").font(.system(size: 40))
                    Text("Bot's Score: \(botLeftDice + botRightDice)").font(.system(size: 40))
                }
                .font(.system(size: 70))
                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                HStack{
                    DiceView(n: botLeftDice)
                    DiceView(n: botRightDice)
                }
                .frame(width: 300, height: 150)
                .border(Color.black, width: 2)
                HStack{
                    DiceView(n: leftDiceNumber)
                    DiceView(n: rightDiceNumber)
                }
                .frame(width: 420, height: 250)
                VStack{
                Button(action: {
                    self.leftDiceNumber = Int.random(in: 1...6)
                    self.rightDiceNumber = Int.random(in: 1...6)
                    self.botLeftDice = Int.random(in: 1...6)
                    self.botRightDice = Int.random(in: 1...6)
                    
                }) {
                    Text("Roll")
                        .font(.system(size: 50))
                        .fontWeight(.heavy)
                        .foregroundColor(.red)
                        .padding()
                        .frame(width: 300, height: 100, alignment: .center)
                    
                }
                .background(Color.white)
                }
        }
        }
    }
}
struct DiceView: View {
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

