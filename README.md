[![Build Status](https://travis-ci.com/BobbyRohweder/NintendoSwitchEshop.svg?branch=master)](https://travis-ci.com/BobbyRohweder/NintendoSwitchEshop)
[![codecov](https://codecov.io/gh/BobbyRohweder/NintendoSwitchEshop/branch/master/graph/badge.svg)](https://codecov.io/gh/BobbyRohweder/NintendoSwitchEshop)
![](https://img.shields.io/badge/platform-ios-lightgrey.svg)
![Swift 4.2](https://img.shields.io/badge/swift-4.2-orange.svg)
[![Donate](https://img.shields.io/badge/Donate-PayPal-blue.svg)](https://paypal.me/BobbyRohweder)

# NintendoSwitchEshop

## About
**NintendoSwitchEshop** is a Swift Framework written to extract Nintendo Switch's eShop game information.

## Usage

Get America Games
```Swift
import NintendoSwitchEshop

let nintendoSwitchEshop = NintendoSwitchEshop()
nintendoSwitchEshop.getGamesInAmerica { games, error in
    // Use games (provided as an array of GameUS objects)
}
```

Get Europe Games
```Swift
import NintendoSwitchEshop

let nintendoSwitchEshop = NintendoSwitchEshop()
nintendoSwitchEshop.getGamesInEurope { games, error in
    // Use games (provided as an array of GameEU objects)
}
```

## Contribute

Anyone is free to contribute.
Just open a Pull Request or Issue.
Tests are preferred for new features.

## License

NintendoSwitchEshop is available under the MIT license. See the LICENSE file for more info.
