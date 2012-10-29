//
//  FFCell.h
//  Founding Farmers Menu
//
//  Created by Farhan Syed on 10/8/12.
//  Copyright (c) 2012 Farhan Syed. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FFCell : UITableViewCell

@property(strong, nonatomic) UILabel *nameLocationAbvLabel;
@property(strong, nonatomic) UILabel *pricesLabel;
@property(strong, nonatomic) UIFont *font;
@property(strong, nonatomic) UIColor *textColor;

-(void)initalizeNameLocationAbvLabel;
-(void)initalizePriceLabel;
@end
