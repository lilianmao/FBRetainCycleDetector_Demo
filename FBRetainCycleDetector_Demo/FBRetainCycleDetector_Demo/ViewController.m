//
//  ViewController.m
//  FBRetainCycleDetector_Demo
//
//  Created by 李林 on 2017/8/21.
//  Copyright © 2017年 lee. All rights reserved.
//

#import "ViewController.h"
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>

@interface ViewController ()

@property (nonatomic, strong) id first;
@property (nonatomic, weak) id second;
@property (nonatomic, strong) id strong1;
@property (nonatomic, strong) id strong2;
@property (nonatomic, strong) id strong3;
@property (nonatomic, strong) id strong4;
@property (nonatomic, strong) id strong5;
@property (nonatomic, strong) id strong6;
@property (nonatomic, strong) id strong7;
@property (nonatomic, strong) id strong8;
@property (nonatomic, strong) id strong9;
@property (nonatomic, strong) id strong10;
@property (nonatomic, strong) id strong11;
@property (nonatomic, strong) id strong12;
@property (nonatomic, strong) id strong13;
@property (nonatomic, strong) id strong14;
@property (nonatomic, strong) id strong15;
@property (nonatomic, strong) id strong16;
@property (nonatomic, strong) id strong17;
@property (nonatomic, strong) id strong18;
@property (nonatomic, strong) id strong19;
@property (nonatomic, strong) id strong20;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, copy) BOOL (^blockWithParamter)(NSString *input);

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self blockRetainCycle];
    [self timerRetainCycle];
    
    [self testRetainCycle];
}

- (void)blockRetainCycle {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%@", self);
    });
}

- (void)timerRetainCycle {
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        NSLog(@"timer");
    }];
}

- (void)testRetainCycle {
    FBRetainCycleDetector *detector = [[FBRetainCycleDetector alloc] init];
    [detector addCandidate:self];
    NSSet *retainCycles = [detector findRetainCycles];
    NSLog(@"%@", retainCycles);
}

@end
