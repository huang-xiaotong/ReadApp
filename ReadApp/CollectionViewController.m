//
//  CollectionViewController.m
//  ReadApp
//
//  Created by xyooyy on 14/10/29.
//  Copyright (c) 2014年 黄晓彤. All rights reserved.
//

#import "CollectionViewController.h"
//#import "CenterView.h"
#import "BookInformation.h"
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
    self.title = @"图片列表";
    UICollectionViewFlowLayout *fl = [[UICollectionViewFlowLayout alloc]init];
    fl.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
    fl.minimumLineSpacing = 5;
    m_collectionView = [[UICollectionView alloc]initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:fl];
    m_collectionView.backgroundColor = [UIColor orangeColor];
    m_collectionView.delegate = self;
    m_collectionView.dataSource = self;
    [self.view addSubview:m_collectionView];
    bookName = [[NSMutableArray alloc]init];
    bookImage = [[NSMutableArray alloc]init];
    BookInformation *bookInformation = [[BookInformation alloc]init];
    for (int i = 0; i<[[bookInformation bookinformation] count]; i++) {
        [self.bookName addObject:[[bookInformation bookinformation][i] objectForKey:@"title"]];
        [self.bookImage addObject:[[bookInformation bookinformation][i] objectForKey:@"smallimage"]];
    }
    listNameAndImage = [[NSMutableArray alloc]init];
    for(NSInteger index = 0;index<[bookImage count]; index++){
        UIImage *image = bookImage[index];
        NSString *title = bookName[index];
        NSArray *bookNameAndImage = [[NSArray alloc]initWithObjects:image,title, nil];
        [listNameAndImage addObject:bookNameAndImage];
    }
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIImageView *)creatImageView :(id)bookimage :(UIView *)view
{
    UIImage *image = [[UIImage alloc]init];
    UIImageView *imageView = [[UIImageView alloc]initWithImage:image];
    imageView.frame = CGRectMake(0, 0, 96, 100);
    imageView.image = bookimage;
    imageView.backgroundColor = [UIColor redColor];
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
