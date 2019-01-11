import XCTest
import Sizes

class WindowTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        continueAfterFailure = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSizesWindow() {
        let window = SizesWindow()
        XCTAssertNil(window.rootViewController)
        let viewController = UIViewController()
        window.rootViewController = viewController
        XCTAssertEqual(window.rootViewController, viewController)
    }
    
    func testSizesWindowResignsKey() {
        let window = SizesWindow()
        window.rootViewController = UIViewController()
        window.presentConfiguration()
        XCTAssertFalse(window.isKeyWindow)
    }
}
