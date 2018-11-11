import XCTest
import Sizes

class Tests: XCTestCase {
    
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
        
        window.rootViewController = UIViewController()
        
        XCTAssertNotNil(window.rootViewController)
        
        guard type(of: window.rootViewController!) == UIViewController.self else {
            XCTFail()
            return
        }
    }
    
    func testSizesWindowResignsKey() {
        let window = SizesWindow()
        window.rootViewController = UIViewController()
        window.presentConfiguration()
        XCTAssertFalse(window.isKeyWindow, "Sizes window is not resigning key window.")
    }
}
