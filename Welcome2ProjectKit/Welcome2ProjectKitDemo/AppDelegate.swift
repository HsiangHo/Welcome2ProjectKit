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
    var w2p: Welcome2Project?

    // swiftlint:disable function_body_length
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        w2p = Welcome2Project.init { () -> W2PConfigure in
            let icon = NSImage.init(named: "Xcode")
            let title = "Welcome to Xcode"
            let subtitle = "Version 10.2 (10E125)"
            // swiftlint:disable line_length
            let userChoiceObj1 = W2PUserChoiceObject.init(img: NSImage.init(named: "NewCheckoutTemplate")!,
                                                          title: "Clone an existing project",
                                                          subtitle: "Start working on something on Git repository.") { (choiceObj) in
                                                            if let obj = choiceObj as? W2PUserChoiceObject {
                                                                print("title:" + obj.title() + "\nSubtitle:" + obj.subtitle())
                                                            }
            }

            // swiftlint:disable line_length
            let userChoiceObj2 = W2PUserChoiceObject.init(img: NSImage.init(named: "NewProjectTemplate")!,
                                                          title: "Create a new Xcode project",
                                                          subtitle: "Create an app for iPhone, iPad, Mac, Apple Watch, or Apple TV.") { (choiceObj) in
                                                            if let obj = choiceObj as? W2PUserChoiceObject {
                                                                print("title:" + obj.title() + "\nSubtitle:" + obj.subtitle())
                                                            }
            }

            // swiftlint:disable line_length
            let userChoiceObj3 = W2PUserChoiceObject.init(img: NSImage.init(named: "NewPlaygroundTemplate")!,
                                                          title: "Get started with a playground",
                                                          subtitle: "Explore new ideas quickly and easily.") { (choiceObj) in
                                                            if let obj = choiceObj as? W2PUserChoiceObject {
                                                                print("title:" + obj.title() + "\nSubtitle:" + obj.subtitle())
                                                            }
            }
            let userChoiceObjs = [userChoiceObj1, userChoiceObj2, userChoiceObj3]
            let displayWhenLaunch = "     Show this window when Xcode launches"

            let fileObj1 = W2PFileObject.init(imageName: "project",
                                              fileName: "XUIKit",
                                              filePath: URL.init(fileURLWithPath: "/Work space/XUIKit"))
            let fileObj2 = W2PFileObject.init(imageName: "project",
                                              fileName: "Kaka",
                                              filePath: URL.init(fileURLWithPath: "/Work space/Kaka"))
            let fileObj3 = W2PFileObject.init(imageName: "project",
                                              fileName: "MacUpdateKit",
                                              filePath: URL.init(fileURLWithPath: "/Work space/MacUpdateKit"))

            let projectFileObjs = [fileObj1, fileObj2, fileObj3]

            let projectFileObjChosenClosure = { (projectFileObj: W2PUserChoiceProtocol?) -> Void in
                if let obj = projectFileObj {
                    print("title:" + obj.title() + "\nSubtitle:" + obj.subtitle())
                } else {
                    print("Open another project")
                }
            }

            let displayWhenLaunchStatusChangedClosure = { (state: NSControl.StateValue) -> Void in
                print(state.rawValue)
            }

            let openAnotherProject = "Open another project..."

            let conf = W2PConfigure.init(icon: icon!,
                                         title: title,
                                         subtitle: subtitle,
                                         userChoiceObjs: userChoiceObjs,
                                         displayWhenLaunch: displayWhenLaunch,
                                         projectFileObjs: projectFileObjs,
                                         projectFileObjChosenClosure: projectFileObjChosenClosure,
                                         displayWhenLaunchStatusChangedClosure: displayWhenLaunchStatusChangedClosure,
                                         openAnotherProject: openAnotherProject)
            return conf
        }
        w2p?.update()
        w2p?.show()

        DispatchQueue.main.asyncAfter(deadline: .now() + 30) {
            self.w2p?.close()
        }
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
