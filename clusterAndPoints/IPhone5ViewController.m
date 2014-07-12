//
//  IPhone5ViewController.m
//  clusterAndPoints
//
//  Created by Jose Antonio Gabriel Massana on 12/07/14.
//  Copyright (c) 2014 GabrielMassana. All rights reserved.
//

#import "IPhone5ViewController.h"
#import "DrawPoint.h"

@interface IPhone5ViewController ()

@end

@implementation IPhone5ViewController

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
    self.buttonsView.frame = CGRectMake(0, 568, 320, 130);
    self.showPaletteButton.frame = CGRectMake(136, 529, 164, 30);
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
        && pointOnScreen.x > 0 && pointOnScreen.x < self.view.frame.size.width
        && !CGRectContainsPoint(self.buttonsView.frame,pointOnScreen))
    {
        DrawPoint *drawPoint = [[DrawPoint alloc]init];
        drawPoint.x = [NSNumber numberWithFloat:pointOnScreen.x];
        drawPoint.y = [NSNumber numberWithFloat:pointOnScreen.y];
        drawPoint.color = self.selectedColor;
        drawPoint.line = self.selectedLineThickness;
        
        [self.pointsToDraw addObject:drawPoint];
        
        [self handleDrawWithPoint];
        return NO; // handle the touch
    }
    
    return YES; // handle the touch
}

- (IBAction)showPaletteButtonClicked:(UIButton *)sender
{
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^() {
                         
                         self.buttonsView.frame = CGRectMake(0,438, 320, 130);
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}

-(void) hidePaletteView
{
    [UIView animateWithDuration:0.3f
                          delay:0.0f
                        options:UIViewAnimationOptionCurveEaseIn
                     animations:^() {
                         
                         self.buttonsView.frame = CGRectMake(0,568, 320, 130);
                         
                     }
                     completion:^(BOOL finished) {
                         
                     }];
}
@end
