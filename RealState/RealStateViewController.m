//
//  RealStateViewController.m
//  RealState
//
//  Created by Rahul kumar on 11/13/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "RealStateViewController.h"
#import "LogInViewController.h"
#import "SearchViewController.h"
#import "FavourateViewController.h"
#import "NearMeViewController.h"
#import "SavedSearchesViewController.h"
#import "FeaturedViewController.h"
#import "listViewController.h"

@interface RealStateViewController ()

@end

@implementation RealStateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:YES];
}


-(IBAction)loginView:(id)sender{
    LogInViewController *log = [[LogInViewController alloc] initWithNibName:@"LogInViewController" bundle:nil];
    [self.navigationController pushViewController:log animated:YES];
}

-(IBAction)featuredView:(id)sender{
    FeaturedViewController *log = [[FeaturedViewController alloc] initWithNibName:@"FeaturedViewController" bundle:nil];
    [self.navigationController pushViewController:log animated:YES];

    
}
-(IBAction)searchView:(id)sender{
    listViewController *srch = [[listViewController alloc]init];//WithNibName:@"SearchViewController" bundle:nil];
    [self.navigationController pushViewController:srch animated:YES];
}
-(IBAction)nearmeView:(id)sender{
    NearMeViewController *near =  [[NearMeViewController alloc] initWithNibName:@"NearMeViewController" bundle:nil];
    [self.navigationController pushViewController:near animated:YES];
    
}
-(IBAction)favouriteView:(id)sender{
    FavourateViewController *fav = [[FavourateViewController alloc] initWithNibName:@"FavourateViewController" bundle:nil];
    [self.navigationController pushViewController:fav animated:YES];
}
-(IBAction)savedSrchView:(id)sender{
    SavedSearchesViewController *log = [[SavedSearchesViewController alloc] initWithNibName:@"SavedSearchesViewController" bundle:nil];
    [self.navigationController pushViewController:log animated:YES];

    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
//{
//    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
//}

@end
