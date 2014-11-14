//
//  EveryBookUpDataTableViewCell.h
//  ReadApp
//
//  Created by xyooyy on 14/11/14.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EveryBookUpDataTableViewCell : UITableViewCell
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier bookImage:(UIImage*)bookimage bookName:(NSString *)bookname bookAuthor:(NSString *)bookauthor bookPrice:(NSString*)bookprice;

@end
