//
//  WQKBookCollectionFlowLayout.m
//  OilReading
//
//  Created by AlexCorleone on 2018/5/17.
//  Copyright © 2018年 Magic. All rights reserved.
//

#import "WQKBookCollectionFlowLayout.h"
#define kScreenWidth     [UIScreen mainScreen].bounds.size.width
#define height    [UIScreen mainScreen].bounds.size.height

@interface WQKBookCollectionFlowLayout()

@property (nonatomic, strong) NSMutableArray *layOutItemArray;

@end

@implementation WQKBookCollectionFlowLayout

#pragma mark - setter && getter
- (NSMutableArray *)layOutItemArray
{
    if (!_layOutItemArray)
    {
        self.layOutItemArray = @[].mutableCopy;
    }
    return _layOutItemArray;
}

- (void)prepareLayout
{
    [super prepareLayout];
    CGFloat leftItemWidth = kScreenWidth * (277. / 750);
    CGFloat leftItemHeight = leftItemWidth * (347. / 280);
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    NSInteger count1 = [self.collectionView numberOfItemsInSection:1];
    int rows=((int)count + 3 -1)/3;
    
    for (int i = 0; i < 2; i++) {
    UICollectionViewLayoutAttributes *layoutAttributeHeader = [UICollectionViewLayoutAttributes layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader withIndexPath:[NSIndexPath indexPathWithIndex:i]];
        if (i == 0) {
        layoutAttributeHeader.frame = CGRectMake(0, 0, kScreenWidth, 100);
        }else {
        layoutAttributeHeader.frame = CGRectMake(0, rows*leftItemHeight+100, kScreenWidth, 80);
        }
    [self.layOutItemArray addObject:layoutAttributeHeader];
    }
    
    for (NSInteger i = 0; i < count; i++) {
        CGFloat mlheight = i/3*leftItemHeight;
        UICollectionViewLayoutAttributes *layoutAttribute = [self creatLayoutAttributeindexRow:i section:0];
        if (i%3 == 0)
        {
            layoutAttribute.frame = CGRectMake(0, mlheight+100, leftItemWidth, leftItemHeight);
        }else if (i%3 == 1)
        {   layoutAttribute.frame = CGRectMake(leftItemWidth, mlheight+100, kScreenWidth - leftItemWidth, leftItemHeight / 2);
        }else if (i%3 == 2)
        {
            layoutAttribute.frame = CGRectMake(leftItemWidth, mlheight+leftItemHeight / 2+100, kScreenWidth - leftItemWidth, leftItemHeight / 2);
        }
        [self.layOutItemArray addObject:layoutAttribute];
    }

        for (NSInteger i = 0; i < count1; i++) {
            CGFloat mlheight = i/3*leftItemHeight;
            UICollectionViewLayoutAttributes *layoutAttribute = [self creatLayoutAttributeindexRow:i section:1];
            if (i%3 == 0)
        {
            layoutAttribute.frame = CGRectMake(0, mlheight+100+rows*leftItemHeight+80, leftItemWidth, leftItemHeight);
        }else if (i%3 == 1)
        {
            layoutAttribute.frame = CGRectMake(leftItemWidth, mlheight+100+rows*leftItemHeight+80, kScreenWidth - leftItemWidth, leftItemHeight / 2);
            [self.layOutItemArray addObject:layoutAttribute];
        }else if (i%3 == 2)
        {
            layoutAttribute.frame = CGRectMake(leftItemWidth, mlheight+leftItemHeight / 2+100+rows*leftItemHeight+80, kScreenWidth - leftItemWidth, leftItemHeight / 2);
        }
        [self.layOutItemArray addObject:layoutAttribute];
    }

}

-(UICollectionViewLayoutAttributes*)creatLayoutAttributeindexRow:(NSInteger)row section:(NSInteger)section{
    UICollectionViewLayoutAttributes *layoutAttribute = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:[NSIndexPath indexPathForItem:row inSection:section]];
    return layoutAttribute;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return YES;
}


- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSArray <UICollectionViewLayoutAttributes *> *layoutArray = [[NSArray alloc] initWithArray:[super layoutAttributesForElementsInRect:rect] copyItems:YES];
    if (layoutArray.count == 2)
    {
        return layoutArray;
    }

    for (NSInteger i = 0; i < layoutArray.count; i++)
    {
        UICollectionViewLayoutAttributes *layout = layoutArray[i];
        if (layout.indexPath.section > 1)
        {
            if ([_layOutItemArray containsObject:layout]) {
                [_layOutItemArray removeObject:layout];
            }
            [_layOutItemArray addObject:layout];

        }
    }
    return [_layOutItemArray copy];
}

@end
