//
//  IconTests.swift
//  
//
//  Created by Alsey Coleman Miller on 15/07/21.
//

import XCTest
@testable import OpenWeatherMap

final class IconTests: XCTestCase {
        
    func testCaseIterable() {
        
        let allIcons: [Icon] = [
            .day(.clearSky),
            .night(.clearSky),
            .day(.fewClouds),
            .night(.fewClouds),
            .day(.scatteredClouds),
            .night(.scatteredClouds),
            .day(.brokenClouds),
            .night(.brokenClouds),
        ]
        
        XCTAssertEqual(Icon.allCases, allIcons)
    }
}
