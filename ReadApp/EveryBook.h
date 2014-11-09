//
//  EveryBook.h
//  ReadApp
//
//  Created by xyooyy on 14/10/31.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EveryBook : UIView
-(void)theUpperData:(UITableViewCell*)onecell titlelabel:(NSString *)bookname authorlabel:(NSString *)bookauthor pricelabel:(NSString *)bookprice image:(UIImage *)bookimage;
-(void)theLowerHalf:(UITableViewCell*)secondcell summarylabel:(NSString *)booksummary;

@end
