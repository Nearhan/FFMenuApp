//
//  FFCell.m
//  Founding Farmers Menu
//
//  Created by Farhan Syed on 10/8/12.
//  Copyright (c) 2012 Farhan Syed. All rights reserved.
//

#import "FFCell.h"

@implementation FFCell
@synthesize pricesLabel;
@synthesize nameLocationAbvLabel;



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        self.font = [UIFont fontWithName:@"Karla-Bold" size:15];
        self.textColor = [UIColor whiteColor];
        
        //create fonts
        [self initalizeNameLocationAbvLabel];
        [self initalizePriceLabel];
        self.backgroundColor = [UIColor clearColor];

        
    }

    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)initalizeNameLocationAbvLabel

{
    
    CGRect frame;
    frame.origin.x = 10;
    frame.origin.y = 5;
    frame.size.width = 300;
    frame.size.height = 50;
    self.nameLocationAbvLabel = [[UILabel alloc] initWithFrame:frame];
    self.nameLocationAbvLabel.tag = 1;
    self.nameLocationAbvLabel.backgroundColor = [UIColor clearColor];
    self.nameLocationAbvLabel.font = self.font;
    self.nameLocationAbvLabel.textColor = self.textColor;
    [self.contentView addSubview:self.nameLocationAbvLabel];
    
    
}


-(void)initalizePriceLabel

{
    CGRect frame;
    frame.origin.x = 290;
    frame.origin.y = 5;
    frame.size.width = 300;
    frame.size.height = 50;
    self.pricesLabel = [[UILabel alloc] initWithFrame:frame];
    self.pricesLabel.tag = 2;
    self.pricesLabel.backgroundColor = [UIColor clearColor];
    self.pricesLabel.font = self.font;
    self.pricesLabel.textColor = self.textColor;
    [self.contentView addSubview:self.pricesLabel];
    
    
}

@end
