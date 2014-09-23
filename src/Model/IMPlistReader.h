//
//  IMPlistReader.h
//  IMTableView
//
//  Created by LoveYouForever on 9/23/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMPlistReader : NSObject
@property(strong, nonatomic, readonly) id result;
+ (instancetype)plistReaderWithPath:(NSString*)path;
@end
