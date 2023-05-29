//
//  ContentView.swift
//  CardGame
//
//  Created by Ömür Şenocak on 2.05.2023.
//

import SwiftUI

struct ContentView: View {

    @State var index = 0
    @State var Cards = [
        Card(id: 0, image: "figure.dress.line.vertical.figure", offset: 0, title: "Only guys will drink"),
        Card(id: 1, image: "person.3.fill", offset: 0, title: "Everyone gonna drink"),
        Card(id: 2, image: "figure.dress.line.vertical.figure", offset: 0, title: "Only girls will drink"),
        Card(id: 3, image: "figure.wave", offset: 0, title: "Only you gonna drink"),
        Card(id: 4, image: "book.fill", offset: 0, title: "Set a new rule in game"),
        Card(id: 5, image: "text.word.spacing", offset: 0, title: "Start a word serie starts with the last letter"),
        Card(id: 6, image: "person.fill.questionmark", offset: 0, title: "Never have i ever"),
        Card(id: 7, image: "person.fill.xmark", offset: 0, title: "True or false"),
        Card(id: 8, image: "eyes", offset: 0, title: "Choose who gonna drink"),
        Card(id: 9, image: "arrowshape.right.fill", offset: 0, title: "Pass"),
        Card(id: 10, image: "crown.fill", offset: 0, title: "If you ask a question to anyone, they have to reply starting with your highness"),
        Card(id: 11, image: "arrow.triangle.swap", offset: 0, title: "Swap beers with your leftside player"),
        Card(id: 12, image: "dollarsign", offset: 0, title: "Buy a beer for the one who's almost out of beer"),
        Card(id: 13, image: "arrow.triangle.swap", offset: 0, title: "Swap beers with your rightside player"),
        Card(id: 14, image: "person.fill.checkmark", offset: 0, title: "Truth or Dare"),
        Card(id: 15, image: "wineglass", offset: 0, title: "Order a tequila or vodka shot for yourself"),
        Card(id: 16, image: "flag.checkered.2.crossed", offset: 0, title: "Everyone should finish their drink"),
        Card(id: 17, image: "chair", offset: 0, title: "Change seats with a player you choose")




        
    ]
    
    @State var SpicyCards = [
        Card(id: 0, image: "figure.dress.line.vertical.figure", offset: 0, title: "Kiss the one your left"),
        Card(id: 1, image: "person.3.fill", offset: 0, title: "Kiss the one your right"),
        Card(id: 2, image: "figure.dress.line.vertical.figure", offset: 0, title: "Tell us a secret"),
        Card(id: 3, image: "figure.wave", offset: 0, title: "Tell us one of your kink"),
        Card(id: 4, image: "book.fill", offset: 0, title: "Set a new rule in game"),
        Card(id: 5, image: "text.word.spacing", offset: 0, title: "Choose 2 person to kiss"),
        Card(id: 6, image: "person.fill.questionmark", offset: 0, title: "Only girls gonna drink"),
        Card(id: 7, image: "person.fill.xmark", offset: 0, title: "True or false"),
        Card(id: 8, image: "eyes", offset: 0, title: "Choose who gonna drink"),
        Card(id: 9, image: "arrowshape.right.fill", offset: 0, title: "Pass"),
        Card(id: 10, image: "crown.fill", offset: 0, title: "Only boys gonna drink"),
        Card(id: 11, image: "arrow.triangle.swap", offset: 0, title: "You gonna drink"),
        Card(id: 12, image: "person.fill.checkmark", offset: 0, title: "Truth or Dare"),
        Card(id: 13, image: "mouth", offset: 0, title: "Choose a person to kiss"),
        Card(id: 14, image: "figure.wrestling", offset: 0, title: "Take off a piece of clothing item or show your nude to everyone"),
        Card(id: 15, image: "figure.2.and.child.holdinghands", offset: 0, title: "Call your mom or dad to announce your having a baby with your ex"),
        Card(id: 16, image: "apps.iphone", offset: 0, title: "Flirt with someone random and give them your phone number"),
        Card(id: 17, image: "exclamationmark.questionmark", offset: 0, title: "Choose one of the players to guess the color of your underwear, if correct you, if not they have to take it off"),
        Card(id: 18, image: "chair", offset: 0, title: "Change seats with a player you choose")

        
    ]
    @Environment(\.colorScheme) var colorScheme
    @State var counter = 0
    @State var randomNum: Int = 0
    @State var choosedBackgroundColor: Color = .blue
    @State var choosedSecondBackgroundColor: Color = .red

    @State private var showGreeting = true
    @State var choosedColor: Color = .white
    @State var gameMode: Bool
    @State var buttonImagaName: String = "flame.circle"
    @State var tappedButtonImagaName: String = "flame.circle.fill"

    
    private let colors: [Color] = [.red, .blue]
    private let maxScaleEffect: CGFloat = 4.0
    private let minScaleEffect: CGFloat = 0
    private let animationDuration = 0.6
    private let animationDelay = 0.1

    @State private var shouldTransition = true
    @State private var colorIndex = 0
    
    var body: some View {
        ZStack{
        
            /*if gameModeBinded{
               
                    
                   choosedBackgroundColor
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .ignoresSafeArea()
              
                  
                
            }else{
                
                    
                choosedSecondBackgroundColor                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                        .ignoresSafeArea()
                
            }
            */
            Circle()
                         .fill(previousColor)
                         .scaleEffect(maxScaleEffect)

                     Circle()
                         .fill(transitioningColor)
                         .scaleEffect(shouldTransition ? maxScaleEffect : minScaleEffect)

           
            
            VStack{
                Text("Serefe: Party Game")
                    .font(.system(size: 30))
                    .foregroundColor(.white)
                    .bold()
                    .offset(y: -60)
                
                Text(gameMode ? "Simple Fun!" : "Spicy Fun!")
                    .font(.subheadline)
                    .foregroundColor(.white)
                    .bold()
                    .offset(y: -50)
                    
            if counter != 0 {
                ZStack {
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 2)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                    
                    VStack {
                        Text(gameMode ? Cards[randomNum].title : SpicyCards[randomNum].title)
                            .foregroundColor(colorScheme == .dark ? .black : .black)
                            .font(.title)
                            .bold()
                            .frame(width: UIScreen.main.bounds.width / 1.6)
                            .offset(y: -UIScreen.main.bounds.height / 16)
                            .padding(.bottom,20)
                        
                        Image(systemName: gameMode ? Cards[randomNum].image : SpicyCards[randomNum].image)
                            .foregroundColor(colorScheme == .dark ? .black : .black)
                            .font(.system(size: 40))
                        
                        
                    }
                }
            }
            else{
                ZStack {
                    
                    Rectangle()
                        .frame(width: UIScreen.main.bounds.width / 1.3, height: UIScreen.main.bounds.height / 2)
                        .foregroundColor(.white)
                        .cornerRadius(40)
                    
                    VStack {
                        Text("Tap to start playing!")
                            .foregroundColor(colorScheme == .dark ? .black : .black)
                            .font(.title)
                            .bold()
                            .frame(width: UIScreen.main.bounds.width / 1.6)
                            .offset(y: -UIScreen.main.bounds.height / 15)
                        
                        
                        Image(systemName:"chevron.right")
                            .foregroundColor(colorScheme == .dark ? .black : .black)
                            .font(.system(size: 40))
                            .offset(y: UIScreen.main.bounds.height / 9)
                    }
                }
            }
              
           
            
               
                
                Spacer()
                
                Image(systemName: gameMode ? "drop.circle" : "flame.circle")
                    .resizable()
                    .animation(.easeIn)
                    .frame(width: 70, height: 70)
                    .foregroundColor(choosedColor)
                    .onTapGesture {
                    gameMode.toggle()
                    shouldTransition = false
                    colorIndex += 1

                    // Removing DispatchQueue here will cause the first transition not to work
                    DispatchQueue.main.asyncAfter(deadline: .now() + animationDelay) {
                        withAnimation(.easeInOut(duration: animationDuration)) {
                            shouldTransition = true
                        }
                    }
                }
                .foregroundColor(.primary)
                .padding(.top)
         
        }
            
        }.frame(height:(UIScreen.main.bounds.height / 1.8 ) )
            .padding(.horizontal,25)
            .onTapGesture {
                withAnimation{
                        counter += 1
                        Cards.shuffle()
                    SpicyCards.shuffle()
                }
            }
    }

    private var previousColor: Color {
        colors[colorIndex%colors.count]
    }

    private var transitioningColor: Color {
        colors[(colorIndex+1)%colors.count]
    }
}

struct Card: Identifiable{
    var id: Int
    var image: String
    var offset: CGFloat
    var title: String
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(gameMode: true)
    }
}
