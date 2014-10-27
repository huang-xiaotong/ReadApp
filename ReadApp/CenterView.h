//
//  CenterView.h
//  ReadApp
//
//  Created by xyooyy on 14/10/25.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CenterView : UIView
{
    NSMutableArray *listbookPrice;
    NSMutableArray *listBookName;
}
-(NSMutableArray*)bookImage;
-(NSMutableArray*)bookAuthor;
-(NSArray *)bookPrice;
-(NSArray *)bookName;
@end
