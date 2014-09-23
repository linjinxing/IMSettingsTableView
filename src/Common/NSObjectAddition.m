//
//  Addition.m
//  IMTableView
//
//  Created by LoveYouForever on 9/23/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <objc/runtime.h>
#import "NSObjectAddition.h"

@implementation NSObject(Addition)
- (NSArray *)allPropertyNames
{
    unsigned count;
    objc_property_t *properties = class_copyPropertyList([self class], &count);
    
    NSMutableArray *rv = [NSMutableArray array];
    
    unsigned i;
    for (i = 0; i < count; i++)
    {
        objc_property_t property = properties[i];
        NSString *name = [NSString stringWithUTF8String:property_getName(property)];
        [rv addObject:name];
    }
    
    free(properties);
    
    return rv;
}
@end
