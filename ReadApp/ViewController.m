//
//  ViewController.m
//  ReadApp
//   iOS学习之UINavigationController详解与使用(一)添加UIBarButtonItem
//http://beyondvincent.com/blog/2013/11/03/120-customize-navigation-status-bar-ios-7/
//http://blog.csdn.net/totogo2010/article/details/8016129
//http://www.howzhi.com/group/iosDevelop/discuss/10134 collectionView
//http://rainbownight.blog.51cto.com/1336585/1323780
//http://www.bkjia.com/IOSjc/883000.html
//  Created by xyooyy on 14/10/20.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "ViewController.h"
#import "LeftViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "CenterView.h"
#import "BookInformation.h"
#import "CollectionViewController.h"
#import "EveryBookViewController.h"
@interface ViewController ()
@end
@implementation ViewController
@synthesize listbookPicture;
@synthesize listbookName;
@synthesize listbookAuthor;
@synthesize listbookPrice;
@synthesize listbookSummary;
- (void)viewDidLoad
{
    self.title = @"书单";
    m_tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    m_tableView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:m_tableView];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    [self setupRightPicButton];
    [self setupLeftMenuButton];
    [self CenterView];
    [super viewDidLoad];
}
-(void) CenterView
{
    BookInformation *bookInformation = [[BookInformation alloc]init];
    self.listbookPicture = [bookInformation bookImageSmall];
    self.listbookName = [bookInformation bookName];
    self.listbookAuthor = [bookInformation bookAuthor];
    self.listbookPrice = [bookInformation bookPrice];
    self.listbookSummary = [bookInformation bookSummary];
}
-(void)setupRightPicButton
{
    MMDrawerBarButtonItem *rightButton = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(rightButtonPress)];
    [self.navigationItem setRightBarButtonItem:rightButton animated:YES];
}
-(void)rightButtonPress
{
    CollectionViewController *pictureCtrl = [[CollectionViewController alloc]init];
    [self.navigationController pushViewController:pictureCtrl animated:YES];
}
- (void)setupLeftMenuButton
{
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress)];
    [self.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
}
- (void)leftDrawerButtonPress
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 110.0f;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return listbookName.count;
}
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%d",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor lightTextColor];
    }
    CenterView *centerView = [[CenterView alloc]init];
    [centerView imageViewANDBookName:[self.listbookPicture objectAtIndex:indexPath.row] :[self.listbookName objectAtIndex:indexPath.row] :cell.contentView :[self.listbookPrice objectAtIndex:indexPath.row]];
    [centerView AuthorAndSummary:[self.listbookAuthor objectAtIndex:indexPath.row] :[self.listbookSummary objectAtIndex:indexPath.row] :cell.contentView];
        return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    EveryBookViewController *everybookController = [[EveryBookViewController alloc]init];
    [self.navigationController pushViewController:everybookController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
