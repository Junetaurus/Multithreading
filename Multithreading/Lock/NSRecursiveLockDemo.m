//
//  NSRecursiveLockDemo.m
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//

#import "NSRecursiveLockDemo.h"

@implementation NSRecursiveLockDemo {
    NSRecursiveLock *_lock;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _lock = [[NSRecursiveLock alloc] init];
    }
    return self;
}

- (void)__sellTicket {
    [_lock lock];
    [super __sellTicket];
    [_lock unlock];
}

- (void)otherTest {
    [_lock lock];
    static int count = 0;
    NSLog(@"%s", __func__);
    if (count < 5) {
       count ++;
       [self otherTest];
    }
    [_lock unlock];
}

@end
