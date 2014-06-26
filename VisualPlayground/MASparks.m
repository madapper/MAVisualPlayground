//
//  View_Sparks.m
//  VisualPlayground
//
//  Created by Paul Napier on 11/06/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MASparks.h"

#import <QuartzCore/QuartzCore.h>



@implementation MASparks

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.mArrTimers = [[NSMutableArray alloc]init];
        
        self.intSizeFrom = 3;
        self.intSizeTo = 15;

        float r = (float)255/255;
        float g = (float)255/255;
        float b = (float)0/255;
        
        
        self.colorFrom = [UIColor colorWithRed:r green:g blue:b alpha:1];
        
        r = (float)255/255;
        g = (float)0/255;
        b = (float)125/255;
        
        self.colorTo = [UIColor colorWithRed:r green:g blue:b alpha:1];
        
        self.backgroundColor = [UIColor blackColor];
        self.multipleTouchEnabled = true;
    }
    return self;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for (int a = 0; a<[touches count]; a++) {
        UITouch * touch = [[touches allObjects]objectAtIndex:a];
        CGPoint location = [touch locationInView:self];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timerSparksCircle:) userInfo:[NSValue valueWithCGPoint:location] repeats:YES];
        [self.mArrTimers addObject:timer];
    }
    NSLog(@"%d",[self.mArrTimers count]);
    
    
//    UITouch *touch = [touches anyObject];
//    
//    self.location = [touch locationInView:self];
//    
//    //timerSparks = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timerSparks:) userInfo:[NSValue valueWithCGPoint:location] repeats:YES];
//    self.timerSparks = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timerSparksCircle:) userInfo:[NSValue valueWithCGPoint:self.location] repeats:YES];
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for (NSTimer *timer in self.mArrTimers) {
        [timer invalidate];
        [self.mArrTimers removeObject:timer];
    }
    
    for (int a = 0; a<[touches count]; a++) {
        UITouch * touch = [[touches allObjects]objectAtIndex:a];
        CGPoint location = [touch locationInView:self];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timerSparksCircle:) userInfo:[NSValue valueWithCGPoint:location] repeats:YES];
        [self.mArrTimers addObject:timer];
    }
    
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    for (int a = 0; a<[self.mArrTimers count]; a++) {
        NSTimer *timer = [self.mArrTimers objectAtIndex:a];
        [timer invalidate];
    }
    [self.mArrTimers removeAllObjects];
    
    for (int a = 0; a<[touches count]; a++) {
        UITouch * touch = [[touches allObjects]objectAtIndex:a];
        CGPoint location = [touch locationInView:self];
        
        NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:0.001 target:self selector:@selector(timerSparksCircle:) userInfo:[NSValue valueWithCGPoint:location] repeats:YES];
        [self.mArrTimers addObject:timer];
    }
     
}

-(void)timerSparks:(NSTimer *)timer{
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.intSizeFrom, self.intSizeFrom)];
    view.center = self.location;
    view.layer.cornerRadius = view.frame.size.width/2;
    [self addSubview:view];
    
    int mySizeTo = arc4random()%self.intSizeTo;
    
    int x = 75-arc4random()%200;
    int y = 75-arc4random()%200;
    
    view.backgroundColor = self.colorFrom;
    int interval = arc4random()%10;
    float fInterval = (float)interval/10+0.1;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:fInterval];
    view.frame = CGRectMake(self.location.x, self.location.y, mySizeTo, mySizeTo);
    view.layer.cornerRadius = view.frame.size.width/2;
    view.center = CGPointMake(self.location.x+x, self.location.y+y);
    view.alpha = 0;
    view.backgroundColor = self.colorTo;
    
    [UIView commitAnimations];
    [self performSelector:@selector(removeMyView:) withObject:view afterDelay:fInterval];
}

-(void)timerSparksCircle:(NSTimer *)timer{
    
    CGPoint location = [[timer userInfo]CGPointValue];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.intSizeFrom, self.intSizeFrom)];
    view.center = location;
    view.layer.cornerRadius = view.frame.size.width/2;
    [self addSubview:view];
    
    int mySizeTo = arc4random()%self.intSizeTo;
    
    int degree = arc4random()%360;
    int radius = arc4random()%100;
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:location radius:radius startAngle:0 endAngle:degree clockwise:YES];
    
    view.backgroundColor = self.colorFrom;
    int interval = arc4random()%10;
    float fInterval = (float)interval/10+0.1;
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:fInterval];
    view.frame = CGRectMake(location.x, location.y, mySizeTo, mySizeTo);
    view.layer.cornerRadius = view.frame.size.width/2;
    view.center = aPath.currentPoint;
    view.alpha = 0;
    view.backgroundColor = self.colorTo;
    
    [UIView commitAnimations];
    [self performSelector:@selector(removeMyView:) withObject:view afterDelay:fInterval];
}



-(void)removeMyView:(UIView *)view{
    [view removeFromSuperview];
}

@end
