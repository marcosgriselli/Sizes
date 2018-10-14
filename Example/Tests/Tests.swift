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
        XCTAssertNotNil(window.sizesViewController)
        XCTAssertNotNil(window.containedRootViewController)
        
        guard type(of: window.rootViewController!) == SizesViewController.self else {
            XCTFail()
            return
        }
        
        guard type(of: window.containedRootViewController!) == UIViewController.self else {
            XCTFail()
            return
        }
    }
}
