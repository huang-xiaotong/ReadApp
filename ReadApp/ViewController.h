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
    UITableViewCell *m_cell;
}
@property (nonatomic, retain)NSArray *listbookPicture;
@property (nonatomic, retain)NSArray *listbookName;
@property (nonatomic, retain)NSArray *listbookAuthor;
@property (nonatomic, retain)NSArray *listbookPrice;
@property (nonatomic, retain)NSArray *listbookSummary;
@end
