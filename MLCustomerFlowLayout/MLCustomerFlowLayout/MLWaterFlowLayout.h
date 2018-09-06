//
//  MLWaterFlowLayout.h
//  StreamCollectionView
//
//  Created by 268Edu on 2018/5/28.
//  Copyright © 2018年 268Edu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLWaterFlowLayout : UICollectionViewFlowLayout
/// 需要布局的元素个数。本质上就是 cell 的个数
@property (nonatomic,assign) NSInteger count;
@property (nonatomic,assign) CGFloat maxY;
@end
