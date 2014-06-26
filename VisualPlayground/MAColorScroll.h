//
//  View_ColorScroll.h
//  VisualPlayground
//
//  Created by Paul Napier on 11/06/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MAColorScroll : UIView

@property (nonatomic) int size;
@property (nonatomic) float interval;
@property (nonatomic) int color;
@property (nonatomic) bool includeCorners;
@property (nonatomic) bool drawTowards;

@end
