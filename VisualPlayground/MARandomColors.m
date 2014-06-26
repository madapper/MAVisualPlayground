//
//  View_RandomColors.m
//  VisualPlayground
//
//  Created by Paul Napier on 11/06/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MARandomColors.h"
#import <QuartzCore/QuartzCore.h>

#define   DEGREES_TO_RADIANS(degrees)  ((M_PI * degrees)/ 180)

@implementation MARandomColors

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.drawTowards = true;
    
        self.size = frame.size.height*.025;
        self.radius = frame.size.height*.1;
        self.color = arc4random()%6;
        
        [NSTimer scheduledTimerWithTimeInterval:10 target:self selector:@selector(colorPicker:) userInfo:nil repeats:YES];
        
        for (int a = 0; a<frame.size.height/self.size; a++) {
            for (int b = 0; b<frame.size.width/self.size; b++) {
                MARandomColour *view = [[MARandomColour alloc]initWithFrame:CGRectMake(b*self.size, a*self.size, self.size, self.size) interval:0.1 color:self.color];
                
                [self addSubview:view];
                
            }
            
        }
        
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





-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    
    
    
    UITouch *touch = [[event allTouches]anyObject];
    
    CGPoint location = [touch locationInView:self];
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:location
                                                         radius:self.radius
                                                     startAngle:0
                                                       endAngle:DEGREES_TO_RADIANS(360)
                                                      clockwise:YES];
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    for (int a = 0; a<[self.subviews count]; a++) {
        UIView *view = self.subviews[a];
        if ([aPath containsPoint:view.center]) {
            [mArray addObject:view];
            CGPoint center = view.center;
            if (self.drawTowards) {
                
                view.center = location;
            }else{
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                
                float xr = (view.center.x>location.x)?-self.radius:self.radius;
                float yr = (view.center.y>location.y)?-self.radius:self.radius;
                
                float fx = view.center.x-location.x+xr;
                float fy = view.center.y-location.y+yr;
                view.center = CGPointMake(view.center.x+fx, view.center.y+fy);
                [UIView commitAnimations];
            }
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:2];
            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
            view.center=center;
            [UIView commitAnimations];
            
        }
    }
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    float radius = 50;
    
    UITouch *touch = [[event allTouches]anyObject];
    
    CGPoint location = [touch locationInView:self];
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:location
                                                         radius:radius
                                                     startAngle:0
                                                       endAngle:DEGREES_TO_RADIANS(360)
                                                      clockwise:YES];
    
    NSMutableArray *mArray = [[NSMutableArray alloc]init];
    for (int a = 0; a<[self.subviews count]; a++) {
        UIView *view = self.subviews[a];
        if ([aPath containsPoint:view.center]) {
            [mArray addObject:view];
            CGPoint center = view.center;
            if (self.drawTowards) {
                
                view.center = location;
            }else{
                [UIView beginAnimations:nil context:NULL];
                [UIView setAnimationDuration:1];
                [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
                
                float xr = (view.center.x>location.x)?-radius:radius;
                float yr = (view.center.y>location.y)?-radius:radius;
                
                float fx = view.center.x-location.x+xr;
                float fy = view.center.y-location.y+yr;
                view.center = CGPointMake(view.center.x+fx, view.center.y+fy);
                [UIView commitAnimations];
            }
            
            
            [UIView beginAnimations:nil context:NULL];
            [UIView setAnimationDuration:2];
            [UIView setAnimationCurve:UIViewAnimationCurveLinear];
            view.center=center;
            [UIView commitAnimations];
            
        }
    }
}
-(void)colorPicker:(NSTimer *)timer{
    self.color = 1+ arc4random()%6;
}

-(void)writeWord:(NSString *)word fromPoint:(CGPoint)point withBorder:(bool)border{
    NSMutableArray *letters = [[NSMutableArray alloc]init];
    for (int a = 0; a<(MIN(6, word.length)); a++) {
        [letters addObject:[word substringWithRange:NSMakeRange(a, 1)]];
    }
    NSLog(@"%@",letters);
}

-(NSArray *)writeA{
    
}



@end
