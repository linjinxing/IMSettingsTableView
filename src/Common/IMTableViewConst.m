//
//  IMTableViewConst.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMTableViewConst.h"


const float IMTableViewControlSpace = 8.0f;

#define key @"key"
#define title @"title"
#define style @"style"
#define headerText @"headerText"
#define footerText  @"footerText"


/*  IMTableView Dictionary key */
NSString* const IMTableViewDictionaryKeyKey = key;
NSString* const IMTableViewDictionaryKeyHeaderText =  headerText;
NSString* const IMTableViewDictionaryKeyFooterText = footerText  ;
NSString* const IMTableViewDictionaryKeyTitle = title      ;
NSString* const IMTableViewDictionaryKeyStyle  = style     ;
NSString* const IMTableViewDictionaryKeySections = @"sections"   ;

/*  IMTableView sections Dictionary key */
NSString* const IMTableViewSectionDictionaryKeyHeaderText = headerText;
NSString* const IMTableViewSectionDictionaryKeyFooterText = footerText;
NSString* const IMTableViewSectionDictionaryKeyCells = @"cells"   ;

/*  IMTableView cell Dictionary key */
NSString* const IMTableViewCellDictionaryKeyKey  = key ;
NSString* const IMTableViewCellDictionaryKeyImageName   = @"imageName"    ;
NSString* const IMTableViewCellDictionaryKeyDetailTitle = @"detailTitle"   ;
NSString* const IMTableViewCellDictionaryKeyDefaultValue = @"defaultValue"  ;
NSString* const IMTableViewCellDictionaryKeyStyle = style       ;
NSString* const IMTableViewCellDictionaryKeySubDataSource = @"subDataSource" ;
NSString* const IMTableViewCellDictionaryKeyAccessoryType = @"accessoryType";

/*  IMTableViewStyle */
NSString* const IMTableViewStyleGroupedString = @"Grouped";
NSString* const IMTableViewStylePlainString   = @"Plain";

/*  IMTableViewCellStyle */
NSString* const IMTableViewCellStyleDefaultString   = @"Default";
NSString* const IMTableViewCellStyleValue1String    = @"Value1";
NSString* const IMTableViewCellStyleValue2String    = @"Value2";
NSString* const IMTableViewCellStyleSubtitleString  = @"Subtitle";
NSString* const IMTableViewCellStyleTextfieldString = @"Textfield";
NSString* const IMTableViewCellStyleSwitchString    = @"Switch";
NSString* const IMTableViewCellStyleButtonString    = @"Button";
NSString* const IMTableViewCellStylePasswordString    = @"Password";


/* IMTableViewCellReuseIdentifier */
NSString* const IMTableViewCellReuseIdentifierDefault        = @"IMTableViewCellReuseIdentifierDefault" ;
NSString* const IMTableViewCellReuseIdentifierStyleValue1    = @"IMTableViewCellReuseIdentifierValue1" ;
NSString* const IMTableViewCellReuseIdentifierStyleValue2    = @"IMTableViewCellReuseIdentifierValue2" ;
NSString* const IMTableViewCellReuseIdentifierStyleSubtitle  = @"IMTableViewCellReuseIdentifierSubtitle" ;
NSString* const IMTableViewCellReuseIdentifierStyleTextfield = @"IMTableViewCellReuseIdentifierTextfield" ;
NSString* const IMTableViewCellReuseIdentifierStyleSwitch    = @"IMTableViewCellReuseIdentifierSwitch" ;
NSString* const IMTableViewCellReuseIdentifierStyleButton    = @"IMTableViewCellReuseIdentifierButton" ;

/* IMTableViewCell Accessory type */
NSString* const IMTableViewCellAccessoryNone                   = @"None";
NSString* const IMTableViewCellAccessoryDisclosureIndicator    = @"DisclosureIndicator";
NSString* const IMTableViewCellAccessoryDetailDisclosureButton = @"DetailDisclosureButton";
NSString* const IMTableViewCellAccessoryCheckmark              = @"Checkmark";
NSString* const IMTableViewCellAccessoryDetailButton           = @"DetailButton";

//NSString* const IMTableViewString = @"";
//NSString* const IMTableViewString = @"";
//NSString* const IMTableViewString = @"";
//NSString* const IMTableViewString = @"";
//NSString* const IMTableViewString = @"";



