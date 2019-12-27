//
//  ContentView.swift
//  DiceGames
//
//  Created by Luc Derosne on 27/12/2019.
//  Copyright © 2019 Luc Derosne. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State var dice01 = Int.random(in: 1...6)
    @State var dice02 = Int.random(in: 1...6)
    @State var dice03 = Int.random(in: 1...6)
    @State var dice04 = Int.random(in: 1...6)
    @State var dice05 = Int.random(in: 1...6)
    
    var body: some View {
        ZStack {
            //Color(.blue)
            Color("grayBlue")
                .edgesIgnoringSafeArea(.all)
            //            Image(decorative: "background")
            //                           .resizable()
            //                           .scaledToFill()
            //                           .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Jeux de dés")
                    .font(.system(size: 60))
                    .bold()
                    .fontWeight(.heavy)
                    //.foregroundColor(.grayBlue)
                
                Spacer()
                HStack {
                    Spacer()
                    DiceView(n: dice04)
                    DiceView(n: dice05)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    DiceView(n: dice01)
                    DiceView(n: dice02)
                    DiceView(n: dice03)
                    Spacer()
                }
                
                Spacer()
                Text("Total \(self.calculateResult())")
                    .font(.title)
                Spacer()
                Button(action: {
                    self.dice01 = Int.random(in: 1...6)
                    self.dice02 = Int.random(in: 1...6)
                    self.dice03 = Int.random(in: 1...6)
                    self.dice04 = Int.random(in: 1...6)
                    self.dice05 = Int.random(in: 1...6)
                    // self.calculateResult()
                }) {
                    
                    Text("Lancer")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding(.horizontal)
                    
                }
                .background(Color.green)
                    //.mask(Circle())
                    .clipShape(Capsule())
                
                //Text("Total \(self.calculateResult())")
                Spacer()
            }
        }
        
    }
    
    func calculateResult() -> String {
        let total =  dice01 + dice02 + dice03 + dice04 + dice05
        print(total)
        return String(total)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DiceView: View {
    
    let n: Int
    
    var body: some View {
        Image("dice-\(n)")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .padding()
            .frame(width: 125, height: 125)
    }
}


extension Color {
    //static let oldPrimaryColor = Color(UIColor.systemIndigo)
    static let grayBlue = Color("grayBlue")
}
