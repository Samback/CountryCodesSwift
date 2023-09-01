# CountryCodesSwift Library

The `CountryCodesSwift` library is a Swift package designed for managing and working with country codes and phone number dial codes efficiently. With this library, you can:

- Recognize the countries associated with phone number dial codes.
- Group country codes by their respective dial codes for easy access.

## Installation

You can seamlessly integrate the `CountryCodesSwift` library into your Swift projects using Swift Package Manager (SPM).

### Swift Package Manager

1. In Xcode, navigate to "File" -> "Swift Packages" -> "Add Package Dependency..."
2. Enter the repository URL: `https://github.com/Samback/CountryCodesSwift.git`.
3. Select the library and add it to your project's target.

## Usage

### Initialization

The `CountryCodesSwift` struct simplifies the loading and management of country codes:

```swift
let countryCodesInstance = CountryCodesSwift()
```

The library will automatically attempt to load the country codes from a JSON file. If an error occurs during loading, it will handle it gracefully.

### Recognizing Countries by Dial Code

You can easily determine the countries associated with phone number dial codes using the `recognizeCountries(with:)` method:

```swift
let phoneNumber = "+134645756"
if let recognizedCountries = countryCodesInstance.recognizeCountries(with: phoneNumber) {
    // Handle the recognized countries
}
```

### Grouping Country Codes

The library provides a `countryCodesByDialCode` property, allowing you to access country codes grouped by their respective dial codes:

```swift
let countryCodesByDialCode = countryCodesInstance.countryCodesByDialCode
```

## Example Tests

The library includes example tests that demonstrate its functionality. You can refer to these tests in the test target of your project for further guidance on usage.

```swift
func testCheckUSACountryCodeAndCanada() {
    // Test recognizing USA and Canada from a phone number
}

func testCheckUkraine() {
    // Test recognizing Ukraine from a phone number
}

func testChekUnitedKingdomAndIslands() {
    // Test recognizing the United Kingdom and Islands from a phone number
}
```

## Contributing

Contributions to the `CountryCodesSwift` library are welcomed! If you have bug fixes, improvements, or new features to suggest, please open an issue or submit a pull request.

## License

This library is available under the [MIT License](LICENSE.md). Feel free to use it in your projects, and contributions are highly appreciated.

---

Thank you for choosing the `CountryCodesSwift` library! If you encounter any issues or have questions, please don't hesitate to reach out for assistance.
