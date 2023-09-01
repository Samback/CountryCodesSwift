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

@available(macOS 13.0, *)
public struct CountryCodesSwift {

    public let countryCodes: [CountryCode]
    public let countryCodesByDialCode: [String: [CountryCode]]

    private init(countryCodes: [CountryCode]) {
        self.countryCodes = countryCodes
        self.countryCodesByDialCode = countryCodes.countryCodesByDialCode
    }

    static func instantiate() throws -> CountryCodesSwift {
        do {
            let countryCodes = try loadCountryCodes().get()
            return CountryCodesSwift(countryCodes: countryCodes)
        } catch {
            throw error
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

    func recognizeCountry(from phoneNumber: String) -> [CountryCode]? {
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
