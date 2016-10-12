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
    
    Class class = [EAATestObject class];
    
    unsigned int varCount;
    
    Ivar *vars = class_copyIvarList(class, &varCount);
    
    for (int i = 0; i < varCount; i++) {
        Ivar var = vars[i];
        
        const char* name = ivar_getName(var);
        
        NSString* iVarName = [NSString stringWithUTF8String:name];
        
        
        const char* typeEncoding = ivar_getTypeEncoding(var);
        
        NSString* iVarClassName = [NSString stringWithCString:typeEncoding encoding:NSUTF8StringEncoding];
                
        NSLog(@"Class %@, Name %@", iVarClassName, iVarName);
        
    }
    
    free(vars);
    
    NSLog(@"%@", test);
    
    Ivar ivar = class_getInstanceVariable(class, "_iVarNumber");
    object_setIvar(test, ivar, @20);
    
    ivar = class_getInstanceVariable(class, "_readOnlyNumber");
    object_setIvar(test, ivar, @20);
    
    ivar = class_getInstanceVariable(class, "_privateNumber");
    object_setIvar(test, ivar, @20);
    
    NSLog(@"%@", test);
    
}


@end
