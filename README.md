[![Release](https://img.shields.io/badge/release-1.0-blue.svg)](https://github.com/HsiangHo/Welcome2ProjectKit)
[![Platform](https://img.shields.io/badge/platform-macOS%20%7C%20OS%20X%2010.8%2B-orange.svg)](https://github.com/HsiangHo/Welcome2ProjectKit)
[![Language](https://img.shields.io/badge/language-swift-red.svg)](https://github.com/HsiangHo/Welcome2ProjectKit)

Welcome2ProjectKit is an easy way to create a welcome window like Xcode for cocoa developers.

<img src="docs/Screen Shot 1.png" width="380px">
  
## Features

- [x] Customization and Configuration as your needs (for localization).
- [x] Easy to handle all the user's choice.
  
## Example

To run the example project, clone the repo and complete the "Welcome2ProjectKitDemo".

## Let's get started 🕶

### Configure your cocoa application

- Basic configuration
  
```
w2p = Welcome2Project.init { () -> W2PConfigure in
            let icon = NSImage.init(named: "Xcode")
            let title = "Welcome to Xcode"
            let subtitle = "Version 10.2 (10E125)"
            // swiftlint:disable line_length
            let userChoiceObj1 = W2PUserChoiceObject.init(img: NSImage.init(named: "NewCheckoutTemplate")!,
                                                          title: "Clone an existing project",
                                                          subtitle: "Start working on something on Gir repository.") { (choiceObj) in
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
```

- Show & Hide welcome window

```
// Show
w2p?.update()
w2p?.show()

// Hide
w2p?.close()
```


## Requirements

- Runtime: OS X 10.10+

## Usage

- Clone the rep, build the Welcome2ProjectKit or copy all the source files into your project.
- Configure as you want, show the welcome window and handle all the things.
