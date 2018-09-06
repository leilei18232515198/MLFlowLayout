//
//  ViewController.m
//  StreamCollectionView
//
//  Created by 268Edu on 2018/5/28.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import "ViewController.h"
#import "MLWaterFlowLayout.h"
#import "MLSecondFlowLayout.h"
#import "WQKBookCollectionFlowLayout.h"
#define width     [UIScreen mainScreen].bounds.size.width
#define height    [UIScreen mainScreen].bounds.size.height

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property (nonatomic, strong)UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    WQKBookCollectionFlowLayout *flowlayout = [[WQKBookCollectionFlowLayout alloc]init];
//    flowlayout.count = 10;
    //    两个相邻item之间的间距
//    flowlayout.minimumLineSpacing = 10;
    //    行间距
    flowlayout.minimumLineSpacing = 0;
    flowlayout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
//    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, width,rows*100+(rows-1)*10 ) collectionViewLayout:flowlayout];
     UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 20, width,height-20) collectionViewLayout:flowlayout];
    collectionView.backgroundColor = [UIColor whiteColor];
    collectionView.delegate = self;
    collectionView.dataSource = self;
    collectionView.showsHorizontalScrollIndicator = NO;
//    collectionView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
    //    collectionView.pagingEnabled = YES;
//    collectionView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:collectionView];
    
    [collectionView registerClass:NSClassFromString(@"UICollectionViewCell") forCellWithReuseIdentifier:@"cellID"];
    [collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"viewID"];

//    [collectionView registerClass:NSClassFromString(@"UICollectionElementKindSectionHeader") forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"view"];
    self.collectionView = collectionView;
    
}


- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 3;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 11;
    }else if (section == 1)
    {
        return 11;
    }
    return 10;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    CGFloat r = arc4random_uniform(256)/255.0;
    CGFloat g = arc4random_uniform(256)/255.0;
    CGFloat b = arc4random_uniform(256)/255.0;
    if (indexPath.section == 0||indexPath.section == 1) {
    if (indexPath.row%3 == 0) {
        
    cell.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    }else if(indexPath.row%3 == 1){
        cell.backgroundColor = [UIColor yellowColor];
    }else {
        cell.backgroundColor = [UIColor grayColor];
    }
    }else {
        cell.backgroundColor = [UIColor colorWithRed:r green:g blue:b alpha:1];
    }
        
//    cell.backgroundColor = [UIColor magentaColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(width, 80);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionReusableView *view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"viewID" forIndexPath:indexPath ];
    view.backgroundColor = [UIColor blackColor];
    return view;
}

//定义每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CGFloat leftItemWidth = width * (277. / 750);
    CGFloat leftItemHeight = leftItemWidth * (347. / 280);
    int rows=(11 + 3 -1)/3;
    if (indexPath.section == 0) {
        return CGSizeMake(0, 100-80+rows*leftItemHeight);
    }else if(indexPath.section == 1){
        return CGSizeMake(0, rows*leftItemHeight);
    }
    return CGSizeMake(width, 100);

}




@end
