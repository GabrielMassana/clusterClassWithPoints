//
//  ViewController.m
//  clusterAndPoints
//
//  Created by Jose Antonio Gabriel Massana on 12/07/14.
//  Copyright (c) 2014 GabrielMassana. All rights reserved.
//

#import "ViewController.h"
#import "IPhone4ViewController.h"
#import "IPhone5ViewController.h"
#import "IPadViewController.h"

#import "DrawView.h"
#import "DrawPoint.h"

#import <CoreGraphics/CoreGraphics.h>

@interface ViewController () <UIGestureRecognizerDelegate>

@property (strong, nonatomic) IBOutlet UIButton *redButton;
@property (strong, nonatomic) IBOutlet UIButton *thinLineButton;
@property (nonatomic, strong) UIButton *lastButtonLineThickness;

@end

@implementation ViewController

//Class cluster
+ (id)alloc
{
    if ([self class] == [ViewController class])
    {
        if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
        {
            return [IPadViewController alloc];
        }
        else
        {
            if ([[UIScreen mainScreen] bounds].size.height == 480)
            {
                return [IPhone4ViewController alloc];
            }
            else
            {
                return [IPhone5ViewController alloc];
            }
        }
    }
    else
    {
        return [super alloc];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.pointsToDraw = [[NSMutableArray alloc] init];
    
    UITapGestureRecognizer *tapGesture  = [[UITapGestureRecognizer alloc]initWithTarget:self action:nil];
    tapGesture.delegate = self;
    [tapGesture setNumberOfTapsRequired:1];
    [tapGesture setNumberOfTouchesRequired:1];
    [self.pointsView addGestureRecognizer:tapGesture];
    
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(hidePaletteView)];
    [swipeDown setDirection:UISwipeGestureRecognizerDirectionDown];
    [self.buttonsView addGestureRecognizer:swipeDown];
    
    [self handleChangeColor:self.redButton];
    [self lineThickness:self.thinLineButton];
    
    [self setUpUI];
}

- (void) setUpUI
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    return NO; // handle the touch
}

- (void) handleDrawWithPoint
{
    [self.drawView removeFromSuperview];
    
    self.drawView = [[DrawView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    self.drawView.pointsToDraw  = self.pointsToDraw;
    self.drawView.backgroundColor = [UIColor clearColor];
    [self.pointsView addSubview:self.drawView];
}

- (IBAction)undoButtonClicked:(UIButton *)sender
{
    [self.pointsToDraw removeLastObject];
    
    [self handleDrawWithPoint];
}


- (IBAction)handleChangeColor:(UIButton *)sender {
    
    if (sender.tag == 1)
    {
        self.selectedColor = [UIColor redColor];
    }
    else if (sender.tag == 2)
    {
        self.selectedColor = [UIColor yellowColor];
    }
    else if (sender.tag == 3)
    {
        self.selectedColor = [UIColor blueColor];
    }
    else if (sender.tag == 4)
    {
        self.selectedColor = [UIColor greenColor];
    }
    
    
    if (self.lastButtonColor != nil)
    {
        [self.lastButtonColor.layer setBorderWidth:0.0f];
        [self.lastButtonColor.layer setBorderColor:[UIColor clearColor].CGColor];
    }
    
    [sender.layer setBorderWidth:4.0f];
    [sender.layer setBorderColor: [UIColor blackColor].CGColor];
    self.lastButtonColor = sender;
}


- (IBAction)lineThickness:(UIButton *)sender
{
    if (sender.tag == 1)
    {
        self.selectedLineThickness = 1.0;
    }
    else if (sender.tag == 2)
    {
        self.selectedLineThickness = 4.0;
    }
    
    
    if (self.lastButtonLineThickness != nil)
    {
        [self.lastButtonLineThickness.layer setBorderWidth:0.0f];
        [self.lastButtonLineThickness.layer setBorderColor:[UIColor clearColor].CGColor];
    }
    
    [sender.layer setBorderWidth:4.0f];
    [sender.layer setBorderColor: [UIColor blackColor].CGColor];
    self.lastButtonLineThickness = sender;
}

- (IBAction)showPaletteButtonClicked:(UIButton *)sender
{

}

-(void) hidePaletteView
{

}

@end
