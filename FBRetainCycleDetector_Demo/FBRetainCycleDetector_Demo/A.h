//
//  A.h
//  FBRetainCycleDetector_Demo
//
//  Created by 李林 on 2017/8/24.
//  Copyright © 2017年 lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class B;
@class C;

@interface A : NSObject

@property (nonatomic, strong) B *bObject;
@property (nonatomic, strong) C *cObject;
@property (nonatomic, weak) id weakObject;

@property (nonatomic, copy) BOOL (^blockWithParamter)(NSString *input);

@end
