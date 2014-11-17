//
//  LeftViewController.m
//  ReadApp
//
//  Created by xyooyy on 14/10/22.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "LeftViewController.h"
#import "UIViewController+MMDrawerController.h"
#import "BookInformation.h"
#import "CollectionViewController.h"
@interface LeftViewController ()

@end

@implementation LeftViewController
@synthesize listbookmenu;
- (id)init :(ViewController *)viewControl :(testViewController *)testControl
{
    self = [super init];
    if (self) {
        viewCtrl = viewControl;
        testCtrl = testControl;
    }
    return self;
}
- (void)viewDidLoad
{
    self.title = @"分类";
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    [self.view addSubview:tableView];
    tableView.delegate = self;
    tableView.dataSource = self;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 12;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"分类";
}
-(UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.contentView.backgroundColor =[UIColor colorWithRed:78.0/255.0 green:200.0/255.0 blue:200.0/255.0 alpha:1.0];
    if (indexPath.row == 0) {
        cell.textLabel.text = @"书单";
    }
    else if (indexPath.row == 1)
    {
        cell.textLabel.text = @"test";
    }
    cell.textLabel.font = [UIFont boldSystemFontOfSize:16];
    cell.textLabel.textColor = [UIColor blueColor];
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        [self.mm_drawerController setCenterViewController:viewCtrl withFullCloseAnimation:NO completion:nil];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
    else {
        [self.mm_drawerController setCenterViewController:testCtrl withFullCloseAnimation:NO completion:nil];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    }
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
