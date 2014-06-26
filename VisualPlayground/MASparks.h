//
//  View_Sparks.h
//  VisualPlayground
//
//  Created by Paul Napier on 11/06/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MASparks : UIView

@property (nonatomic, retain) NSMutableArray *mArrTimers;
@property (nonatomic,retain) NSTimer *timerSparks;
@property (nonatomic) CGPoint location;
@property (nonatomic,retain) UIColor *colorFrom;
@property (nonatomic,retain) UIColor *colorTo;
@property (nonatomic) int intSizeFrom;
@property (nonatomic) int intSizeTo;

@end
