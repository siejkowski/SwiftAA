//
//  Aberration.swift
//  SwiftAA
//
//  Created by Cédric Foellmi on 19/10/2016.
//  Copyright © 2016 onekiloparsec. All rights reserved.
//

import Foundation

public extension EclipticCoordinates {
    
    /// Return new ecliptic coordinates corrected for the annual aberration of the Earth.
    /// See AA, p149.
    ///
    /// - parameter julianDay:     The julian day of
    /// - parameter highPrecision: `true` if one wants high precision
    ///
    /// - returns: Corected ecliptic coordinates of the star.
    public func correctedForAnnualAberration(julianDay: JulianDay, highPrecision: Bool = true) -> EclipticCoordinates {
        let diff = KPCAAAberration_EclipticAberration(self.lambda, self.beta, julianDay, highPrecision)
        return EclipticCoordinates(lambda: self.lambda+diff.X, beta: self.beta+diff.Y, epsilon: self.epsilon)
    }
}
