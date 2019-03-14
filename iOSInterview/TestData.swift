//
//  TestData.swift
//  iOSInterview
//
//  Created by Robin Senior on 2016-07-21.
//  Copyright © 2016 thescore. All rights reserved.
//

import Foundation

open class TestData {
	
	/// A list of all players on the team
	var roster: [String] {
		return ["robin", "nick", "anluan", "cody", "hao", "paddy", "jessica", "darren", "charles", "taimur"]
	}
	
	/// A list of active players on the team
	var playing: [String] {
		return ["robin", "nick", "anluan", "cody", "hao"]
	}
	
	/// A list of injured players on the team
	var injured: [String] {
		return ["paddy", "jessica", "darren", "charles", "taimur"]
	}
	
	/**
	Fetch news headlines asynchronously.
	
	- parameter count:			the number of articles to fetch
	- parameter completion:	a closure that takes an array of Strings as a parameter
	*/
	func fetchNewsHeadlines(_ count: Int, completion: ([String]) -> ()) {
		
		let articles = (0..<count).map { String($0) }
		
		completion(articles)
	}
	
}
