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
//    self.view.backgroundColor = [UIColor whiteColor];
    m_tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
    [self.view addSubview:m_tableView];
    [self getbookarray];
    [self show:m_tableView];
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
-(void)getbookarray
{
    BookInformation *bookInformation = [[BookInformation alloc]init];
    book = [[NSArray alloc]initWithArray:[bookInformation bookinformation]];
    listBookName = [[NSMutableArray alloc]init];
    listBookImage = [[NSMutableArray alloc]init];
    for (int i = 0; i<[book count]; i++)
    {
        [listBookImage addObject:[book[i] objectForKey:@"Midimage"]];
        [listBookName addObject:[book[i] objectForKey:@"title"]];
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
    UIImageView *bookImage = [everyBook creatImageView:listBookImage[i]];
    [view addSubview:bookImage];
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
