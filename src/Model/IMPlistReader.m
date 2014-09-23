//
//  IMPlistReader.m
//  IMTableView
//
//  Created by LoveYouForever on 9/23/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMPlistReader.h"

@interface IMPlistReader()
@property(strong, nonatomic) id result;
@end

@implementation IMPlistReader
+ (instancetype)plistReaderWithPath:(NSString*)path
{
    IMPlistReader* r = [[[self class] alloc] init];
    NSDictionary* dict = [NSDictionary dictionaryWithContentsOfFile:path];
    r.result = dict;
    return r;
}
@end
