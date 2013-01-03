//
//  listViewController.m
//  JordanRealState
//
//  Created by Rahul kumar on 11/23/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "listViewController.h"
#import "TableFooterViewController.h"
#import "TableHeaderViewController.h"
#import "CustomCell2.h"
#import "AsyncImageView.h"
#import "SearchDetailViewController.h"
//#import "listDetailViewController.h"
#import "Connection.h"

@interface listViewController ()
- (void) addItemsOnTop;
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
    activity = [[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(130, 235, 50, 50)];
    activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhiteLarge;
     activity.alpha = 1;
    [activity startAnimating];
    [self.view addSubview:activity];
    loadMoreBool = FALSE;
    refreshBool1 = FALSE;
    firstLoadbool = TRUE;
    // NSString *url = @"http://ratiogold.com/webservice/get_category.php";
    NSString *url = @"http://10.10.5.30/property/Property-json.Json";
    //NSString *url = @"http://59.144.5.168/property/Property-json.Json";
    Connection *connection = [[Connection alloc] init];
	[connection setDelegate:self];
	[connection getMethod:url ];
    NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TableHeaderViewController" owner:self options:nil];
    TableHeaderViewController *headerView = (TableHeaderViewController *)[nib objectAtIndex:0];
    self.headerView = headerView;
   
    nib = [[NSBundle mainBundle] loadNibNamed:@"TableFooterViewController" owner:self options:nil];
    TableFooterViewController *footerView = (TableFooterViewController *)[nib objectAtIndex:0];
    self.footerView = footerView;
    // dataTable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"woodenBackground.png"]];
    
    //logtable.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background-320-270.png"]];
    //  dataTable.borderStyle = UITextBorderStyleNone;
    
    // Do any additional setup after loading the view from its nib.
    items = [[NSMutableArray alloc] init];
//    for (int i = 0; i < 3; i++)
//        [items addObject:[self createRandomValue]];
}
-(void)viewWillAppear:(BOOL)animated{
    
}



-(void)getResult:(id)_result{
    ResultArray = [[NSMutableArray alloc] init];
        [activity stopAnimating];
         activity.alpha = 0;
     NSLog(@"this is array %@",_result);
    ResultArray = [_result copy];
    if (loadMoreBool) {
          [self performSelector:@selector(addItemsOnBottom) withObject:nil afterDelay:2.0];
    }
    if (refreshBool1) {
        refreshBool1 = FALSE;
        [self performSelector:@selector(addItemsOnTop) withObject:nil afterDelay:2.0];
    }
    if (firstLoadbool) {
     for (int i = 0; i < [ResultArray count]; i++)
        //items = [ResultArray copy];
    [items addObject:[ResultArray objectAtIndex:i]];
    [self.tableView reloadData];
     NSLog(@"this is array %@",items);
    
    }
}



- (void) pinHeaderView
{
    [super pinHeaderView];
    
    // do custom handling for the header view
    TableHeaderViewController *hv = (TableHeaderViewController *)self.headerView;
    hv.activityIndicator.alpha = 1;
    [hv.activityIndicator startAnimating];
    hv.title.text = @"Refreshing...";
}

 
- (void) unpinHeaderView
{
    [super unpinHeaderView];
    
    // do custom handling for the header view
    [[(TableHeaderViewController *)self.headerView activityIndicator] stopAnimating];
}

 
// Update the header text while the user is dragging
//
- (void) headerViewDidScroll:(BOOL)willRefreshOnRelease scrollView:(UIScrollView *)scrollView
{
    TableHeaderViewController *hv = (TableHeaderViewController *)self.headerView;
    hv.activityIndicator.alpha = 0;
    if (willRefreshOnRelease)
        hv.title.text = @"Release to refresh...";
    else
        hv.title.text = @"Pull down to refresh...";
}

////////////////////////////////////////////////////////////////////////////////////////////////////
//
// refresh the list. Do your async calls here.
//
- (BOOL) refresh
{
    
    if (![super refresh])
        return NO;
       // Do your async call here
    // This is just a dummy data loader:
    refreshBool1 = TRUE;
    loadMoreBool = FALSE;
    firstLoadbool = FALSE;
   // refreshBool = YES;
    NSString *url = @"http://10.10.5.30/property/Property-json.Json";
   // NSString *url = @"http://59.144.5.168/property/Property-json.Json";
    Connection *connection = [[Connection alloc] init];
	[connection setDelegate:self];
	[connection getMethod:url ];
    //[self performSelector:@selector(addItemsOnTop) withObject:nil afterDelay:2.0];
    // See -addItemsOnTop for more info on how to finish loading
    return YES;
}

- (void) addItemsOnTop
{
    //items = [ResultArray copy];
    [items removeAllObjects];
    for (int i = 0; i < [ResultArray count]; i++)
         [items addObject:[ResultArray objectAtIndex:i]];
        //[items insertObject:[self createRandomValue] atIndex:0];
    [self.tableView reloadData];
    
    // Call this to indicate that we have finished "refreshing".
    // This will then result in the headerView being unpinned (-unpinHeaderView will be called).
    [self refreshCompleted];
}


 


- (NSString *) createRandomValue{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterMediumStyle];
    
    return [NSString stringWithFormat:@"test %@ %@", [dateFormatter stringFromDate:[NSDate date]],
            [NSNumber numberWithInt:rand()]];
    
}


- (void) addItemsOnBottom
{
    for (int i = 0; i < 10; i++)
        [items addObject:[ResultArray objectAtIndex:i]];
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
    refreshBool1 = FALSE;
    loadMoreBool = TRUE;
    firstLoadbool = FALSE;
    // refreshBool = YES;
    NSString *url = @"http://10.10.5.30/property/Property-json.Json";
    // NSString *url = @"http://59.144.5.168/property/Property-json.Json";
    Connection *connection = [[Connection alloc] init];
	[connection setDelegate:self];
	[connection getMethod:url ];
    // Do your async loading here
//    [self performSelector:@selector(addItemsOnBottom) withObject:nil afterDelay:2.0];
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
    CustomCell2 *cell = (CustomCell2 *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        NSArray* nib = [[NSBundle mainBundle] loadNibNamed:@"CustomCell2" owner:self options:nil];
        cell =(CustomCell2 *)[nib objectAtIndex:0];
        //    UITableViewCell *cell = [dataTable dequeueReusableCellWithIdentifier:CellIdentifier];
        //    if (cell == nil) {
        // cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
       // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        AsyncImageView *iconImgView=[[AsyncImageView alloc]init];
        [iconImgView setFrame:CGRectMake(05, 35, 122, 92)];
        [iconImgView setBackgroundColor:[UIColor clearColor]];
        [iconImgView setTag:20];
        [cell.contentView addSubview:iconImgView];
        
    }
    AsyncImageView *iconImgView=(AsyncImageView*)[cell.contentView viewWithTag:20];
    //[iconImgView setWidth:50];
    cell.backgroundColor = [UIColor clearColor];
    @try {
         
      //NSLog(@"Image is %@",[[array objectAtIndex:indexPath.row] objectForKey:@"id"]);
     [iconImgView loadImageFromURL:[NSURL URLWithString: [[items objectAtIndex:indexPath.row] valueForKey:@"ThumbnailPhoto"]]];
//    if (indexPath.row == 0) {
//        [cell.mainImg setImage:[UIImage imageNamed:@"image21.png"]];
//        //cell.labl1.text = @"3547";
//        cell.labl2.text = @"49085 ROSE TER";
//        cell.labl3.text = @"$325,999";
//        cell.labl4.text = @"House";
//        cell.labl5.text = @"Renovated family home on expanisve 954sqm block";
//        //cell.labl6.text = @"Active";
//    }
//    if (indexPath.row == 1) {
//        [cell.mainImg setImage:[UIImage imageNamed:@"img3.png"]];
//        //cell.labl1.text = @"5675";
//        cell.labl2.text = @"46888 FERNALD CMN";
//        cell.labl3.text = @"$400,000";
//        cell.labl4.text = @"House";
//        cell.labl5.text = @"Renovated family home on expanisve 954sqm block";
//        //cell.labl6.text = @"Active New";
//    }
//    if (indexPath.row == 2) {
//        [cell.mainImg setImage:[UIImage imageNamed:@"img4.png"]];
//        //cell.labl1.text = @"6754";
//        cell.labl2.text = @"49002 CINNAMON FERN";
//        cell.labl3.text = @"$449,000";
//        cell.labl4.text = @"Apartment";
//        cell.labl5.text = @"Modern apartment of generous propotions";
//        //cell.labl6.text = @"Active";
//    }
//    if (indexPath.row == 3) {
//        [cell.mainImg setImage:[UIImage imageNamed:@"img5.png"]];
//        //cell.labl1.text = @"3487";
//        cell.labl2.text = @"2539 WASHINGTON";
//        cell.labl3.text = @"$710,000";
//        cell.labl4.text = @"House";
//        cell.labl5.text = @"Renovated family home on expanisve 954sqm block";
//        //cell.labl6.text = @"";
//    }
//    if (indexPath.row == 4) {
//        [cell.mainImg setImage:[UIImage imageNamed:@"img6.png"]];
//        //cell.labl1.text = @"9867";
//        cell.labl2.text = @"45088 Mardis st";
//        cell.labl3.text = @"$650,000";
//        cell.labl4.text = @"House";
//        cell.labl5.text = @"Renovated family home on expanisve 954sqm block";
//       // cell.labl6.text = @"Active New";
//    }
//    if (indexPath.row == 5) {
//        [cell.mainImg setImage:[UIImage imageNamed:@"img7.png"]];
//        //cell.labl1.text = @"7655";
//        cell.labl2.text = @"130 RACOON CT";
//        cell.labl3.text = @"$799,000";
//        cell.labl4.text = @"Apartment";
//        cell.labl5.text = @"Modern apartment of generous propotions";
//       // cell.labl6.text = @"Active";
//    }
//    if (indexPath.row == 6) {
//        [cell.mainImg setImage:[UIImage imageNamed:@"img8.png"]];
//        //cell.labl1.text = @"5544";
//        cell.labl2.text = @"15 JAPALA CT";
//        cell.labl3.text = @"$810,00";
//        cell.labl4.text = @"Apartment";
//        cell.labl5.text = @"Modern apartment of generous propotions";
//       // cell.labl6.text = @"Active Active";
//    }
    cell.Addresslabl.text = [[items objectAtIndex:indexPath.row] objectForKey:@"Address"];
  int a = [[[items objectAtIndex:indexPath.row] objectForKey:@"Price"] intValue];
    cell.Pricelabl.text  = [NSString stringWithFormat:@"%d",a];
    int b = [[[items objectAtIndex:indexPath.row] objectForKey:@"NumberOfBedRoom"] intValue];
    cell.Bedroomlabl.text  = [NSString stringWithFormat:@"%d",b];
    int d= [[[items objectAtIndex:indexPath.row] objectForKey:@"NumberOfBathRoom"] intValue];
        cell.bathroomlabl.text = [NSString stringWithFormat:@"%d",d];
    int e = [[[items objectAtIndex:indexPath.row] objectForKey:@"ParkingAvailability"] intValue];
    cell.parkinglabl.text = [NSString stringWithFormat:@"%d",e];
    cell.typelabl.text = [[items objectAtIndex:indexPath.row] objectForKey:@"Type"];
    cell.discriptionlabl.text = [[items objectAtIndex:indexPath.row] objectForKey:@"Description"];

    // cell.textLabel.text = [items objectAtIndex:indexPath.row];
    }
    @catch (NSException *exception) {
        NSLog(@"Exception %@",exception);
    }
    @finally {
        NSLog(@"Finally");
    }

    
    
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    SearchDetailViewController *srch = [[SearchDetailViewController alloc]initWithNibName:@"SearchDetailViewController" bundle:nil];
    if (indexPath.row == 0) {
        [srch setImage:[UIImage imageNamed:@"image21.png"]];
        //        cell.labl1.text = @"3547";
        [srch setText1:@"49085 ROSE TER"];
        [srch setText2:@"$325,999" ];
        [srch setText3:@"2 Bed/(2F,OH)Bath"];
        [srch setText4:@"1119 sq.ft.Condo"];
        //        cell.labl6.text = @"Active";
    }
    if (indexPath.row == 1) {
        [srch setImage:[UIImage imageNamed:@"img3.png"]];
        //        cell.labl1.text = @"5675";
        [srch setText1: @"46888 FERNALD CMN"];
        [ srch setText2:@"$400,000"];
        [srch setText3:@"3 Bed/(2F,OH)Bath"];
        [srch setText4:@"1221 sq.ft.Condo"];
        //        cell.labl6.text = @"Active New";
    }
    if (indexPath.row == 2) {
        [srch setImage:[UIImage imageNamed:@"img4.png"]];
        //        cell.labl1.text = @"6754";
        [srch setText1: @"49002 CINNAMON FERN"];
        [srch setText2:@"$449,000"];
        [srch setText3:@"2 Bed/(2F,OH)Bath"];
        [srch setText4:@"1221 sq.ft.Condo"];
        //        cell.labl6.text = @"Active";
    }
    if (indexPath.row == 3) {
        [srch setImage:[UIImage imageNamed:@"img5.png"]];
        //        cell.labl1.text = @"3487";
        [srch setText1:@"2539 WASHINGTON"];
        [srch setText2:@"$710,000"];
        [srch setText3:@"--Bed/(-F,-H)Bath"];
        [srch setText4:@"--sq.ft."];
        //        cell.labl6.text = @"";
    }
    if (indexPath.row == 4) {
        [srch setImage:[UIImage imageNamed:@"img6.png"]];
        //        cell.labl1.text = @"9867";
        [srch setText1:@"45088 Mardis st"];
        [srch setText2:@"$650,000"];
        [srch setText3: @"2 Bed/(2F,OH)Bath"];
        [srch setText4:@"1331 sq.ft.Condo"];
        //        cell.labl6.text = @"Active New";
    }
    if (indexPath.row == 5) {
        [srch setImage:[UIImage imageNamed:@"img7.png"]];
        //        cell.labl1.text = @"7655";
        [srch setText1:@"130 RACOON CT"];
        [srch setText2:@"$799,000"];
        [srch setText3:@"4 Bed/(2F,1H)Bath"];
        [srch setText4:@"1424 sq.ft.Condo"];
        //        cell.labl6.text = @"Active";
    }
    if (indexPath.row == 6) {
        [srch setImage:[UIImage imageNamed:@"img8.png"]];
        //        cell.labl1.text = @"5544";
        [srch setText1:@"15 JAPALA CT"];
        [srch setText2:@"$810,00"];
        [srch setText3:@"3 Bed/(2F,OH)Bath"];
        [srch setText4:@"1542 sq.ft.Condo"];
        //        cell.labl6.text = @"Active Active";
    }
    
    
    [self.navigationController pushViewController:srch animated:YES];
   // [tableView setsel];
//     listDetailViewController *srch = [[listDetailViewController alloc]initWithNibName:@"listDetailViewController" bundle:nil];
//     [self.navigationController pushViewController:srch animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 165;
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
