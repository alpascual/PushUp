//
//  AccelerometerController.m
//  DeviceAlarm
//
//  Created by Albert Pascual on 1/27/11.
//  Copyright 2011 Al. All rights reserved.
//

#import "AccelerometerController.h"


@implementation AccelerometerController

@synthesize accelerometerManager;
@synthesize delegate = _delegate;


- (id) init {
    self = [super init];
    if (self != nil) {
        //self.accelerometerManager = [UIAccelerometer sharedAccelerometer];
        //self.accelerometerManager.delegate = self; 
		
		
    }
    return self;
}

- (void) start
{
	iTries = 0;
    iTriesHand = 0;
	
	[[UIAccelerometer sharedAccelerometer] setUpdateInterval:(1.0)];
	[[UIAccelerometer sharedAccelerometer] setDelegate:self];
        
    UIDevice *device = [UIDevice currentDevice];
    device.proximityMonitoringEnabled = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(handleProximityChangeNotification:) 
                                           name:UIDeviceProximityStateDidChangeNotification object:nil];         
}

-(void)handleProximityChangeNotification:(NSNotification*)notification {
    
    /*iTriesHand = iTriesHand + 1;
    if ( iTriesHand < 2 )
        return;*/
    
    if([UIDevice currentDevice].proximityState)
    {
        NSLog(@"First mode/ Hand on the sensor ");
        [self.delegate pushUpTouched];
    }
    else
    {
        NSLog(@"Second mode/ Hand off the sensor");
        [self.delegate pushUpAway];
    }
    
    UIDevice *device = [UIDevice currentDevice];
    device.proximityMonitoringEnabled = YES;
}

- (void) stop
{
	[[UIAccelerometer sharedAccelerometer] setDelegate:nil];
}




@end
