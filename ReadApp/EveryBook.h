//
//  EveryBook.h
//  ReadApp
//
//  Created by xyooyy on 14/10/31.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EveryBook : UIView

-(UIImageView *)creatImageView :(id)bookImage;
-(void)creatlabel:(NSString *)bookname :(UIView *)view :(CGRect)frame :(NSString*)tit :(CGRect)frametitlelabel;
-(UILabel*)creatLabel:(CGRect)frame :(NSString*)labelText :(double)fontsize :(UIColor *)textcolor;
@end
