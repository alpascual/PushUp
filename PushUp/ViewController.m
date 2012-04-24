//
//  ViewController.m
//  PushUp
//
//  Created by Albert Pascual on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize accelerometer = _accelerometer;
@synthesize bPushing = _bPushing;
@synthesize iPushupNumber = _iPushupNumber;
@synthesize soundManager = _soundManager;
@synthesize numberTextLabel = _numberTextLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.bPushing = NO;
    self.iPushupNumber = 0;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Start" message:@"Put the iPhone on the floor, do push up on top, will use the proximity sensor to count your push ups." delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
    
    self.soundManager = [[SoundManager alloc] init];
	
    self.accelerometer = [[AccelerometerController alloc] init];
    self.accelerometer.delegate = self;
    [self.accelerometer start];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(IBAction)resetButtonPressed:(id)sender {
    // Reset the counter
    
    self.numberTextLabel.text = @"000";
    
    self.iPushupNumber = 0;
}

-(void) pushUpTouched {
    NSLog(@"Push Up happend");
    if ( self.bPushing == NO ) {
        self.bPushing = YES;
        self.iPushupNumber = self.iPushupNumber + 1;
        
        if ( self.iPushupNumber < 21) {
            [self.soundManager addSoundToQueue:[[NSString alloc] initWithFormat:@"%d", self.iPushupNumber]];
            [self.soundManager playQueue];
        }
        else if ( self.iPushupNumber > 20 && self.iPushupNumber < 30 ) {
            [self PlayBigNumber:self.iPushupNumber section:20];
        }
        else if (self.iPushupNumber == 30 || self.iPushupNumber == 40 || self.iPushupNumber == 50) {
            [self.soundManager addSoundToQueue:[[NSString alloc] initWithFormat:@"%d", self.iPushupNumber]];
            [self.soundManager playQueue];
        }            
        else if ( self.iPushupNumber > 30 && self.iPushupNumber < 40 ) {
            [self PlayBigNumber:self.iPushupNumber section:30];
        }
        else if ( self.iPushupNumber > 40 && self.iPushupNumber < 50 ) {
            [self PlayBigNumber:self.iPushupNumber section:40];
        }
        else {
            self.iPushupNumber = 1;
        }
        
        self.numberTextLabel.text = [[NSString alloc] initWithFormat:@"%d", self.iPushupNumber];
        
    }
}

- (void) PlayBigNumber:(int) number section:(int)fullNumber {
    int iResult = self.iPushupNumber - fullNumber;
    NSLog(@"result is %d", iResult);
    [self.soundManager addSoundToQueue:[[NSString alloc] initWithFormat:@"%d", fullNumber]];
    [self.soundManager addSoundToQueue:[[NSString alloc] initWithFormat:@"%d", iResult]];
    [self.soundManager playQueue];
}

-(void) pushUpAway {
    NSLog(@"DONE");
    self.bPushing = NO;
}

@end
