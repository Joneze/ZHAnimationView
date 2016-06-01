//
//  ZHAnimationView.m
//  ZHAnimationView
//
//  Created by jay on 16/6/1.
//  Copyright © 2016年 曾辉. All rights reserved.
//

#import "ZHAnimationView.h"

@implementation ZHAnimationView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self creatAnimationView];
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

-(void)creatAnimationView
{
    /** CAReplicatorLayer可以复制自己子层的layer,并且复制的出来的layer和原来的子layer拥有相同的动效*/
    CAReplicatorLayer *replicatorLayer = [CAReplicatorLayer layer];
    
    replicatorLayer.bounds = CGRectMake(0.0,0.0,100.0,100.0);
    
    replicatorLayer.cornerRadius = 10.0;
    
    /** 视图相对于父视图的重心位置*/
    replicatorLayer.position = self.center;
    
    replicatorLayer.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.1].CGColor;
    
    [self.layer addSublayer:replicatorLayer];
    
    
    CALayer *dot = [CALayer layer];
    dot.bounds = CGRectMake(0, 0, 10, 10);
    dot.position = CGPointMake(50, 20);
    dot.backgroundColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.6].CGColor;
    dot.cornerRadius = 5;
    dot.masksToBounds = YES;
    
    [replicatorLayer addSublayer:dot];
    
    CGFloat count = 10.0;
    
    replicatorLayer.instanceCount = count; //小圆圈的个数
    
    CGFloat nrDots = 2 * M_PI/count;
    replicatorLayer.instanceTransform = CATransform3DMakeRotation(nrDots, 0, 0, 1); //每次旋转的角度等于2π/ 10
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    animation.duration = 1; //1秒的延迟动画。在到原来的点上做缩放变化
    animation.fromValue = @(1);
    animation.toValue = @(0.1);
    animation.repeatCount = MAXFLOAT;
    [dot addAnimation:animation forKey:nil];
    
    replicatorLayer.instanceDelay = 1.0/count; //使动画动起来的秘诀就是给出一点延迟到每一个副本
    
    dot.transform = CATransform3DMakeScale(0.01, 0.01, 0.01); //解决旋转衔接效果
}

@end
