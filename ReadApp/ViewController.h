//
//  ViewController.h
//  ReadApp
//
//  Created by xyooyy on 14/10/20.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
@interface ViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, EGORefreshTableHeaderDelegate>
{
    UITableView *m_tableView;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
}
@property int flag;
- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;
@end
