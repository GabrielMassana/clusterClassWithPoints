//
//  DrawView.m
//  points
//
//  Created by Jose Antonio Gabriel Massana on 11/07/14.
//  Copyright (c) 2014 GabrielMassana. All rights reserved.
//

#import "DrawView.h"
#import "DrawPoint.h"

@implementation DrawView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef context= UIGraphicsGetCurrentContext();
    
    for (int i = 1; i < self.pointsToDraw.count; i++)
    {
        CGContextBeginPath(context);
        
        CGContextSetStrokeColorWithColor(context, ((DrawPoint*)[self.pointsToDraw objectAtIndex:i]).color.CGColor);
        
        CGContextMoveToPoint(context, [ ((DrawPoint*)[self.pointsToDraw objectAtIndex:i-1]).x floatValue], [((DrawPoint*)[self.pointsToDraw objectAtIndex:i-1]).y floatValue]);
        CGContextAddLineToPoint(context, [((DrawPoint*)[self.pointsToDraw objectAtIndex:i]).x floatValue], [((DrawPoint*)[self.pointsToDraw objectAtIndex:i]).y floatValue]);
        
        CGContextSetLineWidth(context, ((DrawPoint*)[self.pointsToDraw objectAtIndex:i]).line);
        
        CGContextClosePath(context);
        CGContextStrokePath(context);
    }
    
    for (DrawPoint *point in self.pointsToDraw)
    {
        CGContextBeginPath(context);
        CGContextSetLineWidth(context, 8);
        CGContextAddArc(context, [point.x floatValue], [point.y floatValue], 5, 0, 2*M_PI, 0);
        
        int numComponents = CGColorGetNumberOfComponents(point.color.CGColor);

        if (numComponents == 4)
        {
            const CGFloat *components = CGColorGetComponents(point.color.CGColor);
            CGFloat red = components[0];
            CGFloat green = components[1];
            CGFloat blue = components[2];
            CGFloat alpha = components[3];
            CGContextSetRGBFillColor(context, red, green, blue, alpha);
        }
        else
        {
            CGContextSetRGBFillColor(context, 0, 0, 0, 1);
        }
        
        CGContextDrawPath(context, kCGPathFill);
        CGContextStrokePath(context);
    }
}

@end
