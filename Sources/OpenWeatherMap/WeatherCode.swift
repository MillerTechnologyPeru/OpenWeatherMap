//
//  WeatherCode.swift
//  
//
//  Created by Alsey Coleman Miller on 15/07/21.
//

/// OpenWeatherMap Code
// https://openweathermap.org/weather-conditions
public struct WeatherCode: RawRepresentable, Equatable, Hashable, Codable {
    
    /// Raw Value.
    public let rawValue: UInt
    
    /// Weather code group.
    public let group: Group
    
    public init?(rawValue: UInt) {
        guard let group = Group(code: rawValue)
            else { return nil }
        self.rawValue = rawValue
        self.group = group
    }
    
    public init<T: WeatherCodeGroup>(_ group: T) {
        self.group = T.group
        self.rawValue = group.rawValue
    }
    
    private init(unsafe rawValue: UInt) {
        self.init(rawValue: rawValue)!
    }
}

// MARK: - Supporting Types

public extension WeatherCode {
    
    /// Weather Code Group
    enum Group: Equatable, Hashable, CaseIterable {
        
        /// Thunderstorm
        case thunderstorm
        
        /// Drizzle
        case drizzle
        
        /// Rain
        case rain
        
        /// Snow
        case snow
        
        /// Atmosphere
        case atmosphere
        
        /// Clear
        case clear
        
        /// Clouds
        case clouds
    }
}

internal extension WeatherCode.Group {
    
    var start: UInt {
        switch self {
        case .thunderstorm: return 200
        case .drizzle: return 300
        case .rain: return 500
        case .snow: return 600
        case .atmosphere: return 700
        case .clear: return 800
        case .clouds: return 801
        }
    }
    
    var end: UInt {
        switch self {
        case .thunderstorm: return 299
        case .drizzle: return 399
        case .rain: return 599
        case .snow: return 699
        case .atmosphere: return 700
        case .clear: return 800
        case .clouds: return 899
        }
    }
    
    init?(code: UInt) {
        guard let group = WeatherCode.Group.allCases.first(where: { $0.start <= code && code <= $0.end }) else { return nil }
        self = group
    }
}

public protocol WeatherCodeGroup: Hashable, RawRepresentable, CaseIterable {
    
    var rawValue: UInt { get }
    
    init?(rawValue: UInt)
    
    static var group: WeatherCode.Group { get }
}

// MARK: - Definitions

public extension WeatherCode {
    
    enum Thunderstorm: UInt, CaseIterable, WeatherCodeGroup {
        
        public static let group = Group.thunderstorm
        
        /// thunderstorm with light rain
        case lightRain          = 200
        
        /// thunderstorm with rain
        case rain               = 201
        
        /// thunderstorm with heavy rain
        case heavyRain          = 202
        
        /// light thunderstorm
        case light              = 210
        
        /// thunderstorm
        case `default`          = 211
        
        /// heavy thunderstorm
        case heavy              = 212
        
        /// ragged thunderstorm
        case ragged             = 221
        
        /// thunderstorm with light drizzle
        case lightDrizzle       = 230
        
        /// thunderstorm with drizzle
        case drizzle            = 231
        
        /// thunderstorm with heavy drizzle
        case heavyDrizzle       = 232
    }
    
    static func thunderstorm(_ code: Thunderstorm) -> WeatherCode {
        return WeatherCode(unsafe: code.rawValue)
    }
}

public extension WeatherCode {
    
    static var clear: WeatherCode { return WeatherCode(unsafe: 800) }
    
    enum Clouds: UInt, CaseIterable, WeatherCodeGroup {
        
        public static let group = Group.clouds
        
        /// few clouds: 11-25%
        case few            = 801
        
        /// scattered clouds: 25-50%
        case scattered      = 802
        
        /// broken clouds: 51-84%
        case broken         = 803
        
        /// overcast clouds: 85-100%
        case overcast       = 804
    }
    
    static func clouds(_ code: WeatherCode.Clouds) -> WeatherCode {
        return WeatherCode(unsafe: code.rawValue)
    }
}
