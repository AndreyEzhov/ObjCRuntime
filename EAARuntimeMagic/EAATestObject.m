//
//  EAATestObject.m
//  EAARuntimeMagic
//
//  Created by Andrey Ezhov on 12.10.16.
//  Copyright © 2016 EAA. All rights reserved.
//

#import "EAATestObject.h"
#import <objc/runtime.h>


@interface EAATestObject() {
    NSNumber* _iVarNumber;
    int _sipleInt;
}

@property (strong, nonatomic) NSNumber* privateNumber;

@end

@implementation EAATestObject

- (instancetype)init
{
    self = [super init];
    if (self) {
        _privateNumber = @10;
        _iVarNumber = @10;
        _readOnlyNumber = @10;
        
        _duck = [[EAADuckObject alloc] init];
    }
    return self;
}

-(void) privateMethod {
    NSLog(@"PRIVATE!!!");
}

-(NSString *)description {
    return [NSString stringWithFormat:@"iVarNumber = %@, privateNumber = %@, readOnlyNumber = %@", _iVarNumber, _privateNumber, _readOnlyNumber];
}

- (id)forwardingTargetForSelector:(SEL)aSelector {
    if (class_respondsToSelector([self class], aSelector)) {
        return self;
    }
    
    if ([self.duck respondsToSelector:aSelector]) {
        return self.duck;
    }
    
    return [super forwardingTargetForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    if (class_respondsToSelector([self class], aSelector)) {
        return YES;
    }
    
    if ([self.duck respondsToSelector:aSelector]) {
        return YES;
    }
    
    return [super respondsToSelector:aSelector];
}

@end
