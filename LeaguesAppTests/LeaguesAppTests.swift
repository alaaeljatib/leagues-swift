//
//  LeaguesAppTests.swift
//  LeaguesAppTests
//
//  Created by Alaa Eljatib Etmaz Alsebaei on 2019-03-28.
//  Copyright © 2019 Alaa Eljatib Etmaz Alsebaei. All rights reserved.
//

import XCTest

@testable import Pods_LeaguesApp
@testable import LeaguesApp

class LeaguesAppTests: XCTestCase {
    
    var vc : LeaguesViewController?
    
    override func setUp() {
        super.setUp()
        
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        
        vc = storyBoard.instantiateViewController(withIdentifier: "LeaguesViewControllerIdentifier") as! LeaguesViewController
        
        let _ = vc!.view
    }
    
    override func tearDown() {
        
        vc = nil
        
        super.tearDown()
    }
    
    func testNumberOfTableViewCells() {
        
        XCTAssertEqual(vc!.leagues.count, SportsAPI.instance.leagues().count )
    }
    
    func testVcTitle() {
        
        XCTAssertEqual(vc!.title!, "Leagues" )
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
