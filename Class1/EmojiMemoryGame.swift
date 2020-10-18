//
//  EmojiMemoryGame.swift
//  Class1
//
//  Created by Ge Wang on 10/14/20.
//

import SwiftUI

// This is the View

// ObservableObject: 放了这个关键词，model里faceup变了之后就能在view model里相应的变化了
class EmojiMemoryGame: ObservableObject {
    // 创造个access model的变量，直接取名叫model
    // 最好不要用model这个名字，因为这是个concept，叫game这种描述性的名字比较好，不然别人看起来很困惑
    // emoji的type是String，所以这里用String
    // 创建cardContentFactory的那几句话就是closure
    /*
     private var model: MemoryGame<String> = MemoryGame<String>(numberOfPairsOfCards: 2, cardContentFactory: {(pairIndex: Int) -> String in
             return "🦧"
         
     })
     */
    // 根据swift的特性，简化后就成为了下面这个样子
    // @Published：var model只要change了就broadcast the whole world
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis: Array<String> = ["🐶", "🐰", "🐻"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { pairIndex in
            return emojis[pairIndex]
        }
    }
    
    // MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    // MARK: - Intent(s)
    func choose(card: MemoryGame<String>.Card) {
        // object change之后，用下面这个send（）的method告诉全世界并publish
        // 但是object会老change，每个change的地方写下面这个东西就太麻烦了，所以写在var model那，只要model change了就broadcast
        // objectWillChange.send()
        model.choose(card: card)
    }
}
