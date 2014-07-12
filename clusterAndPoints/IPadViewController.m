//
//  IPadViewController.m
//  clusterAndPoints
//
//  Created by Jose Antonio Gabriel Massana on 12/07/14.
//  Copyright (c) 2014 GabrielMassana. All rights reserved.
//

#import "IPadViewController.h"
#import "DrawPoint.h"

@interface IPadViewController ()

@end

@implementation IPadViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void) setUpUI
{

    NSLog(@"view %@", self.view);
    NSLog(@"buttonsView %@", self.buttonsView);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{
    CGPoint pointOnScreen = [touch locationInView:nil];
    
    if (pointOnScreen.y < self.view.frame.size.height && pointOnScreen.y > 20
        && pointOnScreen.x > 0 && pointOnScreen.x < self.view.frame.size.width)
    {
        DrawPoint *drawPoint = [[DrawPoint alloc]init];
        drawPoint.x = [NSNumber numberWithFloat:pointOnScreen.x];
        drawPoint.y = [NSNumber numberWithFloat:pointOnScreen.y];
        drawPoint.color = self.selectedColor;
        drawPoint.line = self.selectedLineThickness;
        
        [self.pointsToDraw addObject:drawPoint];
        
        
        [self handleDrawWithPoint];
    }
    return NO; // handle the touch
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
    else if (sender.tag == 5)
    {
        self.selectedColor = [UIColor purpleColor];
    }
    else if (sender.tag == 6)
    {
        self.selectedColor = [UIColor cyanColor];
    }
    else if (sender.tag == 7)
    {
        self.selectedColor = [UIColor orangeColor];
    }
    else if (sender.tag == 8)
    {
        self.selectedColor = [UIColor darkGrayColor];
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


@end
