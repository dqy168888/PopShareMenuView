//
//  CAReplicatorLayer+catTest.m
//  test22
//
//  Created by dqy on 2019/3/14.
//  Copyright © 2019年 dqy. All rights reserved.
//

#import "CAReplicatorLayer+catTest.h"
#import <objc/runtime.h>

static NSString *nameWithSetterGetterKey= @"nameWithSetterGetterKey";

@implementation CAReplicatorLayer (catTest)

-(void)setNameWithSetterGetterKey:(NSString *)nameWithSetterGetterKey
{
    self.nameWithSetterGetterKey=nameWithSetterGetterKey;
}


//运行时实现setter方法
- (void)setNameWithSetterGetter:(NSString *)nameWithSetterGetter {
    objc_setAssociatedObject(self, &nameWithSetterGetterKey, nameWithSetterGetter, OBJC_ASSOCIATION_COPY);
}

//运行时实现getter方法
- (NSString *)nameWithSetterGetter {
    return objc_getAssociatedObject(self, &nameWithSetterGetterKey);
}

@end
