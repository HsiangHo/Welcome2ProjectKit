//
//  WPKLabel.swift
//  Welcome2ProjectKit
//
//  Created by Jovi on 6/10/19.
//  Copyright © 2019 Jovi. All rights reserved.
//

import Cocoa

class WPKLabel: NSTextField {

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.isBezeled = false
        self.drawsBackground = false
        self.isEditable = false
        self.isSelectable = false
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
