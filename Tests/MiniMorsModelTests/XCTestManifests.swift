import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MiniMorsModelTests.allTests),
    ]
}
#endif
