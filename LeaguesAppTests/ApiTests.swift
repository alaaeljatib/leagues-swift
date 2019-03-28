//
//  APITests.swift
//  LeaguesAppTests
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-28.
//  Copyright © 2019 Alaa. All rights reserved.
//

import XCTest

class APITests: XCTestCase {
    
    func testNumberOfLeaguesRetrieved() {
        XCTAssertEqual(SportsAPI.instance.leagues().count, 62)
    }
    
}
