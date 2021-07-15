//
//  Icon.swift
//  
//
//  Created by Alsey Coleman Miller on 15/07/21.
//

/// OpenWeatherMap Icon Name
// https://openweathermap.org/weather-conditions#Icon-list
public struct Icon: Equatable, Hashable {
    
    /// Time of day.
    public var time: Time
    
    /// Weather condition.
    public var condition: WeatherCondition
    
    public init(condition: WeatherCondition,
                time: Time) {
        
        self.condition = condition
        self.time = time
    }
}

public extension Icon {
    
    static func day(_ condition: WeatherCondition) -> Icon {
        return Icon(condition: condition, time: .day)
    }
    
    static func night(_ condition: WeatherCondition) -> Icon {
        return Icon(condition: condition, time: .night)
    }
}

// MARK: - RawRepresentable

extension Icon: RawRepresentable {
    
    public init?(rawValue: String) {
        guard rawValue.count == 3,
              let condition = UInt(rawValue.prefix(2)).flatMap(WeatherCondition.init),
              let time = Time(rawValue: String(rawValue.suffix(1)))
            else { return nil }
        
        self.init(condition: condition, time: time)
    }
    
    public var rawValue: String {
        return String(format: "%02d", condition.rawValue) + time.rawValue
    }
}

// MARK: - CaseIterable

extension Icon {
    
    static let allCases: [Icon] = WeatherCondition.allCases
        .flatMap({ [.day($0), .night($0)] })
}

// MARK: - Supporting Types

public extension Icon {
    
    enum Time: String {
        case day = "d"
        case night = "n"
    }
}

public extension Icon {
    
    enum WeatherCondition: UInt, CaseIterable {
        
        /// Clear Sky
        case clearSky           = 01
        
        /// Few Clouds
        case fewClouds          = 02
        
        /// Scattered Clouds
        case scatteredClouds    = 03
        
        /// Broken Clouds
        case brokenClouds       = 04
        
        // TODO: Complete List
    }
}
