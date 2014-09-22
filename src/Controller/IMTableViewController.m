//
//  IMTableViewController.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMTableViewController.h"
#import "IMTableViewDataSource.h"

@implementation IMTableViewController
+ (instancetype)tableViewControllerWithDataSource:(IMTableViewDataSource* )dataSrc
{
    IMTableViewController* tableViewCtrl = [[[self class] alloc] initWithStyle:dataSrc.tableViewStyle];
    return tableViewCtrl;
}




@end
