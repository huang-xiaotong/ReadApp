//
//  CenterView.m
//  ReadApp
//
//  Created by xyooyy on 14/10/25.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "CenterView.h"

@implementation CenterView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
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
-(UIImageView*)imageBookPicture:(id)imageName
{
    UIImage *image = [[UIImage alloc] init];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, 100, 100);
    imageView.image =imageName;
    return imageView;
}
-(void)imageViewANDBookName:(id)imageview :(NSString *)bookName :(id)view :(NSString *)price
{
    UIImageView *imageView = [self imageBookPicture:imageview];
    [view addSubview:imageView];
    UILabel *labelName = [self creatLabel:CGRectMake(100, 10, 200, 20) :bookName :14 :[UIColor blueColor]];
    [view addSubview:labelName];
    UILabel *labelprice = [self creatLabel:CGRectMake(100, 60, 45, 20) :@"价格：" :14 :[UIColor blackColor]];
    [view addSubview:labelprice];
    UILabel *labelPrice = [self creatLabel:CGRectMake(145, 60, 80, 20) :price :12 :[UIColor blackColor]];
    [view addSubview:labelPrice];
}
-(void)AuthorAndSummary:(NSString *)Authorname :(NSString *)Summary :(id)view
{
    UILabel *labelAuthor = [self creatLabel:CGRectMake(100, 30, 45, 30) :@"作者：" :14 :[UIColor blackColor]];
    [view addSubview:labelAuthor];
    UILabel *labelAuthorName = [self creatLabel:CGRectMake(145, 30, 180, 30) :Authorname :12 :[UIColor blackColor]];
    [view addSubview:labelAuthorName];
    UILabel *labelsummary = [self creatLabel:CGRectMake(100, 80, 45, 20) :@"简介：" :14 :[UIColor blackColor]];
    [view addSubview:labelsummary];
    UILabel *labelSummary = [self creatLabel:CGRectMake(145, 80, 160, 20) :Summary :12 :[UIColor blackColor]];
    [view addSubview:labelSummary];
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
