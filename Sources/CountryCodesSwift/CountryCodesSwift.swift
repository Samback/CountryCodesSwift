import Foundation

extension Sequence where Element == CountryCode {
    var countryCodesByDialCode: [String: [CountryCode]] {
        return reduce(into: [:]) { (result, countryCode) in
            if result[countryCode.dialCode] == nil {
                result[countryCode.dialCode] = []
            }
            result[countryCode.dialCode]?.append(countryCode)
        }
    }
}

public struct CountryCodesSwift {

    public let countryCodes: [CountryCode]
    public let countryCodesByDialCode: [String: [CountryCode]]

    public init() {
        do {
            let countryCodes = try CountryCodesSwift.loadCountryCodes().get()
            self.countryCodes = countryCodes
            self.countryCodesByDialCode = countryCodes.countryCodesByDialCode
        } catch {
            print("Error loading country codes: \(error)")
            self.countryCodes = []
            self.countryCodesByDialCode = [:]
        }
    }

    static func loadCountryCodes() -> Result<[CountryCode], Error> {
        return Result {
            if let url = Bundle.module.url(forResource: "countryCodes", withExtension: "json", subdirectory:"Resources") {
                do {
                    let data = try Data(contentsOf: url)
                    let countryCodes = try JSONDecoder().decode([CountryCode].self, from: data)
                    return countryCodes
                } catch {
                    throw error
                }
            } else {
                throw NSError(domain: "CountryCodesLoader", code: 0, userInfo: [NSLocalizedDescriptionKey: "Could not find countryCodes.json"])
            }
        }
    }

    public func recognizeCountries(with phoneNumber: String) -> [CountryCode]? {
        guard !phoneNumber.isEmpty else {
            return nil
        }

        for i in (2...4).reversed() {
            let prefix = String(phoneNumber.prefix(i))
            if let countryCode = countryCodesByDialCode[prefix] {
                return countryCode
            }
        }

        return nil
    }

}
