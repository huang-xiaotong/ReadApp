//
//  ViewController.h
//  ReadApp
//
//  Created by xyooyy on 14/10/20.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface ViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>
{
    UITableView *m_tableView;
    NSArray *book;
    NSMutableArray *listbookPicture;
    NSMutableArray *listbookName;
    NSMutableArray *listbookAuthor;
    NSMutableArray *listbookPrice;
    NSMutableArray *listbookSummary;

}
@end
