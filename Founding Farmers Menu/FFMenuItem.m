//
//  FFMenuItem.m
//  Founding Farmers Menu
//
//  Created by Farhan Syed on 9/29/12.
//  Copyright (c) 2012 Farhan Syed. All rights reserved.
//

#import "FFMenuItem.h"

@implementation FFMenuItem

@synthesize name;
@synthesize location;
@synthesize abv;
@synthesize priceOf4oz;
@synthesize priceOfGlass;
@synthesize identifer;
@synthesize nameLocatioAbvString;
@synthesize priceString;


-(id)initWithDicionary:(NSDictionary *)dict identiferForObject:(NSInteger)index
{
    if (self = [super init])
    {
        self.name = [dict objectForKey:@"name"];
        self.location = [dict objectForKey:@"location"];
        self.abv = [dict objectForKey:@"abv"];
        self.priceOf4oz = [dict objectForKey:@"price of 4oz"];
        self.priceOfGlass = [dict objectForKey:@"price of glass"];
        self.identifer = index;
        
        
        //set strings that the model will create
        
        if (self.name.length > 0) {
            
            self.nameLocatioAbvString = [[NSString alloc] initWithFormat:@"%@  |  %@  |  %@%%", self.name, self.location, self.abv];
        
            self.priceString = [[NSString alloc] initWithFormat:@"%@  |  %@", self.priceOf4oz, self.priceOfGlass];
        }
        else {
            
            self.nameLocatioAbvString = @"";
            self.priceString = @"";
            
        }
        
        
    }
        
    return  self;
}

@end
