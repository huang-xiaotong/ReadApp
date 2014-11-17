//
//  CollectionViewController.h
//  ReadApp
//
//  Created by xyooyy on 14/10/29.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EGORefreshTableHeaderView.h"
@interface CollectionViewController : UIViewController
<UICollectionViewDataSource, UICollectionViewDelegate, EGORefreshTableHeaderDelegate>
{
    NSMutableArray *listNameAndImage;
    UICollectionView *m_collectionView;
    EGORefreshTableHeaderView *_refreshHeaderView;
    BOOL _reloading;
}
@property (strong, nonatomic)NSMutableArray *bookImage;// 数据源
@property (nonatomic, retain)NSMutableArray *bookName;
- (void)reloadTableViewDataSource;
- (void)doneLoadingTableViewData;
@end
