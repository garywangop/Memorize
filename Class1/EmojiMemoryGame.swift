//
//  EmojiMemoryGame.swift
//  Class1
//
//  Created by Ge Wang on 10/14/20.
//

import SwiftUI

// This is the View

class EmojiMemoryGame {
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
    private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()
    
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
        model.choose(card: card)
    }
}
