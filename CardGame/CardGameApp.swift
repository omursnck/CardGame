//
//  CardGameApp.swift
//  CardGame
//
//  Created by Ömür Şenocak on 2.05.2023.
//

import SwiftUI

@main
struct CardGameApp: App {
    @State private var showSplash = true

       var body: some Scene {
           WindowGroup {
               Group {
                   if showSplash {
                       SplashView(showSplash: $showSplash) {
                           // Perform any necessary tasks when splash screen is dismissed
                           // For example, transition to the main content view
                           // contentView = ContentView()
                       }
                   } else {
                       // contentView
                       ContentView(gameMode: true)
                   }
               }
           }
       }
}
