//
//  NSLockDemo.m
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//

#import "NSLockDemo.h"

@implementation NSLockDemo {
    NSLock *_lock;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _lock = [[NSLock alloc] init];
    }
    return self;
}

- (void)__sellTicket {
    [_lock lock];
    [super __sellTicket];
    [_lock unlock];
}

@end
