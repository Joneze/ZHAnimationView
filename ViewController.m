//
//  ViewController.m
//  ZHAnimationView
//
//  Created by jay on 16/5/31.
//  Copyright © 2016年 曾辉. All rights reserved.
//

#import "ViewController.h"
#import "ZHAnimationView.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    ZHAnimationView *aView = [[ZHAnimationView alloc] initWithFrame:CGRectMake(0, 0, 200, 200)];
    aView.center = self.view.center;
    aView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:aView];
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
