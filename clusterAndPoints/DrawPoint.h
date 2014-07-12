//
//  DrawPoint.h
//  points
//
//  Created by Jose Antonio Gabriel Massana on 11/07/14.
//  Copyright (c) 2014 GabrielMassana. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DrawPoint : NSObject

@property (nonatomic, strong) NSNumber *x;
@property (nonatomic, strong) NSNumber *y;
@property (nonatomic, strong) UIColor *color;
@property (nonatomic) double line;

@end
