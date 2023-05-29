//
//  toggleView.swift
//  CardGame
//
//  Created by Ömür Şenocak on 5.05.2023.
//

import SwiftUI

struct toggleView: View {
    @State private var showGreeting = true
    @State var choosedColor: Color = .white
    @Binding var gameMode: Bool 
    @State var buttonImagaName: String = "flame.circle"
    @State var tappedButtonImagaName: String = "flame.circle.fill"

    var body: some View {
        VStack {
                     
            Image(systemName: gameMode ? "flame.circle" : "drop.circle")
                .resizable()
                .animation(.easeIn)
                .frame(width: 70, height: 70)
                .foregroundColor(choosedColor)
                .onTapGesture {
                    gameMode.toggle()
                    if gameMode {
                      
                    withAnimation{choosedColor = .white}
                        
                    }else{
                        withAnimation{choosedColor = .white}

                    }
                    
                }
             
        }
    }
}

struct toggleView_Previews: PreviewProvider {
    static var previews: some View {
        toggleView(gameMode: .constant(true))
    }
}
