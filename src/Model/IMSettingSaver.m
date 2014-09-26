//
//  IMSettingSaver.m
//  IMSettingTableView
//
//  Created by LoveYouForever on 9/24/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMSettingSaver.h"

@interface IMSettingSaver()
@property(strong, nonatomic) NSMutableDictionary* dict;
@end

@implementation IMSettingSaver

+ (instancetype)settingSaverWithKeys:(NSArray*)keys
{
    IMSettingSaver* ss = [[self alloc] init];
    NSMutableDictionary* dictTmp = [NSMutableDictionary dictionaryWithCapacity:[keys count]];
    for (NSString* key in keys) {
        NSObject* obj = [[NSUserDefaults standardUserDefaults] objectForKey:key];
        if (obj) [dictTmp setObject:obj forKey:key];
    }
    ss.dict = dictTmp;
    return ss;
}

- (NSDictionary*)valuesAndKeys
{
    return [self.dict copy];
}

- (void)save
{
    for (id key in self.dict) {
        [[NSUserDefaults standardUserDefaults] setObject:[self.dict objectForKey:key] forKey:key];
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (id)objectForKey:(NSString *)defaultName
{
   return self.dict[defaultName];
}

- (void)setObject:(NSObject*)obj forKey:(NSString *)defaultName
{
    [self.dict setObject:obj forKey:defaultName];
}


- (void)removeObjectForKey:(NSString *)defaultName
{
    [self.dict removeObjectForKey:defaultName];
}

- (NSString *)stringForKey:(NSString *)defaultName
{
    return [self.dict valueForKey:defaultName];
}

- (NSArray *)arrayForKey:(NSString *)defaultName
{
   return self.dict[defaultName];
}

- (NSDictionary *)dictionaryForKey:(NSString *)defaultName
{
   return self.dict[defaultName];
}

- (NSData *)dataForKey:(NSString *)defaultName
{
   return self.dict[defaultName];
}

- (NSArray *)stringArrayForKey:(NSString *)defaultName
{
   return self.dict[defaultName];
}

- (NSInteger)integerForKey:(NSString *)defaultName
{
   return [self.dict[defaultName] integerValue];
}

- (float)floatForKey:(NSString *)defaultName
{
   return [self.dict[defaultName] floatValue];
}

- (double)doubleForKey:(NSString *)defaultName
{
   return [self.dict[defaultName] doubleValue];
}

- (BOOL)boolForKey:(NSString *)defaultName
{
   return [self.dict[defaultName] boolValue];
}

- (NSURL *)URLForKey:(NSString *)defaultName
{
   return self.dict[defaultName];
}

- (void)setInteger:(NSInteger)value forKey:(NSString *)defaultName
{
    self.dict[defaultName] = @(value);
}

- (void)setFloat:(float)value forKey:(NSString *)defaultName
{
    self.dict[defaultName] = @(value);
}
- (void)setDouble:(double)value forKey:(NSString *)defaultName
{
    self.dict[defaultName] = @(value);
}

- (void)setBool:(BOOL)value forKey:(NSString *)defaultName
{
    self.dict[defaultName] = @(value);
}

- (void)setURL:(NSURL *)url forKey:(NSString *)defaultName
{
    self.dict[defaultName] = url;
}

@end
