//
//  main.m
//  FBRetainCycleDetector_Demo
//
//  Created by 李林 on 2017/8/21.
//  Copyright © 2017年 lee. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#import "A.h"
#import "B.h"
#import "C.h"
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>

int main(int argc, char * argv[]) {
    @autoreleasepool {
//        A *a = [[A alloc] init];
//        B *b = [[B alloc] init];
//        C *c = [[C alloc] init];
//        a.bObject = b;
//        b.aObject = a;
//        a.cObject = c;
//        a.weakObject = [[NSObject alloc] init];
//        a.blockWithParamter = ^BOOL(NSString *input) {
//            return YES;
//        };
//        
//        FBRetainCycleDetector *detector = [[FBRetainCycleDetector alloc] init];
//        [detector addCandidate:a];
//        NSSet *retainCycles = [detector findRetainCycles];
//        NSLog(@"%@", retainCycles);
        
        NSObject *firstObject = [NSObject new];
        __attribute__((objc_precise_lifetime)) NSObject *object = [NSObject new];
        __weak NSObject *secondObject = object;
        NSObject *thirdObject = [NSObject new];
        
        __unused void (^block)() = ^{
            __unused NSObject *first = firstObject;
            __unused NSObject *second = secondObject;
            __unused NSObject *third = thirdObject;
        };
        
        FBRetainCycleDetector *detector = [FBRetainCycleDetector new];
        [detector addCandidate:block];
        [detector findRetainCycles];    
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
