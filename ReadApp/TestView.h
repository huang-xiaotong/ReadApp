//
//  TestView.h
//  ReadApp
//
//  Created by xyooyy on 14/11/9.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestView : UIView
-(UIButton *)creatbutton :(id)color :(CGRect)buttonframe :(NSString *)title;
-(UILabel *)creatlabel :(id)color :(CGRect)frame :(NSString *)title :(id)textcolor :(UIView*)view;

@end
