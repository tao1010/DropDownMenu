//
//  ViewController.m
//  DTDropDownMenu
//
//  Created by dengtao on 2017/6/5.
//  Copyright © 2017年 JingXian. All rights reserved.
//

#import "ViewController.h"
#import "DropDownMenu.h"


@interface ViewController ()<DropDownMenuDataSource,DropDownMenuDelegate>{

    NSArray *_data1;
    NSArray *_data2;
    NSArray *_data3;
    
    NSInteger _currentData1Index;
    NSInteger _currentData2Index;
    NSInteger _currentData3Index;
}

@property (nonatomic,strong) DropDownMenu *menu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self configData];
    [self.view addSubview:self.menu];
}

#pragma mark - ConfigData
- (void)configData{
    
    _currentData1Index = 0;
    _currentData2Index = 0;
    _currentData3Index = 0;
    _data1 = @[@"中国人民银行",@"中国建设银行",@"中国交通银行",@"中国农业银行",@"中国工商银行"];
    _data2 = @[@"北京市",@"重庆市",@"四川省",@"云南省",@"贵州省"];

    _data3 = @[@"北京市",@"重庆市",@"成都市",@"昆明市",@"贵阳市"];
}

#pragma mark - DropDownMenuDataSource,DropDownMenuDelegate

- (NSInteger)numberOfColumnsInMenu:(DropDownMenu *)menu {
    
    return 3;
}

-(BOOL)displayByCollectionViewInColumn:(NSInteger)column{
    
    return YES;//YES|CollectionView  NO|TableView
}

-(BOOL)haveRightTableViewInColumn:(NSInteger)column{
    return NO;
}

-(CGFloat)widthRatioOfLeftColumn:(NSInteger)column{
    return 1;
}

-(NSInteger)currentLeftSelectedRow:(NSInteger)column{
    
    if (column==0) {
        
        return _currentData1Index;
    }
    if (column==1) {
        
        return _currentData2Index;
    }
    if (column==2) {
        
        return _currentData3Index;
    }
    return 0;
}

- (NSInteger)menu:(DropDownMenu *)menu numberOfRowsInColumn:(NSInteger)column leftOrRight:(NSInteger)leftOrRight leftRow:(NSInteger)leftRow{
    
    if (column==0){
        
        return _data1.count;
        
    } else if (column==1){

        return _data2.count;
        
    } else if (column==2){
        
        return _data3.count;
    }
    return 0;
}

- (NSString *)menu:(DropDownMenu *)menu titleForColumn:(NSInteger)column{
    
    switch (column) {
        case 0:
            return @"选择银行";
            break;
        case 1:
            return @"选择省份";
            break;
        case 2:
            return @"选择城市";
            break;
        default:
            return nil;
            break;
    }
}

- (NSString *)menu:(DropDownMenu *)menu titleForRowAtIndexPath:(DTIndexPath *)indexPath {
    
    if (indexPath.column==0) {
        
        return [_data1 objectAtIndex:indexPath.row];
    } else if (indexPath.column==1){
        
        return [_data2 objectAtIndex:indexPath.row];;

    }else{

        return [_data3 objectAtIndex:indexPath.row];
    }
}

- (void)menu:(DropDownMenu *)menu didSelectRowAtIndexPath:(DTIndexPath *)indexPath {
    
    if(indexPath.column == 0)
    {
        _currentData1Index = indexPath.row;
    } else if(indexPath.column == 1)
    {
        _currentData2Index = indexPath.row;
        
    }
    else
    {
        _currentData3Index = indexPath.row;
    }
}


#pragma mark - Setter/Getter
- (DropDownMenu *)menu{
    
    if (_menu == nil) {
        
        _menu = [[DropDownMenu alloc] initWithOrigin:CGPointMake(0, 64) andHeight:45];
        _menu.indicatorColor = [UIColor colorWithRed:175.0f/255.0f green:175.0f/255.0f blue:175.0f/255.0f alpha:1.0];
        _menu.separatorColor = [UIColor colorWithRed:210.0f/255.0f green:210.0f/255.0f blue:210.0f/255.0f alpha:1.0];
        _menu.textColor = [UIColor colorWithRed:83.f/255.0f green:83.f/255.0f blue:83.f/255.0f alpha:1.0f];
        _menu.dataSource = self;
        _menu.delegate = self;
    }
    return _menu;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
