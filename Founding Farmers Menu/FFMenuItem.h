//
//  FFMenuItem.h
//  Founding Farmers Menu
//
//  Created by Farhan Syed on 9/29/12.
//  Copyright (c) 2012 Farhan Syed. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface FFMenuItem : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *location;
@property (strong, nonatomic) NSString *abv;
@property (strong, nonatomic) NSString *priceOf4oz;
@property (strong, nonatomic) NSString *priceOfGlass;
@property (nonatomic) NSInteger identifer;

@property (strong, nonatomic) NSString *nameLocatioAbvString;
@property (strong, nonatomic) NSString *priceString;



-(id)initWithDicionary:(NSDictionary *)dict identiferForObject:(NSInteger)index;
@end
