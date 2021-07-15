//
//  WeatherCodeTests.swift
//  
//
//  Created by Alsey Coleman Miller on 15/07/21.
//

import XCTest
@testable import OpenWeatherMap

final class WeatherCodeTests: XCTestCase {
    
    func testGroup() {
        
        XCTAssertEqual(WeatherCode.thunderstorm(.lightRain).group, .thunderstorm)
        XCTAssertEqual(WeatherCode.thunderstorm(.rain).group, .thunderstorm)
        XCTAssertEqual(WeatherCode.thunderstorm(.heavyRain).group, .thunderstorm)
        
        XCTAssertEqual(WeatherCode.clear.group, .clear)
        XCTAssertEqual(WeatherCode.clouds(.few).group, .clouds)
        XCTAssertEqual(WeatherCode.clouds(.scattered).group, .clouds)
        XCTAssertEqual(WeatherCode.clouds(.broken).group, .clouds)
        XCTAssertEqual(WeatherCode.clouds(.overcast).group, .clouds)
    }
}
