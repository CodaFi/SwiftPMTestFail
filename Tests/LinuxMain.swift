import XCTest

import SwiftPMTestFailTests

var tests = [XCTestCaseEntry]()
tests += SwiftPMTestFailTests.allTests()
XCTMain(tests)
