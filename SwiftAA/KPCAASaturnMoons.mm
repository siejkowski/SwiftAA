//
//  KPCAASaturnMoons.m
//  SwiftAA
//
//  Created by Cédric Foellmi on 10/07/15.
//  Copyright (c) 2015 onekiloparsec. All rights reserved.
//

#import "KPCAASaturnMoons.h"
#import "AASaturnMoons.h"

KPCAASaturnMoonDetails KPCAASaturnMoonDetailMake(CAASaturnMoonDetail detailsPlus);
KPCAASaturnMoonDetails KPCAASaturnMoonDetailMake(CAASaturnMoonDetail detailsPlus)
{
    struct KPCAASaturnMoonDetails details;

    details.TrueRectangularCoordinateComponents = KPCAA3DCoordinateComponentsMake(detailsPlus.TrueRectangularCoordinates.X,
                                                                                  detailsPlus.TrueRectangularCoordinates.Y,
                                                                                  detailsPlus.TrueRectangularCoordinates.Z);

    details.ApparentRectangularCoordinateComponents = KPCAA3DCoordinateComponentsMake(detailsPlus.ApparentRectangularCoordinates.X,
                                                                                      detailsPlus.ApparentRectangularCoordinates.Y,
                                                                                      detailsPlus.ApparentRectangularCoordinates.Z);

    details.isInTransit = detailsPlus.bInTransit;
    details.isInOccultation = detailsPlus.bInOccultation;
    details.isInEclipse = detailsPlus.bInEclipse;
    details.isInShadowTransit = detailsPlus.bInShadowTransit;
    return details;
}

KPCAASaturnMoonsDetails KPCAASaturnMoonsDetailsCalculate(double JD, BOOL highPrecision)
{
    CAASaturnMoonsDetails detailsPlus = CAASaturnMoons::Calculate(JD, highPrecision);
    
    struct KPCAASaturnMoonsDetails details;
    
    details.Satellite1 = KPCAASaturnMoonDetailMake(detailsPlus.Satellite1);
    details.Satellite2 = KPCAASaturnMoonDetailMake(detailsPlus.Satellite2);
    details.Satellite3 = KPCAASaturnMoonDetailMake(detailsPlus.Satellite3);
    details.Satellite4 = KPCAASaturnMoonDetailMake(detailsPlus.Satellite4);
    details.Satellite5 = KPCAASaturnMoonDetailMake(detailsPlus.Satellite5);
    details.Satellite6 = KPCAASaturnMoonDetailMake(detailsPlus.Satellite6);
    details.Satellite7 = KPCAASaturnMoonDetailMake(detailsPlus.Satellite7);
    details.Satellite8 = KPCAASaturnMoonDetailMake(detailsPlus.Satellite8);
    
    return details;
}
