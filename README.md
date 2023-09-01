# CountryCodesSwift Library

The `CountryCodesSwift` library is a Swift package that provides functionality for working with country codes based on dial codes. It allows you to load a list of country codes from a JSON file, recognize the country from a phone number dial code, and retrieve a list of country codes grouped by dial code. 

## Features

- Load a list of country codes from a JSON file.
- Recognize the country from a phone number dial code.
- Group country codes by dial code for easy access.

## Installation

You can easily integrate the `CountryCodesSwift` library into your Swift projects using Swift Package Manager (SPM).

### Swift Package Manager

1. In Xcode, go to "File" -> "Swift Packages" -> "Add Package Dependency..."
2. Enter the repository URL: `[URL_TO_YOUR_GITHUB_REPOSITORY]`.
3. Select the library and add it to your target.

## Usage

Before using the library, it's essential to understand the `CountryCode` structure, which represents individual country code information:

```swift
public struct CountryCode: Codable {
    let name: String
    let code: String
    let dialCode: String
    let emoji: String
}
```

This structure contains the following properties:

- `name`: The name of the country.
- `code`: The country code (e.g., "US" for the United States).
- `dialCode`: The phone number dial code (e.g., "+1" for the United States).
- `emoji`: The country's flag emoji.

### Loading Country Codes

To use the library, you must load the country codes from a JSON file. Here's how you can do it:

```swift
do {
    let instance = try CountryCodesSwift.instantiate()
} catch {
    // Handle the error
}
```

### Recognizing Country from Phone Number

You can use the `recognizeCountry(from:)` method to determine the country from a phone number's dial code:

```swift
let phoneNumber = "+134645756"
if let countryCodes = instance?.recognizeCountry(from: phoneNumber) {
    // Handle the recognized country codes
}
```

### Grouping Country Codes by Dial Code

The library provides a property called `countryCodesByDialCode`, which returns a dictionary of country codes grouped by dial code:

```swift
let countryCodesByDialCode = instance?.countryCodesByDialCode
```


## Contributing

Contributions to the `CountryCodesSwift` library are welcome! If you have any bug fixes, improvements, or new features to suggest, please open an issue or submit a pull request.

## License

This library is available under the [MIT License](LICENSE.md). Feel free to use it in your projects, and contributions are appreciated.

---

Thank you for using the `CountryCodesSwift` library! If you encounter any issues or have questions, please don't hesitate to reach out for assistance.
