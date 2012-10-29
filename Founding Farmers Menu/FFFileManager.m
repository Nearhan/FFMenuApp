//
//  FFFileManager.m
//  Founding Farmers Menu
//
//  Created by Farhan Syed on 10/5/12.
//  Copyright (c) 2012 Farhan Syed. All rights reserved.
//

#import "FFFileManager.h"
#import "FFMenuItem.h"

@implementation FFFileManager
@synthesize arrayOfDictionarys;
@synthesize documentsFilePath;
@synthesize mainBundleFilePath;

static FFFileManager *sharedSingleton = NULL;


-(id)init
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSError *error;
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    self.documentsFilePath = [documentsDirectory stringByAppendingPathComponent:@"MenuItems.plist"];
    
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"MenuItems" ofType:@"plist"];
    self.mainBundleFilePath = plistPath;
    self.arrayOfDictionarys = [[NSMutableArray alloc] initWithContentsOfFile:self.mainBundleFilePath];
    
    if ([fileManager fileExistsAtPath:self.documentsFilePath] == NO) {
        [fileManager copyItemAtPath:self.mainBundleFilePath toPath:self.documentsFilePath error:&error];
    }
    
   
    
    
    return self;
}


-(NSMutableDictionary *)createDictionaryFromObject:(FFMenuItem *)object
{
    
    NSMutableDictionary *newDict = [[NSMutableDictionary alloc] initWithObjectsAndKeys:object.name, @"name",
                                    object.location, @"location", object.abv, @"abv", object.priceOf4oz,
                                    @"price of 4oz", object.priceOfGlass, @"price of glass", nil];
    
    //NSLog(@"when creating an object from dictioarny is called %@", newDict);
    return newDict;
    
    
}

-(void)writeToFile
{
    [self.arrayOfDictionarys writeToFile:self.documentsFilePath atomically:YES];
    //NSLog(@" when writing is called new array : %@", self.arrayOfDictionarys);
    
    
}

-(void)insertDictionary:(NSMutableDictionary *)dict IntoIndex:(NSInteger *)index
{
    [self.arrayOfDictionarys replaceObjectAtIndex:index withObject:dict];
    //NSLog(@" when insert into dict is called %@", self.arrayOfDictionarys);
    
}

//making a shared instance of this class to pass around
+(FFFileManager *)sharedInstance
{
    
    if(sharedSingleton == NULL) {
        sharedSingleton = [[self alloc] init];
    }
    
    return sharedSingleton;

}
@end
