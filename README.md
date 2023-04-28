[![Latest Version](https://img.shields.io/github/v/tag/ChristianFox/RawDog?sort=semver&label=Version&color=orange)](https://github.com/ChristianFox/RawDog/)
[![Swift](https://img.shields.io/badge/Swift-5.7-orange)](https://img.shields.io/badge/Swift-5.7-orange)
[![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-orange)](https://img.shields.io/badge/Platforms-macOS_iOS_tvOS_watchOS_Linux_Windows-orange)

[![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-yes-green)](https://img.shields.io/badge/Swift_Package_Manager-yes-green)
[![Cocoapods](https://img.shields.io/badge/Cocoapods-no-red)](https://img.shields.io/badge/Cocoapods-no-red)
[![Cathage](https://img.shields.io/badge/Cathage-no-red)](https://img.shields.io/badge/Cathage-no-red)
[![Manually](https://img.shields.io/badge/Manual_Import-yes-green)](https://img.shields.io/badge/Manually_Added-sure-green)

[![CodeCoverage](https://img.shields.io/badge/Code%20Coverage-100%25-green)](https://img.shields.io/badge/Code%20Coverage-100%25-green)
[![License](https://img.shields.io/badge/license-mit-blue.svg)](https://github.com/ChristianFox/RawDog/blob/master/LICENSE)
[![Contribution](https://img.shields.io/badge/Contributions-Welcome-blue)](https://github.com/ChristianFox/RawDog/labels/contribute)
[![First Timers Friendly](https://img.shields.io/badge/First_Timers-Welcome-blue)](https://github.com/ChristianFox/RawDog/labels/contribute)

[![Size](https://img.shields.io/github/repo-size/ChristianFox/RawDog?color=orange)](https://img.shields.io/github/repo-size/ChristianFox/RawDog?color=orange)
[![Files](https://img.shields.io/github/directory-file-count/ChristianFox/RawDog?color=orange)](https://img.shields.io/github/directory-file-count/ChristianFox/RawDog?color=orange)

# RawDog

RawDog is a Swift library that extends RawRepresentable types with arithmetic operations. 
It defines two protocols and an enum to handle arithmetic for types with fallible initializers and infallible initializers.

## Types

- **ArithmeticForFallibleType**: This protocol is for types that have a fallible initializer. The arithmetic operations return optional values to account for the possibility of failure.
- **ArithmeticForInfallibleType**: This protocol is for types that have an infallible initializer. The arithmetic operations always succeed and return non-optional values.
- **BinaryIntegerDivisionStrategy**: This enum defines three strategies for handling division of binary integers: floor, round, and ceiling.

## 🧪 Tests

The library is fully tested with 100% code coverage

## 💻 Installation

### Swift Package Manager
To add RawDog to your project using Swift Package Manager, add the following dependency in your Package.swift file:

```swift
dependencies: [
    .package(url: "https://github.com/ChristianFox/RawDog.git", from: "1.0.0")
]
```

Don't forget to add RawDog to your target dependencies:

```swift
targets: [
    .target(
        name: "YourTarget",
        dependencies: ["RawDog"]),
]
```

## 🛠️ Usage

To use RawDog conform your RawRepresentable type to either the `ArithmeticForFallibleType` or `ArithmeticForInfallibleType` protocol, depending on whether your type has a fallible or infallible initializer.

## Example

Here's an example of a struct that represents SISeconds with raw values (Based on Dave DeLong's Time, the inspiration for the library), conforming to the `ArithmeticForInfallibleType` protocol:

```swift
import RawDog

struct SISeconds: RawRepresentable, ArithmeticForInfallibleType {

	let rawValue: Double
	init(rawValue: Double) {
		self.rawValue = rawValue
	}
}
```

Simply by conforming to the `ArithmeticForInfallibleType` protocol
 you can now perform any of the following operations:

```swift

var a = SISeconds(rawValue: 60)
let b = SISeconds(rawValue: 3600)

let c = a + b // 3660
let d = a - b // 60
let e = a * b // 216000
let f = a / b // 60
a += b // 3660
a -= b // 60
a *= b // 216000
a /= b // 60

let aDouble = 2.0
let g = a ~+ aDouble // 62
let h = a ~- aDouble // 60
let i = a ~* aDouble // 120
let j = a ~/ aDouble // 60
a ~+= aDouble // 62
a ~-= aDouble // 60
a ~*= aDouble // 120
a ~/= aDouble // 60

```

## 🐕‍🦺 Support

Please [open an issue](https://github.com/ChristianFox/RawDog/issues/new) for support.

## 👷‍♂️ Contributing

Pull requests are welcome. I welcome developers of all skill levels to help improve the library, fix bugs, or add new features. 

For major changes, please open an issue first to discuss what you would like to change.

Before submitting a pull request, please ensure that your code adheres to the existing code style and conventions, and that all tests pass. Additionally, if you're adding new functionality, please make sure to include unit tests to verify the behavior.

If you have any questions or need assistance, feel free to [open an issue](https://github.com/ChristianFox/RawDog/issues/new), and I'll do my best to help you out. 

## 🪪 Licence

RawDog is available under the MIT license. See the LICENSE file for more info.

