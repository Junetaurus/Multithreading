//
//  BaseMultithread.m
//  Multithreading
//
//  Created by Zhang on 2019/7/8.
//  Copyright © 2019 cue. All rights reserved.
//

#import "BaseMultithread.h"

@implementation BaseMultithread {
    int _totalTicket;
}

- (void)ticketTest {
    
    _totalTicket = 50;
    
    dispatch_queue_t queue = dispatch_get_global_queue(0, 0);
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self __sellTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self __sellTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self __sellTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self __sellTicket];
        }
    });
    
    dispatch_async(queue, ^{
        for (NSInteger i = 0; i < 10; i++) {
            [self __sellTicket];
        }
    });
    
    NSLog(@"测试结果应该为还剩下%d张票 --- %@", 0, [NSThread currentThread]);
}

- (void)otherTest {
    
}

- (void)__sellTicket {
    sleep(.3);
    _totalTicket --;
    NSLog(@"卖了1张票，还剩下%d张票 --- %@", _totalTicket, [NSThread currentThread]);
}

@end
