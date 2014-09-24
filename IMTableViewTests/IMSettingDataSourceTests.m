//
//  IMSettingDataSourceTests.m
//  IMSettingTableView
//
//  Created by LoveYouForever on 9/24/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IMSettingDataSource.h"
#import "IMTableViewConst.h"

@interface IMSettingDataSourceTests : XCTestCase
@property(strong, nonatomic) id<IMSettingDataSource> ds;
@end

@implementation IMSettingDataSourceTests

- (void)setUp {
    [super setUp];
    self.ds = [IMSettingDataSource settingDataSourceWithDictionary:
               [NSDictionary dictionaryWithContentsOfFile:
                                                         [[NSBundle mainBundle] pathForResource:@"test"
                                                                                ofType:@"plst"]
                ]
               ];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testDataSource {
    // This is an example of a functional test case.
    XCTAssertNotNil(self.ds);
    XCTAssertEqualObjects(self.ds.title, @"titleTest");
    XCTAssertEqualObjects(self.ds.headerText, @"headerTextTest");
    XCTAssertEqualObjects(self.ds.footerText, @"footerTextTest");
    XCTAssertTrue(self.ds.tableViewStyle == UITableViewStyleGrouped);
}

- (void)testDataSourceSection {
    XCTAssertTrue(self.ds.numOfSections == 2);
    XCTAssertTrue([self.ds numberOfRowsInSection:0] == 8);
    XCTAssertTrue([self.ds numberOfRowsInSection:1] == 3);
    
    XCTAssertEqualObjects([self.ds headerTextForSection:1], @"s1headerText");
    XCTAssertEqualObjects([self.ds footerTextForSection:1], @"s1footerText");
}

- (void)testDataSourceSectionItem {
    NSArray* accessoryTypes = @[IMTableViewCellAccessoryNone, IMTableViewCellAccessoryDisclosureIndicator, IMTableViewCellAccessoryDetailDisclosureButton, IMTableViewCellAccessoryCheckmark, IMTableViewCellAccessoryDetailButton];
//    NSArray* cellStyles = @[IMTableViewCellStyleDefaultString, IMTableViewCellStyleValue1String, IMTableViewCellStyleValue2String, IMTableViewCellStyleSubtitleString, IMTableViewCellStyleTextfieldString, IMTableViewCellStyleSwitchString, IMTableViewCellStyleButtonString, IMTableViewCellStylePasswordString];
    for (int i = 0; i < self.ds.numOfSections; ++i) {
        for (int j = 0; j < [self.ds numberOfRowsInSection:i]; ++j) {
            id<IMSettingDataSourceSectonItem> item = [self.ds itemAtIndexPath:[NSIndexPath indexPathForRow:j inSection:i]];
            NSString* itemPrefix = [NSString stringWithFormat:@"s%di%d", i, j];
            XCTAssertEqualObjects([item key], ([itemPrefix stringByAppendingString:@"key"]));
            XCTAssertEqualObjects([item imageName], ([NSString stringWithFormat:@"image%d", j]));
            XCTAssertEqualObjects([item textTitle], ([itemPrefix stringByAppendingString:@"textTitle"]));
            XCTAssertEqualObjects([item detailTitle], ([itemPrefix stringByAppendingString:@"detailTitle"]));
            if ([[item accessoryType] length]) {
                XCTAssertEqualObjects([item accessoryType], ([accessoryTypes objectAtIndex:j]));
            }
            XCTAssertTrue([item cellStyle] == j);
        }
    }
}

- (void)testDataSourceSectionItemDefaultValue
{
    id<IMSettingDataSourceSectonItem> item = [self.ds itemAtIndexPath:[NSIndexPath indexPathForRow:4 inSection:0]];
    XCTAssertEqualObjects([item defaultValue], @"s0i4DefaultValue");
    
    item = [self.ds itemAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0]];
    XCTAssertTrue([[item defaultValue] boolValue]);
}

- (void)testDataSourceSectionItemSubDataSource {
    id<IMSettingDataSourceSectonItem> item = [self.ds itemAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
    id<IMSettingDataSource> ds = [item subDataSource];
    XCTAssertNotNil(ds);
    XCTAssertEqualObjects(ds.title, @"section0item0subdatasourceTitle");
    XCTAssertTrue(self.ds.tableViewStyle == UITableViewStylePlain);
    
    XCTAssertTrue(self.ds.numOfSections == 1);
    XCTAssertTrue([self.ds numberOfRowsInSection:0] == 3);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
