//
//  ViewController.h
//  PushUp
//
//  Created by Albert Pascual on 4/21/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccelerometerController.h"
#import "SoundManager.h"

@interface ViewController : UIViewController <PushUpDelegate>

@property (nonatomic,strong) AccelerometerController *accelerometer;
@property (nonatomic) BOOL bPushing;
@property (nonatomic) int iPushupNumber;
@property (nonatomic,strong) SoundManager *soundManager;
@property (nonatomic,strong) IBOutlet UILabel *numberTextLabel;

- (void) PlayBigNumber:(int) number section:(int)fullNumber;

@end
