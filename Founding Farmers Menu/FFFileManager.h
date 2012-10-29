//
//  FFFileManager.h
//  Founding Farmers Menu
//
//  Created by Farhan Syed on 10/5/12.
//  Copyright (c) 2012 Farhan Syed. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FFMenuItem;
@interface FFFileManager : NSObject
@property (strong, nonatomic) NSMutableArray *arrayOfDictionarys;
@property (strong, nonatomic) NSString *documentsFilePath;
@property (strong, nonatomic) NSString *mainBundleFilePath;


-(NSMutableArray *)readFromFile;
-(void)writeToFile;
-(NSMutableDictionary *)createDictionaryFromObject:(FFMenuItem *)object;
-(void)insertDictionary:(NSMutableDictionary *)dict IntoIndex:(NSInteger *)index;

+(FFFileManager *)sharedInstance;

@end
