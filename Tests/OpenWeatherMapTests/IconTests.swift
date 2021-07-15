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
    
    func testRawRepresentable() {
        
        let allIcons = [
            "01d",
            "01n",
            "02d",
            "02n",
            "03d",
            "03n",
            "04d",
            "04n",
        ]
        
        for (index, icon) in Icon.allCases.enumerated() {
            let rawValue = allIcons[index]
            XCTAssertEqual(icon.rawValue, rawValue)
            XCTAssertEqual(Icon(rawValue: rawValue), icon)
        }
    }
}
