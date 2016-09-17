//
//  Venus.swift
//  SwiftAA
//
//  Created by Cédric Foellmi on 18/06/16.
//  Copyright © 2016 onekiloparsec. All rights reserved.
//

import Foundation

public struct Venus: Planet {
    public static var color: Color {
        get { return Color(red: 0.784, green:0.471, blue:0.137, alpha: 1.0) }
    }
    
    public private(set) var julianDay: JulianDay
    public private(set) var highPrecision: Bool
    
    public init(julianDay: JulianDay, highPrecision: Bool = true) {
        self.julianDay = julianDay
        self.highPrecision = highPrecision
    }
    
    public init(date: NSDate, highPrecision: Bool = true) {
        self.init(julianDay: KPCAADate(gregorianCalendarDate: date).Julian(), highPrecision: highPrecision)
    }
    
    public var magnitude: Double { get { return KPCAAIlluminatedFraction_VenusMagnitudeAA(self.radiusVector, self.apparentGeocentricDistance, self.phaseAngle) } }
}