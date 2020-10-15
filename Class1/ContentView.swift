//
//  ContentView.swift
//  Class1
//
//  Created by Ge Wang on 10/13/20.
//

import SwiftUI

// This is ViewModel
struct ContentView: View {
    var body: some View {
        return HStack {
            ForEach(0..<4) {index in
                cardView(isFaceUp: true)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(Font.largeTitle)
        
    }
}

struct cardView: View {
    var isFaceUp: Bool
    
    var body: some View {
        ZStack {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 3.0)
                Text("🦧")
            } else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
