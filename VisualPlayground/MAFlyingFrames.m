//
//  View_FlyingFrames.m
//  VisualPlayground
//
//  Created by Paul Napier on 11/06/13.
//  Copyright (c) 2013 MadApper. All rights reserved.
//

#import "MAFlyingFrames.h"

@implementation MAFlyingFrames

CGFloat degreesToRadians(CGFloat degrees) {return degrees * M_PI / 180;};

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _fBorderWidth = 0.2;
        _rotationClockwise = false;
        
        int count = 0;
        float div = 1.0;
        
        do {
            div = div*(1-_fBorderWidth);
            count++;
        } while (div>0.045);
        
        _reps = count;
        
        self.center = CGPointMake(self.frame.size.width/2, self.frame.size.height/2);
        
        UIImageView *iv = [[UIImageView alloc]initWithFrame:self.bounds];
        iv.frame = CGRectMake(0, 0, 0, 0);
        iv.center = self.center;
        iv.image = [UIImage imageNamed:@"frame.png"];
        iv.layer.backgroundColor = [[UIColor clearColor]CGColor];
        //    iv.layer.cornerRadius = iv.frame.size.height/2;
        
        int ir = arc4random()%255;
        int ig = arc4random()%255;
        int ib = arc4random()%255;
        
        float fr = (float)ir;
        float fg = (float)ig;
        float fb = (float)ib;
        
        float r = fr/255.0;
        float g = fg/255.0;
        float b = fb/255.0;
        
        iv.layer.borderColor = [[UIColor colorWithRed:r green:g blue:b alpha:1.0]CGColor];
        iv.layer.borderColor = [[UIColor clearColor]CGColor];
        
        [self addSubview:iv];
        
        UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                                                             radius:75
                                                         startAngle:0
                                                           endAngle:degreesToRadians(0)
                                                          clockwise:NO];
        
        CGPoint c = aPath.currentPoint;
        NSArray *array = @[iv,[NSValue valueWithCGPoint:c]];
        
        [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(continuousViews:) userInfo:array repeats:YES];
        
        _creepOfTheWeek = @[@"This is nice, yes?",@"Ooooooh pretty...",@"You are feeling sleepy...",@"You will do what ever I say...",];
        
        _label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 200)];
        _label.center = self.center;
        _label.font = [UIFont fontWithName:@"Helvetica-Bold" size:50];
        _label.backgroundColor = [UIColor clearColor];
        _label.lineBreakMode = NSLineBreakByWordWrapping;
        _label.numberOfLines = 2;
        _label.textAlignment = NSTextAlignmentCenter;
        
        [self addSubview:_label];
        _label.alpha = 0;
        
        [NSTimer scheduledTimerWithTimeInterval:4 target:self selector:@selector(changeText) userInfo:nil repeats:YES];
        [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(changeCenter) userInfo:nil repeats:YES];
        

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



-(void)changeCenter{
    
    UIBezierPath *aPath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                                                         radius:75
                                                     startAngle:0
                                                       endAngle:degreesToRadians(_degree)
                                                      clockwise:NO];
    self.center = aPath.currentPoint;
    
    if (_rotationClockwise) {
        if (_degree==360) {
            _degree=0;
        }else{
            _degree++;
        }
    }else{
        if (_degree==0) {
            _degree=360;
        }else{
            _degree--;
        }
    }
    
}

-(void)changeText{
    
    _label.text = [_creepOfTheWeek objectAtIndex:_position];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2];
    _label.alpha = 1;
    [UIView commitAnimations];
    
    [self performSelector:@selector(changeText2) withObject:nil afterDelay:2];
    
    _position++;
    
    if (_position==[_creepOfTheWeek count]) {
        _position = 0;
    }
    
}

-(void)changeText2{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:2];
    [UIView setAnimationDelay:1];
    _label.alpha = 0;
    [UIView commitAnimations];
}


-(void)continuousViews:(NSTimer *)timer{
    
    NSArray *array = [timer userInfo];
    
    UIView *view1 = (UIView *)[array objectAtIndex:0];
    
    if (view1.frame.size.height*(1-_fBorderWidth)-view1.layer.borderWidth>self.frame.size.height||view1.frame.size.height==0) {
        view1.frame = CGRectMake(0, 0, 1, 2008/1536);
        int ir = arc4random()%255;
        int ig = arc4random()%255;
        int ib = arc4random()%255;
        
        float fr = (float)ir;
        float fg = (float)ig;
        float fb = (float)ib;
        
        float r = fr/255.0;
        float g = fg/255.0;
        float b = fb/255.0;
        view1.layer.borderColor = [[UIColor colorWithRed:r green:g blue:b alpha:1.0]CGColor];
        //        view1.layer.borderColor = [[UIColor clearColor]CGColor];
        [view1 removeFromSuperview];
        //        count = 0;
        [self insertSubview:view1 atIndex:0];
    }else{
        if ([self.subviews count]<_reps) {
            if (view1.frame.size.height*(1-_fBorderWidth)-view1.layer.borderWidth>=2008/1536&&(view1.frame.size.height*(1-_fBorderWidth)-view1.layer.borderWidth)/1.01<=2008/1536) {
                
                UIImageView *iv = [[UIImageView alloc]initWithFrame:self.bounds];
                iv.frame = CGRectMake(0, 0, 0, 0);
                iv.image = [UIImage imageNamed:@"frame.png"];
                iv.center = self.center;
                
                int ir = arc4random()%255;
                int ig = arc4random()%255;
                int ib = arc4random()%255;
                
                float fr = (float)ir;
                float fg = (float)ig;
                float fb = (float)ib;
                
                float r = fr/255.0;
                float g = fg/255.0;
                float b = fb/255.0;
                
                iv.layer.backgroundColor = [[UIColor clearColor]CGColor];
                iv.layer.borderColor = [[UIColor colorWithRed:r green:g blue:b alpha:1.0]CGColor];
                //                iv.layer.borderColor = [[UIColor clearColor]CGColor];
                [self insertSubview:iv atIndex:0];
                
                NSArray *array = @[iv,[NSValue valueWithCGPoint:self.center]];
                
                [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(continuousViews:) userInfo:array repeats:YES];
            }
            
        }
        view1.frame = CGRectMake(0, 0, view1.frame.size.width*1.01, view1.frame.size.height*(1.01));
    }
    //    view1.layer.cornerRadius = view1.frame.size.height/2;
    view1.center = [[array objectAtIndex:1]CGPointValue];
    
    
    //    count++;
    //
    //    NSLog(@"%d",count);
    
    
    view1.layer.borderWidth = view1.frame.size.height*_fBorderWidth;
    
}

@end
