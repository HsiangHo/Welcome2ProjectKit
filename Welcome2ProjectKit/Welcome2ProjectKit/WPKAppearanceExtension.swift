//
//  WPKAppearanceExtension.swift
//  Welcome2ProjectKit
//
//  Created by Jovi on 8/21/19.
//  Copyright © 2019 Jovi. All rights reserved.
//

import Cocoa

enum OSAppearance: Int {
    case light
    case dark
}

extension NSAppearance {
    public static var isDarkMode: Bool {
        var bRslt = false
        if #available(OSX 10.15, *) {
            var appearance: OSAppearance = .light
            if let appleInterfaceStyle = UserDefaults.standard.object(forKey: "AppleInterfaceStyle") as? String {
                if appleInterfaceStyle.lowercased().contains("dark") {
                    appearance = .dark
                }
            }
            var switchesAutomatically: Bool = false
            if let appleInterfaceStyleSwitchesAutomatically =
                UserDefaults.standard.object(forKey: "AppleInterfaceStyleSwitchesAutomatically") as? Bool {
                switchesAutomatically = appleInterfaceStyleSwitchesAutomatically
            }
            if switchesAutomatically {
                switch appearance {
                case .light:
                    bRslt = true
                case .dark:
                    bRslt = false
                }
            } else {
                bRslt = appearance == .dark
            }

        } else if #available(OSX 10.14, *) {
            if let appleInterfaceStyle = UserDefaults.standard.object(forKey: "AppleInterfaceStyle") as? String {
                if appleInterfaceStyle.lowercased().contains("dark") {
                    bRslt = true
                }
            }
        }
        return bRslt
    }
}
