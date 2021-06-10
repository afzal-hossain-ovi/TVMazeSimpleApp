//
//  Simple_App__TV_MAZE__Unit_Tests.swift
//  Simple App (TV MAZE) Unit Tests
//
//  Created by Afzal Hossain on 05.05.21.
//

import XCTest
@testable import Simple_App__TV_MAZE_

class Simple_App__TV_MAZE__Unit_Tests: XCTestCase {

    var showVM: ShowViewModel!
    
    override func setUp() {
        super.setUp()
        
        self.showVM = ShowViewModel(service: .init())
    }

    func test_show_list_empty() throws {
        
        self.showVM.showName = ""
        self.showVM.search()
        
        XCTAssertEqual(self.showVM.showList.count, 0)
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
