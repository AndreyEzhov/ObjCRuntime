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
    
    [self callPrivate];
    
    [self duckVoice];
}


-(void) duckVoice {
    EAATestObject* test = [[EAATestObject alloc] init];
    if ([test respondsToSelector:@selector(voice)]) {
        [test performSelector:@selector(voice)];
    }
}


-(void) callPrivate {
    
    EAATestObject* test = [[EAATestObject alloc] init];
    
    Class class = [EAATestObject class];
    
    unsigned int methodCount;
    
    Method *methods = class_copyMethodList(class, &methodCount);
    
    for (unsigned int i = 0; i < methodCount; i++) {
        Method method = methods[i];
        
        SEL sel = method_getName(method);
        
        NSString* name = NSStringFromSelector(sel);
                
        if ([name isEqualToString:@"privateMethod"]) {
            [test performSelector:sel];
        }
        
        NSLog(@"method Name %@", name);
    }
    
    free(methods);

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
