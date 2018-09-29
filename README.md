[![Build Status](https://travis-ci.com/BobbyRohweder/NintendoSwitchEshop.svg?branch=master)](https://travis-ci.com/BobbyRohweder/NintendoSwitchEshop)

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

Any is free to contribute.
Just open a Pull Request or Issue.
Tests are preferred for new features.

## License

NintendoSwitchEshop is available under the MIT license. See the LICENSE file for more info.
