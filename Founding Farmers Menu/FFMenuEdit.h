//
//  FFMenuEdit.h
//  Founding Farmers Menu
//
//  Created by Farhan Syed on 9/29/12.
//  Copyright (c) 2012 Farhan Syed. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FFFileManager;
@class FFMenuItem;
@interface FFMenuEdit : UIViewController <UIAlertViewDelegate, UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *locationTextField;
@property (strong, nonatomic) IBOutlet UITextField *abvTextField;
@property (strong, nonatomic) IBOutlet UITextField *priceOf4OzTextField;
@property (strong, nonatomic) IBOutlet UITextField *priceOfGlassTextField;


@property (strong, nonatomic) FFMenuItem *data;
@property (strong, nonatomic) FFFileManager *manager;

-(IBAction)clearAllButtonPressed:(id)sender;
-(void)clearAllPressed;
-(IBAction)saveButtonPressed:(id)sender;


@end
