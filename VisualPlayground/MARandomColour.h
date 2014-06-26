//
//  RandomColour.h
//  VisualPlayground
//
//  Created by Paul Napier on 15/04/2014.
//  Copyright (c) 2014 MadApper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MARandomColour : UIView

@property (nonatomic) int color;
@property (nonatomic) float interval;
@property (nonatomic) bool includeBorders;
@property (nonatomic) bool includeCorners;

- (id)initWithFrame:(CGRect)frame interval:(float)interval color:(int)color;

@end
