//
//  View_ColorScroll.m
//  VisualPlayground
//
//  Created by Paul Napier on 11/06/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MAColorScroll.h"
#import <QuartzCore/QuartzCore.h>

@implementation MAColorScroll

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

        self.size = 3;
        self.interval = 0.1;
        self.color = 1;
        self.includeCorners = false;
        self.drawTowards = true;
    
        
        for (int a = 0; a<frame.size.height/self.size; a++) {
            for (int b = 0; b<frame.size.width/self.size; b++) {
                UIView *view = [[UIView alloc]initWithFrame:CGRectMake(b*self.size, a*self.size, self.size, self.size)];
                if (self.includeCorners) {
                    int radius = arc4random()%(int)(view.frame.size.width/2);
                    view.layer.cornerRadius = radius;
                }
                
                float h = 1-(float)a/(frame.size.height);
                float s = 1-(float)b/(frame.size.width/(self.size/1.5));
                
                view.backgroundColor = [UIColor colorWithHue:h saturation:s brightness:1 alpha:1];
                
                [self addSubview:view];
            }
            
        }
        [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(changeColors:) userInfo:nil repeats:true];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/


-(void)changeColors:(NSTimer *)timer{
    float ha = 1/(self.frame.size.height/self.size);
    
    for (int a = 0; a<[self.subviews count]; a++) {
        UIView *view = self.subviews[a];
        UIColor *color = view.backgroundColor;
        CGFloat hue;
        CGFloat saturation;
        CGFloat brightness;
        CGFloat alpha;
        [color getHue:&hue saturation:&saturation brightness:&brightness alpha:&alpha];
        if (hue<=0) {
            hue = 1;
        }else{
            hue = hue-ha;
        }
        
        view.backgroundColor = [UIColor colorWithHue:hue saturation:saturation brightness:1 alpha:1];
    }
}


@end
