//
//  MemoryGame.swift
//  Class1
//
//  Created by Ge Wang on 10/14/20.
//

import Foundation

// This is the Model
struct MemoryGame<CardContent> where CardContent: Equatable{
    var cards: Array<Card>
    
    var indexOfTheOneAndOnlyFaceUpCard: Int? {
        get {
            /*
            var faceUpCardIndices = [Int]()
            for index in cards.indices {
                if cards[index].isFaceUp {
                    faceUpCardIndices.append(index)
                }
            }
            if faceUpCardIndices.count == 1 {
                return faceUpCardIndices.first
            } else {
                return nil
            }
             */
            //var faceUpCardIndices = cards.indices.filter {index in cards[index].isFaceUp}
            // 进一步简化
            cards.indices.filter {cards[$0].isFaceUp}.only
            
        }
        set {
            for index in cards.indices {
                /*
                if index == newValue {
                    cards[index].isFaceUp = true
                } else {
                    cards[index].isFaceUp = false
                }
                 */
                // 简写之后可以写成这样
                cards[index].isFaceUp = index == newValue
            }
        }
    }
    
    mutating func choose(card: Card) {
        print("card chose: \(card)")
        // if let something = xx, 如果要用&&的话，只能用逗号，逗号表示先执行之前的东西，然后干点别的
        if let chosenIndex = cards.firstIndex(matching: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched{
            if let potentialMatchIndex = indexOfTheOneAndOnlyFaceUpCard {
                // 这里直接用==的话会报错，因为MemoryGame是个generic type，有些type是不能被比较的，所以在MemoryGame后面加个限制，比较的generic是能被比较的
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfTheOneAndOnlyFaceUpCard = chosenIndex
            }
        }
        
    }
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex * 2))
            cards.append(Card(content: content, id: pairIndex * 2 + 1))
        }
    }
    
    struct Card: Identifiable {
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
        var id: Int
    }
}
