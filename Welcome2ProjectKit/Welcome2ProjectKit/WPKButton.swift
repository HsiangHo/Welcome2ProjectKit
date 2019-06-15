//
//  WPKButton.swift
//  Welcome2ProjectKit
//
//  Created by Jovi on 6/14/19.
//  Copyright © 2019 Jovi. All rights reserved.
//

import Cocoa

class WPKButton: NSButton {

    open var lbTitle: WPKLabel!
    open var lbSubTitle: WPKLabel!

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.bezelStyle = .regularSquare
        self.isBordered = false
        self.setButtonType(.momentaryChange)
        self.imagePosition = .imageLeft
        self.focusRingType = .none
        self.title = ""

        let offsetX: CGFloat = 40
        lbTitle = WPKLabel.init(frame: NSRect(x: offsetX,
                                              y: self.bounds.height / 2 - 16,
                                              width: self.bounds.width - offsetX,
                                              height: 18))
        lbTitle.lineBreakMode = .byTruncatingTail
        lbTitle.font = NSFont.init(name: "Helvetica Neue Medium", size: 13)
        self.addSubview(lbTitle)

        lbSubTitle = WPKLabel.init(frame: NSRect(x: offsetX,
                                              y: self.bounds.height / 2 + 2,
                                              width: self.bounds.width - offsetX,
                                              height: self.bounds.height / 2))
        lbSubTitle.lineBreakMode = .byTruncatingTail
        lbSubTitle.font = NSFont.init(name: "Helvetica Neue Light", size: 12)
        self.addSubview(lbSubTitle)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
