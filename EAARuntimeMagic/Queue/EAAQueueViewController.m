//
//  EAAQueueViewController.m
//  EAARuntimeMagic
//
//  Created by Andrey Ezhov on 27.04.17.
//  Copyright © 2017 EAA. All rights reserved.
//

#import "EAAQueueViewController.h"

@interface EAAQueueViewController ()

@end

@implementation EAAQueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self testAsyncSerialQueue];
    
    //Deadlock! Crush!
    //[self testSyncSerialQueue];
    
    
    [self testAsyncConcurrentQueue];
    [self testSyncConcurrentQueue];
    
}

-(void) testAsyncSerialQueue {
    
    dispatch_queue_t testQueue1 = dispatch_queue_create("dispatch_queue_#1", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(testQueue1, ^{
        
        NSLog(@"Serial Async Test #1");
        
        dispatch_async(testQueue1, ^{
            NSLog(@"Serial Async Test #3");
        });
        
        NSLog(@"Serial Async Test #2");
    });
}

-(void) testSyncSerialQueue {
    
    dispatch_queue_t testQueue2 = dispatch_queue_create("dispatch_queue_#2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(testQueue2, ^{

        NSLog(@"Serial Sync Test #1");
        
        dispatch_sync(testQueue2, ^{
            NSLog(@"Serial Sync Test #3");
        });
        
        NSLog(@"Serial Sync Test #2");
    });
}

-(void) testAsyncConcurrentQueue {
    
    dispatch_queue_t testQueue3 = dispatch_queue_create("dispatch_queue_#3", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(testQueue3, ^{
        
        NSLog(@"Concurrent Async Test #1");
        
        dispatch_async(testQueue3, ^{
            NSLog(@"Concurrent Async Test #3");
        });
        
        NSLog(@"Concurrent Async Test #2");
    });
}

-(void) testSyncConcurrentQueue {
    
    dispatch_queue_t testQueue4 = dispatch_queue_create("dispatch_queue_#4", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(testQueue4, ^{
        
        NSLog(@"Concurrent Sync Test #1");
        
        dispatch_sync(testQueue4, ^{
            NSLog(@"Concurrent Sync Test #3");
        });
        
        NSLog(@"Concurrent Sync Test #2");
    });
}


@end
