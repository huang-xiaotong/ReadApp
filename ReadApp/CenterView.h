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
    NSMutableArray *listBookAuthor;
    NSMutableArray *listBookSummary;
    NSMutableArray *listBookArrayauthor;
    NSMutableArray *listBookImage;
    NSMutableArray *listBookArrayImageSmall;
    NSMutableArray *listBookImageSmall;
}
-(NSArray *)bookAuthor;
-(NSArray *)bookPrice;
-(NSArray *)bookName;
-(NSArray *)bookSummary;
-(NSArray *)bookImageSmall;
@end
