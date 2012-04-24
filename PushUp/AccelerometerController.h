//
//  AccelerometerController.h
//  DeviceAlarm
//
//  Created by Albert Pascual on 1/27/11.
//  Copyright 2011 Al. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol PushUpDelegate <NSObject>

-(void) pushUpTouched;
-(void) pushUpAway;

@end

@interface AccelerometerController : NSObject <UIAccelerometerDelegate>{
	
	UIAccelerometer *accelerometerManager;	
	
	float X;
	float Y;
	float Z;
	
	id <PushUpDelegate> noiseDelegate;
	
	int iTries;
    int iTriesHand;
	
}

@property (nonatomic, retain) UIAccelerometer *accelerometerManager;
@property (retain, nonatomic) id <PushUpDelegate> delegate;

- (void) start;
- (void) stop;

@end
