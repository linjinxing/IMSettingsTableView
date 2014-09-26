//
//  IMTableViewController.h
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol IMSettingDataSource;

@interface IMSettingTableViewController : UITableViewController;
@property(strong, nonatomic) id<IMSettingDataSource> dataSrc;
+ (instancetype)tableViewControllerWithDataSource:(id<IMSettingDataSource>)dataSrc;

/* custom subclass of IMSettingTableViewController should register class
 before user tap the cell to enter next IMSettingTableViewController
 */
+ (void)registerViewControllerClass:(Class)cls forKey:(NSString*)key;

/* overwrite the following methods to handle event */

/* called when any value did change
   @param
     dict: hold all values and keys for current settings of table view.
     currentChangedKey: key for current changed setting
 */
- (void)valueDidChange:(NSDictionary*)dict key:(NSString*)currentChangedKey;

/* called when button is pressed 
    @param
    currentChangedKey: key for current changed setting
 */
- (void)buttonDidTouchUpInsideWithKey:(NSString*)key;
@end




