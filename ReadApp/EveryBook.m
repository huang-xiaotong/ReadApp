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
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
