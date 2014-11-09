//
//  EveryBook.m
//  ReadApp
//
//  Created by xyooyy on 14/10/31.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "EveryBook.h"
#import "CenterView.h"

@implementation EveryBook

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
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
//    int i = (unsigned long)[listBookName indexOfObject:name];
//    EveryBook *everyBook = [[EveryBook alloc]init];
    UIImageView *bookImage = [self creatImageView:bookimage];
    [view addSubview:bookImage];
}
-(void)theUpperData:(UITableViewCell*)onecell titlelabel:(NSString *)bookname authorlabel:(NSString *)bookauthor pricelabel:(NSString *)bookprice image:(UIImage *)bookimage
{
    onecell.backgroundColor =  [UIColor colorWithRed:200/255.0 green:240/255.0 blue:180/255.0 alpha:1];
    [self show:onecell.contentView image:bookimage];
//    EveryBook *every = [[EveryBook alloc]init];
//    int i = (unsigned long)[listBookName indexOfObject:name];
    [self creatlabel:bookname :onecell.contentView :CGRectMake(120, 10, 70, 50) :@"标题:" :(CGRectMake(170, 10, 120, 50))];
    [self creatlabel:bookauthor :onecell.contentView :CGRectMake(120, 60, 70, 50) :@"作者:" :CGRectMake(170, 60, 120, 50)];
    [self creatlabel:bookprice :onecell.contentView :CGRectMake(120, 110, 70, 50) :@"价格:" :CGRectMake(170, 110, 120, 50)];
}
-(void)theLowerHalf:(UITableViewCell*)secondcell summarylabel:(NSString *)booksummary
{
//    int i = (unsigned long)[listBookName indexOfObject:name];
//    EveryBook *everyBook = [[EveryBook alloc]init];
    UILabel *summary = [self creatLabel:CGRectMake(10, 10, 300, 280) :booksummary :16 :[UIColor blackColor]];
    summary.numberOfLines = 0;
    [secondcell.contentView addSubview:summary];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
