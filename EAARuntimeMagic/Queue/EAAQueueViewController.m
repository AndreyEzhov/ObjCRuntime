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
    //[self testSyncSerialQueue];
    //[self testAsyncConcurrentQueue];
   //[self testSyncConcurrentQueue];
  
}

-(void) testAsyncSerialQueue {

    dispatch_queue_t testQueue1 = dispatch_queue_create("dispatch_queue_#1", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(testQueue1, ^{
        
        NSLog(@"Test #1");
        
        dispatch_async(testQueue1, ^{
            
            NSLog(@"Test #3");
            
        });
        
        NSLog(@"Test #2");
    });
}

-(void) testSyncSerialQueue {
    
    dispatch_queue_t testQueue1 = dispatch_queue_create("dispatch_queue_#2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(testQueue1, ^{
        
        NSLog(@"Test #1");
        
        dispatch_sync(testQueue1, ^{
            
            NSLog(@"Test #3");
            
        });
        
        NSLog(@"Test #2");
    });
}

-(void) testAsyncConcurrentQueue {

    dispatch_queue_t testQueue1 = dispatch_queue_create("dispatch_queue_#3", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(testQueue1, ^{
        
        NSLog(@"Test #1");
        
        dispatch_async(testQueue1, ^{
            
            NSLog(@"Test #3");
            
        });
        
        NSLog(@"Test #2");
    });
}

-(void) testSyncConcurrentQueue {
    
    dispatch_queue_t testQueue1 = dispatch_queue_create("dispatch_queue_#4", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(testQueue1, ^{
        
        NSLog(@"Test #1");
        
        dispatch_sync(testQueue1, ^{
            
            NSLog(@"Test #3");
            
        });
        
        NSLog(@"Test #2");
    });
}


@end
