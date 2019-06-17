//
//  WPKCheckBox.swift
//  Welcome2ProjectKit
//
//  Created by Jovi on 6/10/19.
//  Copyright © 2019 Jovi. All rights reserved.
//

import Cocoa

class WPKCheckBox: NSButton {

    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        self.wantsLayer = true
        self.bezelStyle = .regularSquare
        self.isBordered = false
        self.setButtonType(.momentaryChange)
        self.imagePosition = .imageLeft
        self.focusRingType = .none
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // swiftlint:disable function_body_length
    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)
        let fillColor = NSColor(hex: "4D90E2", alpha: 1.0)
        if .on == self.state {
            let bezierPath = NSBezierPath()
            bezierPath.move(to: NSPoint(x: 8, y: 0))
            bezierPath.curve(to: NSPoint(x: 0, y: 8),
                             controlPoint1: NSPoint(x: 3.58, y: 0),
                             controlPoint2: NSPoint(x: 0, y: 3.58))
            bezierPath.curve(to: NSPoint(x: 8, y: 16),
                             controlPoint1: NSPoint(x: 0, y: 12.42),
                             controlPoint2: NSPoint(x: 3.58, y: 16))
            bezierPath.curve(to: NSPoint(x: 16, y: 8),
                             controlPoint1: NSPoint(x: 12.42, y: 16),
                             controlPoint2: NSPoint(x: 16, y: 12.42))
            bezierPath.curve(to: NSPoint(x: 8, y: 0),
                             controlPoint1: NSPoint(x: 16, y: 3.58),
                             controlPoint2: NSPoint(x: 12.42, y: 0))
            bezierPath.close()
            bezierPath.move(to: NSPoint(x: 6.53, y: 12.11))
            bezierPath.line(to: NSPoint(x: 3.01, y: 8.59))
            bezierPath.line(to: NSPoint(x: 4.18, y: 7.41))
            bezierPath.line(to: NSPoint(x: 6.53, y: 9.76))
            bezierPath.line(to: NSPoint(x: 11.82, y: 4.48))
            bezierPath.line(to: NSPoint(x: 12.99, y: 5.65))
            bezierPath.line(to: NSPoint(x: 6.53, y: 12.11))
            bezierPath.close()
            fillColor.setFill()
            bezierPath.fill()
        } else {
            let bezierPath = NSBezierPath()
            bezierPath.move(to: NSPoint(x: 8, y: 1))
            bezierPath.curve(to: NSPoint(x: 1, y: 8),
                             controlPoint1: NSPoint(x: 4.13, y: 1),
                             controlPoint2: NSPoint(x: 1, y: 4.13))
            bezierPath.curve(to: NSPoint(x: 8, y: 15),
                             controlPoint1: NSPoint(x: 1, y: 11.87),
                             controlPoint2: NSPoint(x: 4.13, y: 15))
            bezierPath.curve(to: NSPoint(x: 15, y: 8),
                             controlPoint1: NSPoint(x: 11.87, y: 15),
                             controlPoint2: NSPoint(x: 15, y: 11.87))
            bezierPath.curve(to: NSPoint(x: 8, y: 1),
                             controlPoint1: NSPoint(x: 15, y: 4.13),
                             controlPoint2: NSPoint(x: 11.87, y: 1))
            bezierPath.close()
            fillColor.setStroke()
            bezierPath.lineWidth = 1.5
            bezierPath.stroke()
        }
    }
}
