//
//  CenterTableViewCell.m
//  ReadApp
//
//  Created by xyooyy on 14/11/14.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "EveryBookSummaryTableViewCell.h"

@implementation EveryBookSummaryTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier summarylabel:(NSString *)booksummary
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        UILabel *summary = [self creatLabel:CGRectMake(10, 10, 300, 280) :booksummary :16 :[UIColor blackColor]];
        summary.numberOfLines = 0;
        [self addSubview:summary];
        // Initialization code
    }
    return self;
}
-(UILabel*)creatLabel:(CGRect)frame :(NSString*)labelText :(double)fontsize :(UIColor *)textcolor
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = labelText;
    label.textColor =textcolor;
    label.font = [UIFont systemFontOfSize:fontsize];
    return label;
}
- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
