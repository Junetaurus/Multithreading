//
//  NSConditionLockDemo.m
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//

#import "NSConditionLockDemo.h"

@implementation NSConditionLockDemo {
    NSConditionLock *_lock;
    NSMutableArray *_objcArray;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _lock = [[NSConditionLock alloc] initWithCondition:0];
    }
    return self;
}

- (void)__sellTicket {
    [_lock lock];
    [super __sellTicket];
    [_lock unlock];
}

- (void)otherTest {
    _objcArray = [NSMutableArray array];
    
    [[[NSThread alloc] initWithTarget:self selector:@selector(__addObjc) object:nil] start];
    [[[NSThread alloc] initWithTarget:self selector:@selector(__removeObjc) object:nil] start];
}

- (void)__addObjc {
    [_lock lockWhenCondition:0];
    NSLog(@"等待添加元素");
    sleep(0.5);
    NSLog(@"开始添加元素");
    [_objcArray addObject:@""];
    NSLog(@"添加元素成功");
    [_lock unlockWithCondition:1];
}

- (void)__removeObjc {
    [_lock lockWhenCondition:1];
    NSLog(@"等待删除元素");
    [_objcArray removeLastObject];
    NSLog(@"删除元素成功");
    [_lock unlock];
}

@end

