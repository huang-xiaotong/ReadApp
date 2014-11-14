//
//  EveryBookUpDataTableViewCell.m
//  ReadApp
//
//  Created by xyooyy on 14/11/14.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "EveryBookUpDataTableViewCell.h"
#import "CenterView.h"

@implementation EveryBookUpDataTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier bookImage:(UIImage*)bookimage bookName:(NSString *)bookname bookAuthor:(NSString *)bookauthor bookPrice:(NSString*)bookprice
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor =  [UIColor colorWithRed:200/255.0 green:240/255.0 blue:180/255.0 alpha:1];
        [self show:self.contentView image:bookimage];
        [self creatlabel:bookname :self.contentView :CGRectMake(120, 10, 70, 50) :@"标题:" :(CGRectMake(170, 10, 120, 50))];
        [self creatlabel:bookauthor :self.contentView :CGRectMake(120, 60, 70, 50) :@"作者:" :CGRectMake(170, 60, 120, 50)];
        [self creatlabel:bookprice :self.contentView :CGRectMake(120, 110, 70, 50) :@"价格:" :CGRectMake(170, 110, 120, 50)];
        // Initialization code
    }
    return self;
}
-(UIImageView *)creatImageView :(id)bookImage
{
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 105, 145)];
    UIImage *bookimage = [[UIImage alloc]init];
    bookimage = bookImage;
    imageView.image =bookimage;
    return imageView;
}
-(void)creatlabel:(NSString *)bookname :(UIView *)view :(CGRect)frame :(NSString*)tit :(CGRect)frametitlelabel
{
    CenterView *centerView = [[CenterView alloc]init];
    UILabel *title = [centerView creatLabel:frame :tit :18 :[UIColor blackColor]];
    UILabel *titlelabel = [centerView creatLabel:frametitlelabel :bookname :16 :[UIColor blackColor]];
    [view addSubview:title];
    [view addSubview:titlelabel];
}
-(UILabel*)creatLabel:(CGRect)frame :(NSString*)labelText :(double)fontsize :(UIColor *)textcolor
{
    UILabel *label = [[UILabel alloc]initWithFrame:frame];
    label.text = labelText;
    label.textColor =textcolor;
    label.font = [UIFont systemFontOfSize:fontsize];
    return label;
}
-(void)show :(UIView *)view image:(UIImage *)bookimage
{
    UIImageView *bookImage = [self creatImageView:bookimage];
    [view addSubview:bookImage];
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
