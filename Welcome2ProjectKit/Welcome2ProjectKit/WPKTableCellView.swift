//
//  WPKTableCellView.swift
//  Welcome2ProjectKit
//
//  Created by Jovi on 6/13/19.
//  Copyright © 2019 Jovi. All rights reserved.
//

import Cocoa

class WPKTableCellView: NSTableCellView {

    private var ivIcon: NSImageView?
    private var lbTitle: WPKLabel?
    private var lbSubTitle: WPKLabel?

    init() {
        super.init(frame: NSRect(x: 0, y: 0, width: 305, height: 40))
        let ivImage = NSImageView.init(frame: NSRect(x: 7, y: 2, width: 36, height: 36))
        self.addSubview(ivImage)
        self.ivIcon = ivImage

        let lbT = WPKLabel.init(frame: NSRect(x: ivImage.frame.maxX + 5, y: 18, width: 250, height: 17))
        lbT.stringValue = ""
        lbT.font = NSFont.init(name: "Helvetica Neue", size: 13)
        lbT.lineBreakMode = .byTruncatingHead
        self.addSubview(lbT)
        self.lbTitle = lbT

        let lbS = WPKLabel.init(frame: NSRect(x: ivImage.frame.maxX + 5, y: 4, width: 250, height: 14))
        lbS.stringValue = ""
        lbS.font = NSFont.init(name: "Helvetica Neue Light", size: 11)
        self.addSubview(lbS)
        self.lbSubTitle = lbS
    }

    required init?(coder decoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func updateUI(img: NSImage, title: String, subtitle: String) {
        self.ivIcon?.image = img
        self.lbTitle?.stringValue = title
        self.lbSubTitle?.stringValue = subtitle
    }
}
