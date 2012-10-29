//
//  FFMenuView.m
//  Founding Farmers Menu
//
//  Created by Farhan Syed on 9/29/12.
//  Copyright (c) 2012 Farhan Syed. All rights reserved.
//

#import "FFMenuView.h"
#import "FFMenuEdit.h"
#import "FFMenuItem.h"
#import "FFFileManager.h"
#import "FFCell.h"

@interface FFMenuView ()

@end

@implementation FFMenuView



//synthesize data arrays
@synthesize localMenuItems;
@synthesize aleMenuItems;
@synthesize ipaMenuItems;
@synthesize seasonalMenuitems;
@synthesize whiteMenuItems;
@synthesize lagerMenuItems;
@synthesize globalMenuItems;


//synthesise table views
@synthesize lagerTableView;
@synthesize aleTableView;
@synthesize ipaTableView;
@synthesize seasonalTableView;
@synthesize whiteTableView;
@synthesize localTableView;
@synthesize globalTableView;




- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    
    
    //initalize file manager 
    self.manager = [[FFFileManager alloc] init];
    
    //initalize all arrays here
    [self initalizeArrays];
    [self createModels];

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [self releaseArrays];
    

}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}


-(void)viewWillAppear:(BOOL)animated
{
    //going to hide the nav bar on load
    [self.navigationController setNavigationBarHidden:YES];
    [super viewWillAppear:animated];
    [self initalizeArrays];
    [self createModels];
    [self reloadAllTableViews];

}

//create models and shuffle models in proper order
-(void)createModels
{
    
    //gather file
    NSMutableArray *items = [[NSMutableArray alloc] initWithContentsOfFile:self.manager.documentsFilePath];
    //NSLog(@"array of dictioanrys being loaded in create models: %@", items);
  
 
    
    NSMutableArray *tempArray1 = [[NSMutableArray alloc] init];
    NSMutableArray *tempArray2 = [[NSMutableArray alloc] init];
    NSMutableArray *tempArray3 = [[NSMutableArray alloc] init];
    NSMutableArray *tempArray4 = [[NSMutableArray alloc] init];
    NSMutableArray *tempArray5 = [[NSMutableArray alloc] init];
    NSMutableArray *tempArray6 = [[NSMutableArray alloc] init];
    NSMutableArray *tempArray7 = [[NSMutableArray alloc] init];
    
    
    //create and populate inital arrays
    for (int x = 0; x < [items count]; x++) {

        
        FFMenuItem *item = [[FFMenuItem alloc] initWithDicionary:[items objectAtIndex:x] identiferForObject:x];
        
        if (x <= 3) {
            
            if (item.name.length > 0) {
                
                [self.lagerMenuItems addObject:item];
            }
            else {
                
                [tempArray1 addObject:item];
                
            }
            
        }
        
        
        else if (x > 3 && x <= 7) {
                       
            if (item.name.length > 0) {
                
                [self.aleMenuItems addObject:item];
            }
            else {
                
                [tempArray2 addObject:item];
                
            }
            
        }
        
        else if (x > 7 && x <= 11) {
    
            if (item.name.length > 0) {
                
                [self.ipaMenuItems addObject:item];
            }
            else {
                
                [tempArray3 addObject:item];
                
            }
            
            
        }
        
        else if (x > 11 && x <= 15) {
            
            if (item.name.length > 0) {
                
                [self.seasonalMenuitems addObject:item];
            }
            else {
                
                [tempArray4 addObject:item];
                
            }
            
            
        }
        
         else if (x > 15 && x <= 19) {
             
            if (item.name.length > 0) {
                 
                 [self.whiteMenuItems addObject:item];
            }
            else {
                 
                 [tempArray5 addObject:item];
                 
            }

            
        }
        
        else if (x > 19 && x <= 23) {
            
            if (item.name.length > 0) {
                
                [self.globalMenuItems addObject:item];
            }
            else {
                
                [tempArray6 addObject:item];
                
            }
    
            
        }
        
        else if (x > 23 && x <= 27) {
            
            if (item.name.length > 0) {
                
                [self.localMenuItems addObject:item];
            }
            else {
                
                [tempArray7 addObject:item];
                
            }
            
        }
    }
    


    [self.lagerMenuItems addObjectsFromArray:tempArray1];
    [self.aleMenuItems addObjectsFromArray:tempArray2];
    [self.ipaMenuItems addObjectsFromArray:tempArray3];
    [self.seasonalMenuitems addObjectsFromArray:tempArray4];
    [self.whiteMenuItems addObjectsFromArray:tempArray5];
    [self.globalMenuItems addObjectsFromArray:tempArray6];
    [self.localMenuItems addObjectsFromArray:tempArray7];
    

    
    //consle log out
    //NSLog(@" lager array : %@, ale array : %@, ipa array: %@, seasonal array : %@, white array: %@, global array : %@, local array: %@", self.lagerMenuItems, self.aleMenuItems, self.ipaMenuItems, self.seasonalMenuitems, self.whiteMenuItems, self.globalMenuItems, self.localMenuItems);
    
}

-(void)initalizeArrays
{
    
    self.lagerMenuItems = [[NSMutableArray alloc] init];
    self.aleMenuItems = [[NSMutableArray alloc] init];
    self.ipaMenuItems = [[NSMutableArray alloc] init];
    self.seasonalMenuitems = [[NSMutableArray alloc] init];
    self.whiteMenuItems = [[NSMutableArray alloc] init];
    self.globalMenuItems = [[NSMutableArray alloc] init];
    self.localMenuItems = [[NSMutableArray alloc] init];
    
}

-(void)releaseArrays
{
    self.lagerMenuItems = nil;
    self.aleMenuItems = nil;
    self.ipaMenuItems = nil;
    self.seasonalMenuitems = nil;
    self.whiteMenuItems = nil;
    self.globalMenuItems = nil;
    self.localMenuItems = nil;
    
}

-(void)reloadAllTableViews
{
    
    [self.lagerTableView reloadData];
    [self.aleTableView reloadData];
    [self.ipaTableView reloadData];
    [self.seasonalTableView reloadData];
    [self.whiteTableView reloadData];
    [self.globalTableView reloadData];
    [self.localTableView reloadData];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    
    [self releaseArrays];
    
}
#pragma mark -
#pragma mark - Table View Data Source Methods

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    //check to see tags of table view
    NSInteger tag = tableView.tag;
    
    
    
    //swtich case to determin what data is loaded for what table view
    switch (tag) {
        case 1:
            return [self.lagerMenuItems count];
            
        case 2:
            return [self.aleMenuItems count];
            
        case 3:
            return [self.ipaMenuItems count];
            
        case 4:
            return [self.seasonalMenuitems count];
            
        case 5:
            return [self.whiteMenuItems count];
            
        case 6:
            return [self.globalMenuItems count];
            
        case 7:
            return [self.localMenuItems count];
    }
    
    
    
}

//drawing the cells
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    tableView.backgroundColor = [UIColor clearColor];
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    
    
    FFCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    
   // UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
   //                          SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[FFCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:SimpleTableIdentifier];
        
        
        
        
        
        //creating a CG frame for both UILabels
        /*
        CGRect frame;
        frame.origin.x = 10;
        frame.origin.y = 5;
        frame.size.width = 300;
        frame.size.height = 50;
        
        UILabel *nameLocationAbvLabel = [[UILabel alloc] initWithFrame:frame];
        nameLocationAbvLabel.tag = 1;
        nameLocationAbvLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:nameLocationAbvLabel];
        
        //add seconding label
        frame.origin.x = 290;
        UILabel *priceLabel = [[UILabel alloc] initWithFrame:frame];
        priceLabel.tag = 2;
        priceLabel.backgroundColor = [UIColor clearColor];
        [cell.contentView addSubview:priceLabel];
         */
    }
    
    
    
    //create UILabels that will be used in the cell
    NSUInteger row = [indexPath row];
    
    UILabel *nameLocationAbvLabel = (UILabel *) [cell.contentView viewWithTag:1];
    UILabel *priceLabel = (UILabel *) [cell.contentView viewWithTag:2];
    
    
    //swtiche case for data source
    NSInteger tag = tableView.tag;
    
    
    
    //FFMenuItem *newItem = [self.lagerMenuItems objectAtIndex:row];
    
    switch (tag) {
        case 1:
        {
            FFMenuItem *currentItem = [self.lagerMenuItems objectAtIndex:row];
            nameLocationAbvLabel.text = currentItem.nameLocatioAbvString;
            priceLabel.text = currentItem.priceString;
            /*
            nameLocationAbvLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
            nameLocationAbvLabel.textColor = [UIColor whiteColor];
            priceLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
            priceLabel.textColor = [UIColor whiteColor];
             */
            
            break;
        }
        case 2:
        {
            FFMenuItem *currentItem = [self.aleMenuItems objectAtIndex:row];
            nameLocationAbvLabel.text = currentItem.nameLocatioAbvString;
            priceLabel.text = currentItem.priceString;
            /*
             nameLocationAbvLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
             nameLocationAbvLabel.textColor = [UIColor whiteColor];
             priceLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
             priceLabel.textColor = [UIColor whiteColor];
             */
            break;
        }
        case 3:
        {
            FFMenuItem *currentItem = [self.ipaMenuItems objectAtIndex:row];
            nameLocationAbvLabel.text = currentItem.nameLocatioAbvString;
            priceLabel.text = currentItem.priceString;
            /*
             nameLocationAbvLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
             nameLocationAbvLabel.textColor = [UIColor whiteColor];
             priceLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
             priceLabel.textColor = [UIColor whiteColor];
             */
            break;
        }
        case 4:
        {
            FFMenuItem *currentItem = [self.seasonalMenuitems objectAtIndex:row];
            nameLocationAbvLabel.text = currentItem.nameLocatioAbvString;
            priceLabel.text = currentItem.priceString;
            /*
             nameLocationAbvLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
             nameLocationAbvLabel.textColor = [UIColor whiteColor];
             priceLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
             priceLabel.textColor = [UIColor whiteColor];
             */
            break;
        }
        case 5:
        {
            FFMenuItem *currentItem = [self.whiteMenuItems objectAtIndex:row];
            nameLocationAbvLabel.text = currentItem.nameLocatioAbvString;
            priceLabel.text = currentItem.priceString;
            /*
             nameLocationAbvLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
             nameLocationAbvLabel.textColor = [UIColor whiteColor];
             priceLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
             priceLabel.textColor = [UIColor whiteColor];
             */
            break;
        }
            
        case 6:
        {
            FFMenuItem *currentItem = [self.globalMenuItems objectAtIndex:row];
            nameLocationAbvLabel.text = currentItem.nameLocatioAbvString;
            priceLabel.text = currentItem.priceString;
            /*
             nameLocationAbvLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
             nameLocationAbvLabel.textColor = [UIColor whiteColor];
             priceLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
             priceLabel.textColor = [UIColor whiteColor];
             */
            break;
        }
        case 7:
        {
            FFMenuItem *currentItem = [self.localMenuItems objectAtIndex:row];
            nameLocationAbvLabel.text = currentItem.nameLocatioAbvString;
            priceLabel.text = currentItem.priceString;
            /*
             nameLocationAbvLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
             nameLocationAbvLabel.textColor = [UIColor whiteColor];
             priceLabel.font = [UIFont fontWithName:@"Karla-Bold" size:15];
             priceLabel.textColor = [UIColor whiteColor];
             */
            break;
        }
    }
    
    /*cell.textLabel.font = [UIFont boldSystemFontOfSize:15];
    cell.textLabel.textColor = [UIColor redColor];
    cell.backgroundColor = [UIColor clearColor];
    */
     
    return cell;
    
    
    
}

#pragma mark -
#pragma mark - Table View Delegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSInteger tag = tableView.tag;
    NSUInteger row = [indexPath row];
    FFMenuEdit *menuEditView = [[FFMenuEdit alloc] initWithNibName:@"FFMenuEdit" bundle:nil];
    
    
    //swtich case to determin what data is loaded for what table view
    switch (tag) {
        case 1:
            menuEditView.data = [self.lagerMenuItems objectAtIndex:row];
            break;
            
        case 2:
            menuEditView.data = [self.aleMenuItems objectAtIndex:row];
            break;
            
        case 3:
            menuEditView.data = [self.ipaMenuItems objectAtIndex:row];
            break;
            
        case 4:
            menuEditView.data = [self.seasonalMenuitems objectAtIndex:row];
            break;
            
        case 5:
            menuEditView.data = [self.whiteMenuItems objectAtIndex:row];
            break;
            
        case 6:
            menuEditView.data = [self.globalMenuItems objectAtIndex:row];
            break;
            
        case 7:
            menuEditView.data = [self.localMenuItems objectAtIndex:row];
            break;
    }
    

    
    //shoot to edit view
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.navigationController pushViewController:menuEditView animated:YES];
    
    
    
}


@end
