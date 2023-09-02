import XCTest
@testable import CountryCodesSwift


final class CountryCodesSwiftTests: XCTestCase {

    func testFileAvailability() {
        if let url = Bundle.module.url(forResource: "countryCodes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                XCTAssertNotNil(data)

            } catch {
                XCTAssertNil(error)
            }
        } else {
            XCTFail("File not found")
        }
    }

    func testCountryCodesLoading() throws {
        let instance = CountryCodesSwift()
        XCTAssertEqual(instance.countryCodes.count, 242)
        XCTAssertEqual(instance.countryCodesByDialCode.count, 228)
    }


    func testCountryCodesLoadingPerformance() throws {
        measure {
            let _  = CountryCodesSwift()
        }
    }

    func testCheckUSACountryCodeAndCanada() {
        let instance = CountryCodesSwift()
        let countryCodes = instance.recognizeCountries(with: "+134645756")
        XCTAssertEqual(countryCodes?.count, 2)
        XCTAssertEqual(countryCodes?.first?.name, "Canada")
        XCTAssertEqual(countryCodes?.last?.name, "United States")
    }

    func testCheckUSACountryCodeAndCanadaWithoutPlus() {
        let instance = CountryCodesSwift()
        let countryCodes = instance.recognizeCountries(with: "134645756")
        XCTAssertEqual(countryCodes?.count, 2)
        XCTAssertEqual(countryCodes?.first?.name, "Canada")
        XCTAssertEqual(countryCodes?.last?.name, "United States")
    }


    func testCheckUkraine() {
        let instance = CountryCodesSwift()
        let countryCodes = instance.recognizeCountries(with: "+3804567458")
        XCTAssertEqual(countryCodes?.count, 1)
        XCTAssertEqual(countryCodes?.first?.name, "Ukraine")
    }

    func testChekUnitedKingdomAndIslands() {
        let instance = CountryCodesSwift()
        let countryCodes = instance.recognizeCountries(with: "+44123456789")
        XCTAssertEqual(countryCodes?.count, 4)
        let uk = countryCodes?.first(where: { code in
            code.name == "United Kingdom"
        })
        XCTAssertNotNil(uk)
    }


}


