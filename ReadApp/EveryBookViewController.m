//
//  EveryBookViewController.m
//  ReadApp
//
//  Created by xyooyy on 14/10/31.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//  http://blog.csdn.net/rhljiayou/article/details/17506921 自定义tableviewcell

#import "EveryBookViewController.h"
#import "BookInformation.h"
#import "CenterView.h"
#import "EveryBookSummaryTableViewCell.h"
#import "EveryBookUpDataTableViewCell.h"
@interface EveryBookViewController ()

@end

@implementation EveryBookViewController

- (id)init:(NSString *)bookName
{
    self = [super init];
    if (self) {
        name = bookName;
    }
    return self;
}

- (void)viewDidLoad
{
    self.title = @"书籍详情";
    m_tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:m_tableView];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    [self getbookarray];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)getbookarray
{
    BookInformation *bookInformation = [[BookInformation alloc]init];
    book = [[NSArray alloc]initWithArray:[bookInformation bookinformation]];
    listBookName = [[NSMutableArray alloc]init];
    for (int i = 0; i<[book count]; i++)
    {
        [listBookName addObject:[book[i] objectForKey:@"title"]];
        }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
        return 160.0f;
    else if (indexPath.row == 1)
        return 50.0f;
    return 290.0f;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"Cell%d",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    int i = (unsigned long)[listBookName indexOfObject:name];
    if (indexPath.row == 0)
        cell = [[EveryBookUpDataTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier bookImage:[book[i] objectForKey:@"Midimage"] bookName:[book[i] objectForKey:@"title"] bookAuthor:[book[i] objectForKey:@"author"] bookPrice:[book[i] objectForKey:@"price"]];
    if (indexPath.row == 1) {
        cell.backgroundColor = [UIColor grayColor];
        cell.textLabel.text = @"简介:";
    }
    if (indexPath.row == 2)
        cell = [[EveryBookSummaryTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier summarylabel:[book[i] objectForKey:@"summary"]];
    return cell;
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

@end
