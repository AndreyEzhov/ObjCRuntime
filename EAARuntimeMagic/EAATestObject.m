//
//  EAATestObject.m
//  EAARuntimeMagic
//
//  Created by Andrey Ezhov on 12.10.16.
//  Copyright © 2016 EAA. All rights reserved.
//

#import "EAATestObject.h"


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
    }
    return self;
}

-(NSString *)description {
    return [NSString stringWithFormat:@"iVarNumber = %@, privateNumber = %@, readOnlyNumber = %@", _iVarNumber, _privateNumber, _readOnlyNumber];
}

@end
