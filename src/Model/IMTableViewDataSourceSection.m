//
//  IMSection.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMTableViewDataSourceSection.h"

@implementation IMTableViewDataSourceSection
- (id)copyWithZone:(NSZone *)zone
{
    IMTableViewDataSourceSection* sec = [[[self class] alloc] init];
    sec.headerText = self.headerText;
    sec.footerText = self.footerText;
    sec.cells = self.cells;
    return sec;
}
@end



