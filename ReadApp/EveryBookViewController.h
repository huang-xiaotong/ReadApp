//
//  EveryBookViewController.h
//  ReadApp
//
//  Created by xyooyy on 14/10/31.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface EveryBookViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
{
//    NSMutableArray *listBookImage;
    UITableView *m_tableView;
    NSString *bookname;
    NSMutableArray *listBookName;
    NSString *name;
    NSArray *book;
//    NSMutableArray *listBookAuthor;
//    NSMutableArray *listBookPrice;
//    NSMutableArray *listBookSummary;
}
- (id)init:(NSString *)bookName;
@end
