//
//  IMTextfieldTableViewCell.m
//  IMTableView
//
//  Created by LoveYouForever on 9/22/14.
//  Copyright (c) 2014 i-Move. All rights reserved.
//

#import "IMTextfieldTableViewCell.h"
#import "IMTableViewConst.h"

@interface IMTextfieldTableViewCell()
@property(strong, nonatomic)UITextField* textField;
@end

@implementation IMTextfieldTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.textField = [[UITextField alloc] init];
        [self.contentView addSubview:self.textField];
    }
    return self;
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
    CGRect frame = self.contentView.frame;
    if ([self.textLabel.text length]) {
        frame.origin.x = self.textLabel.frame.size.width + IMTableViewControlSpace;
        frame.size.width -= (self.textLabel.frame.size.width + IMTableViewControlSpace * 2);
    }
    self.textField.frame = frame;
}


@end
