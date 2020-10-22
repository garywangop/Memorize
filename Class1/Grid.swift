//
//  Grid.swift
//  Class1
//
//  Created by Ge Wang on 10/20/20.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView
    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            body(for: item, in: layout)
        }
    }
    
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = items.firstIndex(matching: item)!
        // Group is a view builder but does not provide anything like ZStack/HStack(是个viewbuilder但是不排版)
        // 按理来说应该这么写，但是这个程序实际运行的时候，我们不希望index是nil，所以价格感叹号，crash了最好，还能及时发现问题
        /*
        return Group {
            if index != nil {
                viewForItem(item)
                    .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                    .position(layout.location(ofItemAt: index!))
            }
        }
         感叹号也没必要加在.position(layout.location(ofItemAt: index!))，直接加载let index = ..就好，早发现nil早crash
         */
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
    
}



