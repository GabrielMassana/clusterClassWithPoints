//
//  ViewController.h
//  clusterAndPoints
//
//  Created by Jose Antonio Gabriel Massana on 12/07/14.
//  Copyright (c) 2014 GabrielMassana. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DrawPoint, DrawView;

@interface ViewController : UIViewController

@property (nonatomic, strong) UIColor *selectedColor;
@property (nonatomic) double selectedLineThickness;

@property (nonatomic, strong) NSMutableArray *pointsToDraw;

@property (nonatomic, strong) DrawView *drawView;

@property (strong, nonatomic) IBOutlet UIView *buttonsView;
@property (strong, nonatomic) IBOutlet UIView *pointsView;

@property (strong, nonatomic) IBOutlet UIButton *showPaletteButton;

@property (nonatomic, strong) UIButton *lastButtonColor;

- (void) handleDrawWithPoint;

@end
