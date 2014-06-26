//
//  RandomColour.m
//  VisualPlayground
//
//  Created by Paul Napier on 15/04/2014.
//  Copyright (c) 2014 MadApper. All rights reserved.
//

#import "MARandomColour.h"

@implementation MARandomColour

- (id)initWithFrame:(CGRect)frame interval:(float)interval color:(int)color
{
    self = [super initWithFrame:frame];
    if (self) {
        self.color = color;
        [self changeColor:NULL];
        self.interval = interval;
        
        [NSTimer scheduledTimerWithTimeInterval:self.interval target:self selector:@selector(changeColor:) userInfo:nil repeats:YES];
    }
    return self;
}

-(void)changeColor:(NSTimer *)timer{
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:self.interval*5];
    
    UIView *view = self;
    if (self.includeCorners) {
        int radius = arc4random()%(int)(view.frame.size.width/2);
        view.layer.cornerRadius = radius;
    }
    
    int ir;
    int ig;
    int ib;
    if (self.color == 1) {
        ir = arc4random()%255;
        ig = arc4random()%1;
        ib = arc4random()%1;
    }else if (self.color==2){
        ir = arc4random()%1;
        ig = arc4random()%255;
        ib = arc4random()%1;
    }else if (self.color==3){
        ir = arc4random()%1;
        ig = arc4random()%1;
        ib = arc4random()%255;
    }else if (self.color==4){
        ir = arc4random()%255;
        ig = arc4random()%255;
        ib = arc4random()%1;
    }else if (self.color==5){
        ir = arc4random()%255;
        ig = arc4random()%1;
        ib = arc4random()%255;
    }else if (self.color==6){
        ir = arc4random()%1;
        ig = arc4random()%255;
        ib = arc4random()%255;
    }else {
        ir = arc4random()%255;
        ig = arc4random()%255;
        ib = arc4random()%255;
    }
    int ia = 75 + arc4random()%25;
    
    float fr = (float)ir;
    float fg = (float)ig;
    float fb = (float)ib;
    float fa = (float)ia;
    
    float r = fr/255.0;
    float g = fg/255.0;
    float b = fb/255.0;
    float a = fa/100.0;
    
    view.layer.backgroundColor = [[UIColor colorWithRed:r green:g blue:b alpha:a]CGColor];
    if (self.includeBorders) {
        int ir1;
        int ig1;
        int ib1;
        
        if (self.color == 1) {
            ir1 = arc4random()%255;
            ig1 = arc4random()%1;
            ib1 = arc4random()%1;
        }else if (self.color==2){
            ir1 = arc4random()%1;
            ig1 = arc4random()%255;
            ib1 = arc4random()%1;
        }else if (self.color==3){
            ir1 = arc4random()%1;
            ig1 = arc4random()%1;
            ib1 = arc4random()%255;
        }else if (self.color==4){
            ir1 = arc4random()%255;
            ig1 = arc4random()%255;
            ib1 = arc4random()%1;
        }else if (self.color==5){
            ir1 = arc4random()%255;
            ig1 = arc4random()%1;
            ib1 = arc4random()%255;
        }else if (self.color==6){
            ir1 = arc4random()%1;
            ig1 = arc4random()%255;
            ib1 = arc4random()%255;
        }else {
            ir1 = arc4random()%255;
            ig1 = arc4random()%255;
            ib1 = arc4random()%255;
        }
        
        int ia1 = 75+ arc4random()%25;
        
        float fr1 = (float)ir1;
        float fg1 = (float)ig1;
        float fb1 = (float)ib1;
        float fa1 = (float)ia1;
        
        float r1 = fr1/255.0;
        float g1 = fg1/255.0;
        float b1 = fb1/255.0;
        float a1 = fa1/100.0;
        
        view.layer.borderColor = [[UIColor colorWithRed:r1 green:g1 blue:b1 alpha:a1]CGColor];
        view.layer.borderWidth = arc4random()%(int)(view.frame.size.width/4);
    }
    
    
    [UIView commitAnimations];
    
}



@end
