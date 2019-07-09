//
//  NSConditionDemo.m
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//

#import "NSConditionDemo.h"

@implementation NSConditionDemo {
    NSCondition *_lock;
    NSMutableArray *_objcArray;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _lock = [[NSCondition alloc] init];
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
    [_lock lock];
    NSLog(@"等待添加元素");
    sleep(0.5);
    NSLog(@"开始添加元素");
    [_objcArray addObject:@""];
    NSLog(@"添加元素成功");
    //激活一个
    [_lock signal];
    //激活所有的
//    [_lock broadcast];
    [_lock unlock];
}

- (void)__removeObjc {
    [_lock lock];
    NSLog(@"等待删除元素");
    if (!_objcArray.count) {
        NSLog(@"没有元素，等待添加元素");
        [_lock wait];
    }
    [_objcArray removeLastObject];
    NSLog(@"删除元素成功");
    [_lock unlock];
}

@end
