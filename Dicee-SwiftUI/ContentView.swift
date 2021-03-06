//
//  ContentView.swift
//  Dicee-SwiftUI
//
//  Created by Christian Eiselt on 27.03.21.
//

import SwiftUI

struct ContentView: View {

  @State var leftDiceNumber = 1
  @State var rightDiceNumber = 1

  fileprivate func setDiceNumbers() {
    self.leftDiceNumber = Int.random(in: 1...6)
    self.rightDiceNumber = Int.random(in: 1...6)
  }

  fileprivate func getRollButtonText() -> some View {
    return Text("Roll")
      .font(.system(size: 50))
      .fontWeight(.heavy)
      .foregroundColor(.white)
      .padding(.horizontal)
  }

  var body: some View {
    ZStack {
      Image("background")
        .resizable()
        .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
      VStack {
        Image("diceeLogo")
        Spacer()
        HStack {
          DiceView(number: leftDiceNumber)
          DiceView(number: rightDiceNumber)
        }
        .padding(.horizontal)
        Spacer()
        Button(action: {
          setDiceNumbers()
        }, label: {
          getRollButtonText()
        })
        .background(Color.red)
      }
    }
  }
}

struct DiceView: View {

  let number: Int

  var body: some View {
    Image("dice\(number)")
      .resizable()
      .aspectRatio(1, contentMode: .fit)
      .padding(.all)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
