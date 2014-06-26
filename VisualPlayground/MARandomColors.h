//
//  View_RandomColors.h
//  VisualPlayground
//
//  Created by Paul Napier on 11/06/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MARandomColour.h"

@interface MARandomColors : UIView

@property (nonatomic) int color;
@property (nonatomic) int size;
@property (nonatomic) float radius;
@property (nonatomic) bool drawTowards;

-(void)writeWord:(NSString *)word fromPoint:(CGPoint)point withBorder:(bool)border;

@end
