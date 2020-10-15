//
//  Class1App.swift
//  Class1
//
//  Created by Ge Wang on 10/13/20.
//

import SwiftUI

@main
struct Class1App: App {
    var body: some Scene {
        WindowGroup {
            let game = EmojiMemoryGame()
            ContentView(viewModel: game)
        }
    }
}
