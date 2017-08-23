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

@property (nonatomic, strong) NSTimer *timer;

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
