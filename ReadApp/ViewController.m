//
//  ViewController.m
//  ReadApp
//   iOS学习之UINavigationController详解与使用(一)添加UIBarButtonItem
//http://beyondvincent.com/blog/2013/11/03/120-customize-navigation-status-bar-ios-7/
//http://blog.csdn.net/totogo2010/article/details/8016129
//http://www.howzhi.com/group/iosDevelop/discuss/10134 collectionView
//http://rainbownight.blog.51cto.com/1336585/1323780
//http://www.bkjia.com/IOSjc/883000.html
//https://github.com/mutualmobile/MMDrawerController/blob/master/KitchenSink/ExampleFiles/MMAppDelegate.m
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
#import "testViewController.h"
@interface ViewController ()
@end
@implementation ViewController
@synthesize flag;
- (void)viewDidLoad
{
    [super viewDidLoad];
    flag = 0;
    self.title = @"书单";
    self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
    m_tableView = [[UITableView alloc]initWithFrame:self.view.frame];
    m_tableView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:m_tableView];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    [self setupRightPicButton];
    [self setupLeftMenuButton];
    [self getlistBookName];
}
-(NSMutableArray *)getlistBookName
{
     NSArray *book = [self getBook];
    NSMutableArray *getlistbookName = [[NSMutableArray alloc]init];
    for (int i = 0; i<[book count]; i++)
    {
        [getlistbookName addObject:[book[i] objectForKey:@"title"]];
    }
    return getlistbookName;
}
-(void)setupRightPicButton
{
    MMDrawerBarButtonItem *rightButton = [[MMDrawerBarButtonItem alloc]initWithTarget:self action:@selector(rightButtonPress)];
    [self.navigationItem setRightBarButtonItem:rightButton animated:YES];
}
-(void)rightButtonPress
{
    CollectionViewController *pictureCtrl = [[CollectionViewController alloc]init];
    if(flag == 0)
    {
        [self addChildViewController:pictureCtrl];
        UIView *view = [[UIView alloc]initWithFrame:pictureCtrl.view.frame];
        view = pictureCtrl.view;
        [m_tableView removeFromSuperview];
        [self.view addSubview:view];
        flag = 1;
    }
    else if (flag == 1)
    {
    [pictureCtrl removeFromParentViewController];
    [self.view addSubview:m_tableView];
    flag = 0;
    }
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
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *listbookName = [self getlistBookName];
    return listbookName.count;
}
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%d",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor lightTextColor];
    }
    [self CellShow:indexPath.row :cell.contentView];
    return cell;
}
-(void)CellShow :(int)row :(UIView*)contentview
{
    NSMutableArray *listbookName = [self getlistBookName];
    NSArray *book = [self getBook];
    CenterView *centerView = [[CenterView alloc]init];
    NSMutableArray *Picture = [[NSMutableArray alloc]init];
    NSMutableArray *Author = [[NSMutableArray alloc]init];
    NSMutableArray *Summary = [[NSMutableArray alloc]init];
    NSMutableArray *Price = [[NSMutableArray alloc]init];
    for (int index = 0; index < [book count]; index++) {
        [Picture addObject:[book[index] objectForKey:@"smallimage"]];
        [Author addObject:[book[index] objectForKey:@"author"]];
        [Summary addObject:[book[index] objectForKey:@"summary"]];
        [Price addObject:[book[index] objectForKey:@"price"]];
    }
    [centerView imageViewANDBookName:[Picture objectAtIndex:row] :[listbookName objectAtIndex:row] :contentview :[Price objectAtIndex:row]];
    [centerView AuthorAndSummary:[Author objectAtIndex:row] :[Summary objectAtIndex:row] :contentview];
}
-(NSArray *)getBook
{
    BookInformation *bookInformation = [[BookInformation alloc]init];
    NSArray *book = [bookInformation bookinformation];
    return book;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSUInteger row = indexPath.row;
    NSArray *listbookName = [self getlistBookName];
    EveryBookViewController *everybookController = [[EveryBookViewController alloc]init:[listbookName objectAtIndex:row]];
    [self.navigationController pushViewController:everybookController animated:YES];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

@end
