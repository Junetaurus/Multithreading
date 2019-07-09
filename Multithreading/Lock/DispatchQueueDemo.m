//
//  DispatchQueueDemo.m
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//

#import "DispatchQueueDemo.h"

@implementation DispatchQueueDemo {
    dispatch_queue_t _queue;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _queue = dispatch_queue_create("lock_queue", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}

- (void)__sellTicket {
    dispatch_sync(_queue, ^{
        [super __sellTicket];
    });
}

@end
