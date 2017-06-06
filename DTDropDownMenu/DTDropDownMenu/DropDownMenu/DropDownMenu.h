//
//  DropDownMenu.h
//  DTDropDownMenu
//
//  Created by dengtao on 2017/6/5.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DTIndexPath : NSObject

@property (nonatomic, assign) NSInteger column;
@property (nonatomic, assign) NSInteger leftOrRight;// 0 左边   1 右边
@property (nonatomic, assign) NSInteger leftRow;// 左边行
@property (nonatomic, assign) NSInteger row;// 右边行

- (instancetype)initWithColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow row:(NSInteger)row;

+ (instancetype)indexPathWithCol:(NSInteger)col leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow row:(NSInteger)row;

@end


@class DropDownMenu;

@protocol DropDownMenuDataSource <NSObject>

@required

- (NSInteger)menu:(DropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow;
- (NSString *)menu:(DropDownMenu *)menu titleForRowAtIndexPath:(DTIndexPath *)indexPath;
- (NSString *)menu:(DropDownMenu *)menu titleForColumn:(NSInteger)column;

- (CGFloat)widthRatioOfLeftColumn:(NSInteger)column;//表视图显示时，左边表显示比例

- (BOOL)haveRightTableViewInColumn:(NSInteger)column;//表视图显示时，是否需要两个表显示

- (NSInteger)currentLeftSelectedRow:(NSInteger)column;//返回当前菜单左边表选中行

@optional

- (NSInteger)numberOfColumnsInMenu:(DropDownMenu *)menu;//default value is 1

- (BOOL)displayByCollectionViewInColumn:(NSInteger)column;//是否需要显示为UICollectionView 默认为否

@end


@protocol DropDownMenuDelegate <NSObject>

@optional

- (void)menu:(DropDownMenu *)menu didSelectRowAtIndexPath:(DTIndexPath *)indexPath;

@end


@interface DropDownMenu : UIView<UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (nonatomic, weak) id <DropDownMenuDataSource> dataSource;
@property (nonatomic, weak) id <DropDownMenuDelegate> delegate;

@property (nonatomic, strong) UIColor *indicatorColor;
@property (nonatomic, strong) UIColor *textColor;
@property (nonatomic, strong) UIColor *separatorColor;

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;

- (void)menuTapped:(UITapGestureRecognizer *)paramSender;//默认选中第一项
- (void)backgroundTapped:(UITapGestureRecognizer *)paramSender;//隐藏背景
- (instancetype)initWithOrigin:(CGPoint)origin andHeight:(CGFloat)height;
- (NSString *)titleForRowAtIndexPath:(DTIndexPath *)indexPath;

@property (nonatomic, assign) BOOL isShowList;



@end
