//
//  TableFooterViewController.m
//  RealState
//
//  Created by Rahul kumar on 11/19/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "TableFooterViewController.h"

@interface TableFooterViewController ()

@end

@implementation TableFooterViewController

@synthesize activityIndicator;
@synthesize infoLabel,infoLabel2;


- (void) awakeFromNib
{
    self.backgroundColor = [UIColor clearColor];
    [super awakeFromNib];
}


//- (void) dealloc
//{
//    [activityIndicator release];
//    [infoLabel release];
//    [super dealloc];
//}

@end