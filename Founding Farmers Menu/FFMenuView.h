//
//  FFMenuView.h
//  Founding Farmers Menu
//
//  Created by Farhan Syed on 9/29/12.
//  Copyright (c) 2012 Farhan Syed. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FFFileManager;
@interface FFMenuView : UIViewController <UITableViewDataSource, UITableViewDelegate>


@property (strong, nonatomic) FFFileManager *manager;


//setting data source arrays
@property (strong, nonatomic) NSMutableArray *lagerMenuItems;
@property (strong, nonatomic) NSMutableArray *aleMenuItems;
@property (strong, nonatomic) NSMutableArray *ipaMenuItems;
@property (strong, nonatomic) NSMutableArray *seasonalMenuitems;
@property (strong, nonatomic) NSMutableArray *whiteMenuItems;
@property (strong, nonatomic) NSMutableArray *globalMenuItems;
@property (strong, nonatomic) NSMutableArray *localMenuItems;



//setting table view properties
@property(strong, nonatomic) IBOutlet UITableView *lagerTableView;
@property(strong, nonatomic) IBOutlet UITableView *aleTableView;
@property(strong, nonatomic) IBOutlet UITableView *ipaTableView;
@property(strong, nonatomic) IBOutlet UITableView *seasonalTableView;
@property(strong, nonatomic) IBOutlet UITableView *whiteTableView;
@property(strong, nonatomic) IBOutlet UITableView *globalTableView;
@property(strong, nonatomic) IBOutlet UITableView *localTableView;



//methods
-(void)createModels;
-(void)initalizeArrays;
-(void)releaseArrays;
-(void)reloadAllTableViews;



@end
