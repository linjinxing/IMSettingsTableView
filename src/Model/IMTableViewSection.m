//
//  IMSection.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMTableViewSection.h"

@implementation IMTableViewSection
- (id)copyWithZone:(NSZone *)zone
{
    IMTableViewSection* sec = [[[self class] alloc] init];
    sec.headerText = self.headerText;
    sec.footerText = self.footerText;
    sec.items = self.items;
    return sec;
}
@end
