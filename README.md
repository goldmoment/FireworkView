# FireworkView

[![CI Status](http://img.shields.io/travis/Vien V.Nguyen/FireworkView.svg?style=flat)](https://travis-ci.org/Vien V.Nguyen/FireworkView)
[![Version](https://img.shields.io/cocoapods/v/FireworkView.svg?style=flat)](http://cocoapods.org/pods/FireworkView)
[![License](https://img.shields.io/cocoapods/l/FireworkView.svg?style=flat)](http://cocoapods.org/pods/FireworkView)
[![Platform](https://img.shields.io/cocoapods/p/FireworkView.svg?style=flat)](http://cocoapods.org/pods/FireworkView)

## Example
![alt tag](https://drive.google.com/uc?export=download&id=0B2B3XOiJL1C6bzRWQVBfaTlKN2M)

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

FireworkView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "FireworkView"
```
## Usage

```swift
let firework = FireworkView()
firework.translatesAutoresizingMaskIntoConstraints = false
self.view.addSubview(firework)
        
self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
    "H:|-0-[firework]-0-|",
    options: [], metrics: nil, views: ["firework" : firework]))
self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat(
    "V:|-0-[firework]-0-|",
    options: [], metrics: nil, views: ["firework" : firework]))
```

## Author

Vien V.Nguyen, nguyenvanvienqn@gmail.com

## License

FireworkView is available under the MIT license. See the LICENSE file for more info.
