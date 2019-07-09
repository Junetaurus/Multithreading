//
//  OSUnfairLockDemo.m
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//
/*
 os_unfair_lock用于取代不安全的OSSpinLock ，从iOS10开始才支持
 从底层调用看，等待os_unfair_lock锁的线程会处于休眠状态，并非忙等
 需要导入头文件#import <os/lock.h>
 */

#import "OSUnfairLockDemo.h"
#import <os/lock.h>

@implementation OSUnfairLockDemo {
    os_unfair_lock _lock;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _lock = OS_UNFAIR_LOCK_INIT;
    }
    return self;
}

- (void)__sellTicket {
    os_unfair_lock_lock(&_lock);
    [super __sellTicket];
    os_unfair_lock_unlock(&_lock);
}

@end
