import Flutter
import UIKit
import XCTest

class RunnerTests: XCTestCase {

  func testAppDelegateExists() {
    let appDelegate = UIApplication.shared.delegate
    XCTAssertNotNil(appDelegate)
    XCTAssertTrue(appDelegate is FlutterAppDelegate)
  }

}
