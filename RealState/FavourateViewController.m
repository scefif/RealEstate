//
//  FavourateViewController.m
//  RealState
//
//  Created by Rahul kumar on 11/13/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "FavourateViewController.h"
#import "CustomCelln.h"
#import "AsyncImageView.h"

@interface FavourateViewController ()

@end

@implementation FavourateViewController

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
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
   // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Message" message:@"Currently You Don't Have Any Saved Data" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
   // [alert show];
    // Do any additional setup after loading the view from its nib.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    // dataTable.backgroundColor = [UIColor clearColor];
    CustomCell *cell = (CustomCell *)[dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell =(CustomCell *)[nib objectAtIndex:0];
        //    UITableViewCell *cell = [dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
        //    if (cell == nil) {
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        AsyncImageView *iconImgView=[[AsyncImageView alloc]init];
		[iconImgView setFrame:CGRectMake(05, 0, 50, 50)];
		[iconImgView setBackgroundColor:[UIColor clearColor]];
		[iconImgView setTag:20];
		[cell.contentView addSubview:iconImgView];
        
    }
    AsyncImageView *iconImgView=(AsyncImageView*)[cell.contentView viewWithTag:20];
    [iconImgView setWidth:50];
    cell.backgroundColor = [UIColor clearColor];
    if (indexPath.row == 0) {
        [cell.mainImg setImage:[UIImage imageNamed:@"image21.png"]];
        cell.labl1.text = @"3547";
        cell.labl2.text = @"49085 ROSE TER";
        cell.labl3.text = @"$325,999";
        cell.labl4.text = @"2 Bed/(2F,OH)Bath";
        cell.labl5.text = @"1119 sq.ft.Condo";
        cell.labl6.text = @"Active";
    }
    if (indexPath.row == 1) {
        [cell.mainImg setImage:[UIImage imageNamed:@"img3.png"]];
        cell.labl1.text = @"5675";
        cell.labl2.text = @"46888 FERNALD CMN";
        cell.labl3.text = @"$400,000";
        cell.labl4.text = @"3 Bed/(2F,OH)Bath";
        cell.labl5.text = @"1221 sq.ft.Condo";
        cell.labl6.text = @"Active New";
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 135;
}



- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
