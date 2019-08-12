import XCTest
@testable import MiniMorsModel

final class MiniMorsModelTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MiniMorsModel().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
