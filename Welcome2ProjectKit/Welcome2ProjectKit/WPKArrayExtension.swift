//
//  WPKArrayExtension.swift
//  Welcome2ProjectKit
//
//  Created by Jovi on 6/17/19.
//  Copyright © 2019 Jovi. All rights reserved.
//

import Foundation

extension Array {
    public subscript(safeIndex index: Int) -> Element? {
        guard index >= 0, index < endIndex else {
            return nil
        }

        return self[index]
    }
}
