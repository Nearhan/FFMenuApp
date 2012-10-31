//
//  FFMenuEdit.m
//  Founding Farmers Menu
//
//  Created by Farhan Syed on 9/29/12.
//  Copyright (c) 2012 Farhan Syed. All rights reserved.
//

#import "FFMenuEdit.h"
#import "FFMenuItem.h"
#import "FFFileManager.h"

@interface FFMenuEdit ()

@end


@implementation FFMenuEdit

@synthesize nameTextField;
@synthesize locationTextField;
@synthesize abvTextField;
@synthesize priceOf4OzTextField;
@synthesize priceOfGlassTextField;
@synthesize data;
@synthesize manager;



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        //[self.abvTextField setKeyboardType:UIKeyboardTypeNumberPad];
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:NO];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithTitle:@"Clear All"
                                                            style:UIBarButtonSystemItemDone
                                                            target:self
                                                            action:@selector(clearAllPressed)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    
    
    //self.navigationController.navigationBar.backItem.title = @"Cancel";
    
    self.manager =[FFFileManager sharedInstance];
    NSLog(@"This is being loaded");
    NSLog(@"Current Model loaded is %@, the name is %@", self.data, self.data.name);
    
    self.nameTextField.text = self.data.name;
    self.locationTextField.text = self.data.location;
    self.abvTextField.text = self.data.abv;
    self.priceOf4OzTextField.text = self.data.priceOf4oz;
    self.priceOfGlassTextField.text = self.data.priceOfGlass;
    
    
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.data = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

-(IBAction)clearAllButtonPressed:(id)sender
{
    
    self.nameTextField.text = @"";
    self.locationTextField.text = @"";
    self.abvTextField.text = @"";
    self.priceOf4OzTextField.text = @"";
    self.priceOfGlassTextField.text = @"";
    [self.view setNeedsDisplay];
    
    
}

-(void)clearAllPressed
{
    self.nameTextField.text = @"";
    self.locationTextField.text = @"";
    self.abvTextField.text = @"";
    self.priceOf4OzTextField.text = @"";
    self.priceOfGlassTextField.text = @"";
    [self.view setNeedsDisplay];
    
    
}

-(IBAction)saveButtonPressed:(id)sender
{

    
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Save This Menu Item?" message:@"" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Save", nil];
    [alert show];
    
    /*
    self.data.name = self.nameTextField.text;
    self.data.location = self.locationTextField.text;
    self.data.abv = self.abvTextField.text;
    self.data.priceOf4oz = self.priceOf4OzTextField.text;
    self.data.priceOfGlass = self.priceOfGlassTextField.text;
    
    NSMutableDictionary *tempDict = [self.manager createDictionaryFromObject:self.data];
    [self.manager insertDictionary:tempDict IntoIndex:self.data.identifer];
    [self.manager writeToFile];
     */
    
    
    
}

#pragma mark -
#pragma mark - UIAlertView Delegate Methods

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if ([title isEqualToString:@"Save"]) {
    
        NSLog(@"This man is SURE!");
        self.data.name = self.nameTextField.text;
        self.data.location = self.locationTextField.text;
        self.data.abv = self.abvTextField.text;
        self.data.priceOf4oz = self.priceOf4OzTextField.text;
        self.data.priceOfGlass = self.priceOfGlassTextField.text;
        
        NSMutableDictionary *tempDict = [self.manager createDictionaryFromObject:self.data];
        [self.manager insertDictionary:tempDict IntoIndex:self.data.identifer];
        [self.manager writeToFile];
       
        [self.navigationController popViewControllerAnimated:YES];
        
    
    }
    
    
}

#pragma  mark -
#pragma mark - UITextField Delegate Methods

-(BOOL)textFieldShouldReturn:(UITextField *)textField

{
    //handles which to respond with
    int tag = textField.tag;
    if (tag  == 5) {
        
        [textField resignFirstResponder];

    }
    else {
        
        [textField resignFirstResponder];
        tag++;
        UITextField *newTextField = (UITextField*)[self.view viewWithTag:tag];
        [newTextField becomeFirstResponder];
        
    }
        
    return YES;
    
    
}




 
@end
