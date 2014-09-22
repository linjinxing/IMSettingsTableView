//
//  IMSection.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMSection.h"

@implementation IMSection
- (id)copyWithZone:(NSZone *)zone
{
    IMSection* sec = [[[self class] alloc] init];
    sec.headerText = self.headerText;
    sec.footerText = self.footerText;
    sec.items = self.items;
    return sec;
}
@end
