//
//  ViewController.m
//  EAARuntimeMagic
//
//  Created by Andrey Ezhov on 12.10.16.
//  Copyright © 2016 EAA. All rights reserved.
//

#import "ViewController.h"

#import <objc/runtime.h>

#import "EAATestObject.h"


@interface ViewController ()

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self changeAllIVars];
}

-(void) changeAllIVars {
    
    EAATestObject* test = [[EAATestObject alloc] init];
    
    NSLog(@"%@", test);
    
    Ivar ivar = class_getInstanceVariable([EAATestObject class], "_iVarNumber");
    object_setIvar(test, ivar, @20);
    
    ivar = class_getInstanceVariable([EAATestObject class], "_readOnlyNumber");
    object_setIvar(test, ivar, @20);
    
    ivar = class_getInstanceVariable([EAATestObject class], "_privateNumber");
    object_setIvar(test, ivar, @20);
    
    NSLog(@"%@", test);
    
}


@end
