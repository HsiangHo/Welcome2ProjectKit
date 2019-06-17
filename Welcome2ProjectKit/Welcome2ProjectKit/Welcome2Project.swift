//
//  Welcome2Project.swift
//  Welcome2ProjectKit
//
//  Created by Jovi on 6/16/19.
//  Copyright © 2019 Jovi. All rights reserved.
//

import Cocoa

public typealias ProjectFileObjChosenClosure = ((_ fobj: W2PUserChoiceProtocol?) -> Void)
public typealias DisplayWhenLaunchStatusChangedClosure = ((_ currentStatus: NSControl.StateValue) -> Void)

public struct W2PConfigure {
    //left view
    var icon: NSImage
    var title: String
    var subtitle: String
    // max choice count: 3
    var userChoiceObjs: [W2PUserChoiceProtocol & W2PUserInteractionChoiceProtocol]?
    var displayWhenLaunch: String

    //right view
    var projectFileObjs: [W2PUserChoiceProtocol]?
    //invoked when user choose a project file object
    var projectFileObjChosenClosure: ProjectFileObjChosenClosure?
    // invoked when the state changed
    var displayWhenLaunchStatusChangedClosure: DisplayWhenLaunchStatusChangedClosure?
    var openAnotherProject: String

    public init(icon: NSImage,
                title: String,
                subtitle: String,
                userChoiceObjs: [W2PUserChoiceProtocol & W2PUserInteractionChoiceProtocol]?,
                displayWhenLaunch: String,
                projectFileObjs: [W2PUserChoiceProtocol]?,
                projectFileObjChosenClosure: ProjectFileObjChosenClosure?,
                displayWhenLaunchStatusChangedClosure: DisplayWhenLaunchStatusChangedClosure?,
                openAnotherProject: String) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.userChoiceObjs = userChoiceObjs
        self.displayWhenLaunch = displayWhenLaunch
        self.projectFileObjs = projectFileObjs
        self.projectFileObjChosenClosure = projectFileObjChosenClosure
        self.displayWhenLaunchStatusChangedClosure = displayWhenLaunchStatusChangedClosure
        self.openAnotherProject = openAnotherProject
    }
}

public class Welcome2Project {
    private var _windowController: Welcome2ProjectWindowController!
    private var _configureClosure: (() -> W2PConfigure)

    public init(closure: @escaping (() -> W2PConfigure)) {
        _windowController = Welcome2ProjectWindowController.init()
        _configureClosure = closure
    }
}

// MARK: public methods
extension Welcome2Project {

    public func show() {
        NSApp.activate(ignoringOtherApps: true)
        _windowController.window?.center()
        _windowController.showWindow(nil)
    }

    public func close() {
        _windowController.close()
    }

    public func update() {
        let conf = _configureClosure()
        _windowController.updateUI(conf)
    }
}
