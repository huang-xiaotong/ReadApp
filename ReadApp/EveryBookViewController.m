//
//  EveryBookViewController.m
//  ReadApp
//
//  Created by xyooyy on 14/10/31.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "EveryBookViewController.h"
#import "EveryBook.h"
#import "BookInformation.h"
#import "CenterView.h"
@interface EveryBookViewController ()

@end

@implementation EveryBookViewController

- (id)init:(NSString *)bookName
{
    self = [super init];
    if (self) {
        name = bookName;
        NSLog(@"name:%@",name);
    }
    return self;
}

- (void)viewDidLoad
{
    self.title = @"书籍详情";
//    self.view.backgroundColor = [UIColor whiteColor];
    m_tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:m_tableView];
    m_tableView.delegate = self;
    m_tableView.dataSource = self;
    [self getbookarray];
//    [self show:m_tableView];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)getbookarray
{
    BookInformation *bookInformation = [[BookInformation alloc]init];
    book = [[NSArray alloc]initWithArray:[bookInformation bookinformation]];
    listBookName = [[NSMutableArray alloc]init];
//    listBookImage = [[NSMutableArray alloc]init];
//    listBookPrice = [[NSMutableArray alloc]init];
//    listBookAuthor = [[NSMutableArray alloc]init];
    
    for (int i = 0; i<[book count]; i++)
    {
//        [listBookImage addObject:[book[i] objectForKey:@"Midimage"]];
        [listBookName addObject:[book[i] objectForKey:@"title"]];
//        [listBookAuthor addObject:[book[i] objectForKey:@"author"]];
//        [listBookPrice addObject:[book[i] objectForKey:@"price"]];
        }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)show :(UIView *)view
{
   int i = (unsigned long)[listBookName indexOfObject:name];
    EveryBook *everyBook = [[EveryBook alloc]init];
    UIImageView *bookImage = [everyBook creatImageView:[book[i] objectForKey:@"Midimage"]];
    [view addSubview:bookImage];
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
    if (indexPath.row == 0) {
        cell.backgroundColor =  [UIColor colorWithRed:200/255.0 green:240/255.0 blue:180/255.0 alpha:1];
        [self show:cell.contentView];
    EveryBook *every = [[EveryBook alloc]init];
    int i = (unsigned long)[listBookName indexOfObject:name];
        [every creatlabel:[book[i] objectForKey:@"title"] :cell.contentView :CGRectMake(120, 10, 70, 50) :@"标题:" :(CGRectMake(170, 10, 120, 50))];
        [every creatlabel:[book[i] objectForKey:@"author"] :cell.contentView :CGRectMake(120, 60, 70, 50) :@"作者:" :CGRectMake(170, 60, 120, 50)];
        [every creatlabel:[book[i] objectForKey:@"price"] :cell.contentView :CGRectMake(120, 110, 70, 50) :@"价格:" :CGRectMake(170, 110, 120, 50)];
    }
    if (indexPath.row == 1) {
        cell.backgroundColor = [UIColor grayColor];
        cell.textLabel.text = @"简介:";
    }
    if (indexPath.row == 2) {
        int i = (unsigned long)[listBookName indexOfObject:name];
        EveryBook *everyBook = [[EveryBook alloc]init];
        UILabel *summary = [everyBook creatLabel:CGRectMake(10, 10, 300, 280) :[book[i] objectForKey:@"summary"] :16 :[UIColor blackColor]];
        summary.numberOfLines = 0;
        [cell.contentView addSubview:summary];
        
    }
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
