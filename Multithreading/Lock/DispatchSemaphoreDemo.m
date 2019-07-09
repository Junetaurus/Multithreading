//
//  DispatchSemaphoreDemo.m
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//

#import "DispatchSemaphoreDemo.h"

@implementation DispatchSemaphoreDemo {
    dispatch_semaphore_t _semaphore;
    dispatch_semaphore_t _semaphore1;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        //设置最大并发量
        _semaphore = dispatch_semaphore_create(1);
        _semaphore1 = dispatch_semaphore_create(3);
    }
    return self;
}

- (void)__sellTicket {
    dispatch_semaphore_wait(_semaphore, DISPATCH_TIME_FOREVER);
    [super __sellTicket];
    dispatch_semaphore_signal(_semaphore);
}

- (void)otherTest {
    for (NSInteger i = 0; i < 15; i++) {
        [[[NSThread alloc] initWithTarget:self selector:@selector(__test) object:nil] start];
    }
}

- (void)__test {
    dispatch_semaphore_wait(_semaphore1, DISPATCH_TIME_FOREVER);
    sleep(1);
    NSLog(@"%s ---%@", __func__, [NSThread currentThread]);
    dispatch_semaphore_signal(_semaphore1);
}

@end
