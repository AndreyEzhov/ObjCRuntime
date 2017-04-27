//
//  EAATransformVC.m
//  EAARuntimeMagic
//
//  Created by Andrey Ezhov on 18.04.17.
//  Copyright © 2017 EAA. All rights reserved.
//

#import "EAATransformVC.h"

@interface EAATransformVC ()

@end

@implementation EAATransformVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView* view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view1.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view1];
    view1.transform = CGAffineTransformMakeScale(0.5, 0.5);
    [self printForView:view1];
    

    UIView* view2 = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    view2.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view2];
    view2.transform = CGAffineTransformMakeRotation(45);
    [self printForView:view2];
    
    
    UIView* view3 = [[UIView alloc] initWithFrame:CGRectMake(100, 500, 100, 100)];
    view3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view3];
    [self printForView:view3];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
            view3.frame = CGRectMake(50, 450, 50, 50);
            [self printForView:view3];
        });
    });

}


-(void) printForView:(UIView*) view {
    NSLog(@"Frame: %@\nBounds: %@", NSStringFromCGRect(view.frame), NSStringFromCGRect(view.bounds));
}


@end
