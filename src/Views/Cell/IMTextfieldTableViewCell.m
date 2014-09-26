//
//  IMTextfieldTableViewCell.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMTextfieldTableViewCell.h"
#import "IMSettingDataSourceSectonItem.h"
#import "IMTableViewConst.h"

@interface IMTextfieldTableViewCell()
@property(strong, nonatomic)UITextField* textField;
@end

@implementation IMTextfieldTableViewCell
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (instancetype)initWithStyle:(IMTableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier item:(IMSettingDataSourceSectonItem*)item
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier item:item];
    if (self) {
        self.textField = [[UITextField alloc] init];
        self.textField.placeholder = [item detailTitle];
        [self.contentView addSubview:self.textField];
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textOfTextFieldDidChange:) name:UITextFieldTextDidChangeNotification object:self.textField];
    }
    return self;
}

- (void)textOfTextFieldDidChange:(NSNotification*)noti
{
    if (self.actionHandler)
        self.actionHandler(self, self.textField.text, UIControlEventValueChanged);
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGRect frame = self.contentView.bounds;
    if ([self.textLabel.text length]) {
        CGSize size = [self.textLabel.text sizeWithAttributes:@{NSFontAttributeName:self.textLabel.font}];
        CGRect textFrame = self.textLabel.frame;
        textFrame.size.width = size.width + IMTableViewControlSpace * 2;
        self.textLabel.frame = textFrame;
        
        frame.origin.x = self.textLabel.frame.size.width + IMTableViewControlSpace * 2;
        frame.size.width -= (self.textLabel.frame.size.width + IMTableViewControlSpace * 4);
    }
    self.textField.frame = frame;
}


@end
