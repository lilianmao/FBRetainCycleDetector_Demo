//
//  B.h
//  FBRetainCycleDetector_Demo
//
//  Created by 李林 on 2017/8/24.
//  Copyright © 2017年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class A;

@interface B : NSObject

@property (nonatomic, strong) A *aObject;

@end
