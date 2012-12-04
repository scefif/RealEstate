//
//  listViewController.m
//  JordanRealState
//
//  Created by Rahul kumar on 11/23/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "listViewController.h"
#import "TableFooterViewController.h"
#import "CustomCell.h"
#import "AsyncImageView.h"
#import "listDetailViewController.h"

@interface listViewController ()
- (void) addItemsOnBottom;
- (NSString *) createRandomValue;
@end

@implementation listViewController

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
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];   // self.
    
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableFooterViewController" owner:self options:nil];
    TableFooterViewController *footerView = (TableFooterViewController *)[nib objectAtIndex:0];
    self.footerView = footerView;
    // dataTable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"woodenBackground.png"]];
    
    //logtable.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background-320-270.png"]];
    //  dataTable.borderStyle = UITextBorderStyleNone;
    
    // Do any additional setup after loading the view from its nib.
    items = [[NSMutableArray alloc] init];
    for (int i = 0; i < 3; i++)
        [items addObject:[self createRandomValue]];
}


- (NSString *) createRandomValue{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    
    return [NSString stringWithFormat:@"test %@ %@", [dateFormatter stringFromDate:[NSDate date]],
            [NSNumber numberWithInt:rand()]];
    
}


- (void) addItemsOnBottom
{
    for (int i = 0; i < 5; i++)
        [items addObject:[self createRandomValue]];
    [self.tableView reloadData];
    
    if (items.count > 50)
        self.canLoadMore = NO; // signal that there won't be any more items to load
    else
        self.canLoadMore = YES;
    // Inform STableViewController that we have finished loading more items
    [self loadMoreCompleted];
}


- (BOOL) loadMore
{
    if (![super loadMore])
        return NO;
    // Do your async loading here
    [self performSelector:@selector(addItemsOnBottom) withObject:nil afterDelay:2.0];
    // See -addItemsOnBottom for more info on what to do after loading more items
    return YES;
}

- (void) willBeginLoadingMore
{
    TableFooterViewController *fv = (TableFooterViewController *)self.footerView;
    [fv.activityIndicator startAnimating];
    fv.infoLabel2.hidden = NO;
}


- (void) loadMoreCompleted
{
    [super loadMoreCompleted];
    
    TableFooterViewController *fv = (TableFooterViewController *)self.footerView;
    [fv.activityIndicator stopAnimating];
    
    if (!self.canLoadMore) {
        // Do something if there are no more items to load
        // We can hide the footerView by: [self setFooterViewVisibility:NO];
        // Just show a textual info that there are no more items to load
        fv.infoLabel.hidden = NO;
        fv.infoLabel2.hidden = YES;
    }
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return items.count;
    
}

//- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    static NSString *CellIdentifier = @"Cell";
//
//    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//    if (cell == nil) {
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                      reuseIdentifier:CellIdentifier];
//    }
//
//    cell.textLabel.text = [items objectAtIndex:indexPath.row];
//    return cell;
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"Cell";
    // dataTable.backgroundColor = [UIColor clearColor];
    CustomCell *cell = (CustomCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell" owner:self options:nil];
        cell =(CustomCell *)[nib objectAtIndex:0];
        //    UITableViewCell *cell = [dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
        //    if (cell == nil) {
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
       // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        AsyncImageView *iconImgView=[[AsyncImageView alloc]init];
        [iconImgView setFrame:CGRectMake(05, 0, 50, 50)];
        [iconImgView setBackgroundColor:[UIColor clearColor]];
        [iconImgView setTag:20];
        [cell.contentView addSubview:iconImgView];
        
    }
    AsyncImageView *iconImgView=(AsyncImageView*)[cell.contentView viewWithTag:20];
    [iconImgView setWidth:50];
    cell.backgroundColor = [UIColor clearColor];
    //NSLog(@"Image is %@",[[array objectAtIndex:indexPath.row] objectForKey:@"id"]);
    // [iconImgView loadImageFromURL:[NSURL URLWithString: [[array objectAtIndex:indexPath.row] valueForKey:@"category_image"]]];
    if (indexPath.row == 0) {
        [cell.mainImg setImage:[UIImage imageNamed:@"image21.png"]];
        //cell.labl1.text = @"3547";
        cell.labl2.text = @"49085 ROSE TER";
        cell.labl3.text = @"$325,999";
        cell.labl4.text = @"House";
        cell.labl5.text = @"Renovated family home on expanisve 954sqm block";
        //cell.labl6.text = @"Active";
    }
    if (indexPath.row == 1) {
        [cell.mainImg setImage:[UIImage imageNamed:@"img3.png"]];
        //cell.labl1.text = @"5675";
        cell.labl2.text = @"46888 FERNALD CMN";
        cell.labl3.text = @"$400,000";
        cell.labl4.text = @"House";
        cell.labl5.text = @"Renovated family home on expanisve 954sqm block";
        //cell.labl6.text = @"Active New";
    }
    if (indexPath.row == 2) {
        [cell.mainImg setImage:[UIImage imageNamed:@"img4.png"]];
        //cell.labl1.text = @"6754";
        cell.labl2.text = @"49002 CINNAMON FERN";
        cell.labl3.text = @"$449,000";
        cell.labl4.text = @"Apartment";
        cell.labl5.text = @"Modern apartment of generous propotions";
        //cell.labl6.text = @"Active";
    }
    if (indexPath.row == 3) {
        [cell.mainImg setImage:[UIImage imageNamed:@"img5.png"]];
        //cell.labl1.text = @"3487";
        cell.labl2.text = @"2539 WASHINGTON";
        cell.labl3.text = @"$710,000";
        cell.labl4.text = @"House";
        cell.labl5.text = @"Renovated family home on expanisve 954sqm block";
        //cell.labl6.text = @"";
    }
    if (indexPath.row == 4) {
        [cell.mainImg setImage:[UIImage imageNamed:@"img6.png"]];
        //cell.labl1.text = @"9867";
        cell.labl2.text = @"45088 Mardis st";
        cell.labl3.text = @"$650,000";
        cell.labl4.text = @"House";
        cell.labl5.text = @"Renovated family home on expanisve 954sqm block";
       // cell.labl6.text = @"Active New";
    }
    if (indexPath.row == 5) {
        [cell.mainImg setImage:[UIImage imageNamed:@"img7.png"]];
        //cell.labl1.text = @"7655";
        cell.labl2.text = @"130 RACOON CT";
        cell.labl3.text = @"$799,000";
        cell.labl4.text = @"Apartment";
        cell.labl5.text = @"Modern apartment of generous propotions";
       // cell.labl6.text = @"Active";
    }
    if (indexPath.row == 6) {
        [cell.mainImg setImage:[UIImage imageNamed:@"img8.png"]];
        //cell.labl1.text = @"5544";
        cell.labl2.text = @"15 JAPALA CT";
        cell.labl3.text = @"$810,00";
        cell.labl4.text = @"Apartment";
        cell.labl5.text = @"Modern apartment of generous propotions";
       // cell.labl6.text = @"Active Active";
    }
    // cell.textLabel.text = [items objectAtIndex:indexPath.row];
    
    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
   // [tableView setsel];
     listDetailViewController *srch = [[listDetailViewController alloc]initWithNibName:@"listDetailViewController" bundle:nil];
     [self.navigationController pushViewController:srch animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 170;
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
