import XCTest
@testable import CountryCodesSwift


@available(macOS 13.0, *)
final class CountryCodesSwiftTests: XCTestCase {
    func testCountryCodesLoading() throws {
        let instance = try CountryCodesSwift.instantiate()
        XCTAssertEqual(instance.countryCodes.count, 242)
        XCTAssertEqual(instance.countryCodesByDialCode.count, 228)
    }


    func testCountryCodesLoadingPerformance() throws {
        measure {
            let _ = try? CountryCodesSwift.instantiate()
        }
    }

    func testCheckUSACountryCodeAndCanada() {
        let instance = try? CountryCodesSwift.instantiate()
        let countryCodes = instance?.recognizeCountry(from: "+134645756")
        XCTAssertEqual(countryCodes?.count, 2)
        XCTAssertEqual(countryCodes?.first?.name, "Canada")
        XCTAssertEqual(countryCodes?.last?.name, "United States")
    }


    func testCheckUkraine() {
        let instance = try? CountryCodesSwift.instantiate()
        let countryCodes = instance?.recognizeCountry(from: "+3804567458")
        XCTAssertEqual(countryCodes?.count, 1)
        XCTAssertEqual(countryCodes?.first?.name, "Ukraine")
    }

    func testChekUnitedKingdomAndIslands() {
        let instance = try? CountryCodesSwift.instantiate()
        let countryCodes = instance?.recognizeCountry(from: "+44123456789")
        XCTAssertEqual(countryCodes?.count, 4)
        let uk = countryCodes?.first(where: { code in
            code.name == "United Kingdom"
        })
        XCTAssertNotNil(uk)
    }


}


