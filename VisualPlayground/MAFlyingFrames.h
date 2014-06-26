//
//  View_FlyingFrames.h
//  VisualPlayground
//
//  Created by Paul Napier on 11/06/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MAFlyingFrames : UIView

@property (nonatomic) float fBorderWidth;
@property (nonatomic) int reps;

@property (nonatomic) bool rotationClockwise;

@property (nonatomic) CGPoint center;
@property (nonatomic) CGPoint newCenter;
@property (nonatomic) CGPoint oldCenter;

@property (nonatomic) int count;
@property (nonatomic) int position;

@property (nonatomic) int degree;

@property (nonatomic) NSArray *creepOfTheWeek;

@property (nonatomic) UILabel *label;

@end
