//
//  ParserEvalTests.swift
//  ParserEvalTests
//
//  Created by jay on 3/5/17.
//  Copyright © 2017 jay. All rights reserved.
//

import XCTest
@testable import SwiftyJSON
@testable import JJson

class ParserEvalTests: XCTestCase {
    
    var data: Data!
    var jJSON: JJSON!
    var swiftyJSON: JSON!
    
    override func setUp() {
        super.setUp()
        data = loadData(forFilename: "json")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testJJsonConstructorPerformance() {
        self.measure {
            self.jJSON = JJSON(data: self.data)
        }
    }
    
    func testSwiftyJSONConstructorPerformance() {
        self.measure {
          self.swiftyJSON = JSON(data: self.data)
        }
    }
    
    func loadData(forFilename fileName: String) -> Data? {
        if let url = Bundle(for: self.classForCoder).url(forResource: fileName, withExtension: "json") {
            if let data = try? Data(contentsOf: url) {
                return data
            }
        }
        return nil
    }
}
