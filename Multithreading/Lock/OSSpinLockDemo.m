//
//  OSSpinLockDemo.m
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//

#import "OSSpinLockDemo.h"
#import <libkern/OSAtomic.h>

@implementation OSSpinLockDemo {
    OSSpinLock _lock;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _lock = OS_SPINLOCK_INIT;
    }
    return self;
}

- (void)__sellTicket {
    OSSpinLockLock(&_lock);
    [super __sellTicket];
    OSSpinLockUnlock(&_lock);
}

@end
