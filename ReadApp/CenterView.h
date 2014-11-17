//
//  CenterView.h
//  ReadApp
//
//  Created by xyooyy on 14/10/25.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CenterView : UIView
-(void)imageView:(NSString *)imageHttp :(id)view;
-(void)AuthorAndSummary:(NSString *)Authorname :(NSString *)Summary :(id)view;
-(UILabel*)creatLabel:(CGRect)frame :(NSString*)labelText :(double)fontsize :(UIColor *)textcolor;
-(void)BookName:(NSString *)bookName :(id)view :(NSString *)price;
@end
