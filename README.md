<img width="100%" style="margin: 0 0 0 -20px" src="https://cdn.rawgit.com/marcosgriselli/Sizes/92ced2ee616420c03911883df4d26649ab2317aa/Assets/sizes.svg"/>

![Version](https://img.shields.io/cocoapods/v/Sizes.svg)
![Swift 4.1](https://img.shields.io/badge/Swift-4.2-orange.svg)
![iOS 10.0+](https://img.shields.io/badge/Platforms-iOS-blue.svg?style=flat)
![Cartage](https://img.shields.io/badge/carthage-compatible-4BC51D.svg?style=flat)
![License](https://img.shields.io/cocoapods/l/Sizes.svg?style=flat)
![Bitrise](https://app.bitrise.io/app/02750afc49040d6e.svg?token=rkcro6IeTOoi0785LC7DkA)

Sizes reduces the time it takes to evaluate all of our apps possible device sizes, orientations and font combinations. With Sizes we'll avoid launching all the supported devices simulator, running our app and navigating through each screen manually which not only takes a lot of time but its also highly error prone since we sometimes forget to test one particular combination and we ship a screen with a layout bug to the App Store.

## 📱 Sizes in action

<img src="https://cdn.rawgit.com/marcosgriselli/Sizes/92ced2ee616420c03911883df4d26649ab2317aa/Assets/sizes_short.gif"/>

*Recorded on an 10.5 inch iPad Pro*

## 🌟 Features

- [x] Inspect your app in multiple device sizes
- [x] Switch orientations
- [x] Test all font sizes
- [x] Universal (iPhone & iPad)

### 💡 Demo

To run the demo project, clone the repo and run `Sizes` target.

## 📲 Installation

#### Using [CocoaPods](https://cocoapods.org)

Edit your `Podfile` and specify the dependency:

```ruby
pod 'Sizes'
```

#### Using [Carthage](https://github.com/carthage)

Edit your `Cartfile` and specify the dependency:

```bash
github 'marcosgriselli/Sizes'
```

## 👩‍💻 How to use

### Preparations

Sizes require you to use [Auto Layout]((https://developer.apple.com/library/archive/documentation/UserExperience/Conceptual/AutolayoutPG/)) in order to update the UI correctly with each change.

For font updates you'll need to use [Dynamic Type](https://developer.apple.com/design/human-interface-guidelines/ios/visual-design/typography/).

**Programmatically:**

```swift 
let label = UILabel()
label.font = UIFont.preferredFont(forTextStyle: .headline, compatibleWith: traitCollection)
label.adjustsFontForContentSizeCategory = true
```

**IB/Storyboard:**

<img src="https://cdn.rawgit.com/marcosgriselli/Sizes/92ced2ee616420c03911883df4d26649ab2317aa/Assets/inspector.png"/>

### Setup

In order to use Sizes you'll need to make your `AppDelegate's` rootViewController an instance of `SizesViewController` and contain the apps first view controller.

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let root = SizesViewController()
    let navigation = UINavigationController(rootViewController: ViewController())
    window.rootViewController = root
    root.contain(viewController: navigation)
    window.makeKeyAndVisible()
    return true
}
```

⚠️ This might not be the ideal solution for all cases since it will require you to set the root view controller manually. Or if you're accessing the apps root view controller from many places this approach will clash with it.

⚠️ I recommend you only use this while on `#DEBUG` mode

I'm open to exploring new solutions to this issue + ways of setting this up on Storyboards.

### Usage

Shake to display the Sizes configuration UI, then tap on one of the orientation/device options to trigger a change. Or update the Text size slider to navigate through the different font sizes, you'll get the font name as you slide. You can check a longer video implementation and some of the use cases of Sizes in [this tweet](https://twitter.com/marcosgriselli/status/1038459645596250114)

<img width="200px" src="https://cdn.rawgit.com/marcosgriselli/Sizes/92ced2ee616420c03911883df4d26649ab2317aa/Assets/example.jpeg"/>


## 🛣 Roadmap

You can check the GitHub [Project](https://github.com/marcosgriselli/Sizes/projects/1) or [Issues](https://github.com/marcosgriselli/Sizes/issues) to get an overview of new features, fixes or releases planed. 

## ❤️ Contributing
This is an open source project, so feel free to contribute. How?
- Open an [issue](https://github.com/marcosgriselli/Sizes/issues/new).
- Send feedback via [twitter](https://twitter.com/marcosgriselli).
- Propose your own fixes, suggestions and open a pull request with the changes.

See [all contributors](https://github.com/marcosgriselli/Sizes/graphs/contributors)

## 📣 Mentions

- [iOS Goodies #250](https://ios-goodies.com/post/178728323086/week-250)
- [AppCoda Weekly](http://digest.appcoda.com/issues/appcoda-weekly-issue-92-137765)
- [iOS Dev Weekly](https://iosdevweekly.com/issues/373#tools) 

## 👨‍💻 Author
Marcos Griselli | <a href="url"><img src="https://cdn.rawgit.com/marcosgriselli/ViewAnimator/cf065e96/Resources/twitterLogo.svg" height="17"></a> [@marcosgriselli](https://twitter.com/marcosgriselli)

[![Twitter Follow](https://img.shields.io/twitter/follow/marcosgriselli.svg?style=social)](https://twitter.com/marcosgriselli)

[![GitHub Follow](https://img.shields.io/github/followers/marcosgriselli.svg?style=social&label=Follow)](https://github.com/marcosgriselli)

## 🛡 License

```
MIT License

Copyright (c) 2018 Marcos Griselli

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
