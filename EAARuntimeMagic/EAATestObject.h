//
//  EAATestObject.h
//  EAARuntimeMagic
//
//  Created by Andrey Ezhov on 12.10.16.
//  Copyright © 2016 EAA. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EAADuckObject.h"

@interface EAATestObject : NSObject

@property (readonly, strong, nonatomic) NSNumber* readOnlyNumber;

@property (readonly, strong, nonatomic) EAADuckObject* duck;

@end
