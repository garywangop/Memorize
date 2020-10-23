//
//  Array+Only.swift
//  Class1
//
//  Created by Ge Wang on 10/23/20.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
