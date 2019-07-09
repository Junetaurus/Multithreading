//
//  SynchronizedDemo.m
//  Multithreading
//
//  Created by Zhang on 2019/7/9.
//  Copyright © 2019 cue. All rights reserved.
//

#import "SynchronizedDemo.h"

@implementation SynchronizedDemo

- (void)__sellTicket {
    @synchronized (self) {
        [super __sellTicket];
    }
}

@end
