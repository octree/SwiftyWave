# Sound Waves View in Swift

[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/SwiftyWave.svg)](https://img.shields.io/cocoapods/v/SwiftyWave.svg)[![Carthage Compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)![Platform](https://img.shields.io/cocoapods/p/SwiftyWave.svg?style=flat)



![Capture.GIF](./images/capture.gif)

## Requirements

* iOS 9.0+
* Xcode 10.0+
* Swift 4.2+

## Installation

### CocoaPods

```
pod 'SwiftyWave', '~> 1.1.0'

```

### Carthage

```
github "Octree/SwiftyWave" ~> 1.1.0
```

## Usage

```swift
let waveView = SwiftyWaveView(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
view.addSubview(waveView)
waveView.start()
```

### Code

```swift
let waveView = SwiftyWaveView(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
self.view.addSubview(waveView)
waveView.start()
```

### Storyboard


## License

SwiftyWave is released under the WTFPL license. (Do What the Fuck You Want to Public License)

