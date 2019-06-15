//
//  AppDelegate.swift
//  Welcome2ProjectKitDemo
//
//  Created by Jovi on 6/10/19.
//  Copyright © 2019 Jovi. All rights reserved.
//

import Cocoa
import Welcome2ProjectKit

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    let welcome2project = Welcome2ProjectWindowController.init()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        welcome2project.window?.center()
        welcome2project.showWindow(nil)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
