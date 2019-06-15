//
//  WPKView.swift
//  Welcome2ProjectKit
//
//  Created by Jovi on 6/13/19.
//  Copyright © 2019 Jovi. All rights reserved.
//

import Cocoa

class WPKView: NSView {

    private var trackingArea: NSTrackingArea?
    public var mouseEnteredCallback: ((_ event: NSEvent) -> Void)?
    public var mouseExitedCallback: ((_ event: NSEvent) -> Void)?

    override func mouseEntered(with event: NSEvent) {
        super.mouseEntered(with: event)
        if let callback = self.mouseEnteredCallback {
            callback(event)
        }
    }

    override func mouseExited(with event: NSEvent) {
        super.mouseExited(with: event)
        if let callback = self.mouseExitedCallback {
            callback(event)
        }
    }

    override func updateTrackingAreas() {
        super.updateTrackingAreas()
        if let taOld = trackingArea {
            removeTrackingArea(taOld)
        }
        trackingArea = NSTrackingArea(rect: self.bounds,
                                      options: [.inVisibleRect, .activeAlways, .mouseEnteredAndExited],
                                      owner: self,
                                      userInfo: nil)
        if let taNew = trackingArea {
            addTrackingArea(taNew)
        }
    }

}
