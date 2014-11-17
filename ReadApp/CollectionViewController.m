//
//  CollectionViewController.m
//  ReadApp
//
//  Created by xyooyy on 14/10/29.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "CollectionViewController.h"
#import "EveryBookViewController.h"
#import "BookInformation.h"
#import "BookImageView.h"
@interface CollectionViewController ()

@end

@implementation CollectionViewController
@synthesize bookImage;
@synthesize bookName;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"图片列表";
    [self collectionView];
    if (_refreshHeaderView == nil) {
        EGORefreshTableHeaderView *view1 = [[EGORefreshTableHeaderView alloc] initWithFrame:CGRectMake(0.0f, 0.0f -self.view.bounds.size.height, self.view.frame.size.width, self.view.bounds.size.height)];
        view1.delegate = self;
        [m_collectionView addSubview:view1];
        _refreshHeaderView = view1;
    }
    [_refreshHeaderView refreshLastUpdatedDate];
    [self getdata];
    // Do any additional setup after loading the view.
}
-(UIView*)collectionView
{
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
    fl.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    fl.minimumLineSpacing = 5;
    m_collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 60, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height) collectionViewLayout:fl];
    m_collectionView.backgroundColor = [UIColor orangeColor];
    m_collectionView.delegate = self;
    m_collectionView.dataSource = self;
    [self.view addSubview:m_collectionView];
    return m_collectionView;
}
-(void)getdata
{
    bookName = [[NSMutableArray alloc]init];
    bookImage = [[NSMutableArray alloc]init];
    BookInformation *bookInformation = [[BookInformation alloc]init];
    for (int i = 0; i<[[bookInformation bookinformation] count]; i++) {
        [self.bookName addObject:[[bookInformation bookinformation][i] objectForKey:@"title"]];
        [self.bookImage addObject:[[bookInformation bookinformation][i] objectForKey:@"smallImage"]];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIImageView *)creatImageView :(NSString *)imagehttp :(UIView *)view
{
    BookImageView *imageView = [[BookImageView alloc]init];
    imageView.imageURL = imagehttp;
    imageView.placeholderImage = [UIImage imageNamed:@"深入理解计算机系统s.jpg"];
    [view addSubview:imageView];
    return imageView;
}
-(UILabel *)creatLabel :(id)bookname :(UIView *)view
{
    UILabel *booknamelabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, 96, 20)];
    booknamelabel.text = bookname;
    booknamelabel.font = [UIFont systemFontOfSize:12];
    booknamelabel.textColor = [UIColor blackColor];
    [view addSubview:booknamelabel];
    return booknamelabel;
}
#pragma mark - Collection View Data Source
-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.bookName.count;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(96, 120);
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%d",indexPath.row];
    [m_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:CellIdentifier];
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.backgroundColor = [UIColor brownColor];
    [self creatImageView:[self.bookImage objectAtIndex:indexPath.row] :cell.contentView];
    [self creatLabel:[self.bookName objectAtIndex:indexPath.row] :cell.contentView];
        return cell;
};
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = indexPath.row;
    EveryBookViewController *everybookController = [[EveryBookViewController alloc]init:[self.bookName objectAtIndex:row]];
    [self.navigationController pushViewController:everybookController animated:YES];    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark -
#pragma mark Data Source Loading / Reloading Methods

- (void)reloadTableViewDataSource{
	
	//  should be calling your tableviews data source model to reload
	//  put here just for demo
	_reloading = YES;
	
}

- (void)doneLoadingTableViewData{
	
	//  model should call this when its done loading
	_reloading = NO;
	[_refreshHeaderView egoRefreshScrollViewDataSourceDidFinishedLoading:m_collectionView];
	
}


#pragma mark -
#pragma mark UIScrollViewDelegate Methods

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
	
	[_refreshHeaderView egoRefreshScrollViewDidScroll:scrollView];
    
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
	
	[_refreshHeaderView egoRefreshScrollViewDidEndDragging:scrollView];
	
}


#pragma mark -
#pragma mark EGORefreshTableHeaderDelegate Methods

- (void)egoRefreshTableHeaderDidTriggerRefresh:(EGORefreshTableHeaderView*)view{
	
	[self reloadTableViewDataSource];
	[self performSelector:@selector(doneLoadingTableViewData) withObject:nil afterDelay:3.0];
	
}

- (BOOL)egoRefreshTableHeaderDataSourceIsLoading:(EGORefreshTableHeaderView*)view{
	
	return _reloading; // should return if data source model is reloading
	
}

- (NSDate*)egoRefreshTableHeaderDataSourceLastUpdated:(EGORefreshTableHeaderView*)view{
	
	return [NSDate date]; // should return date data source was last changed
	
}
@end
