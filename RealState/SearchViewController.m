//
//  SearchViewController.m
//  RealState
//
//  Created by Rahul kumar on 11/13/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "SearchViewController.h"
#import "CustomCelln.h"
#import "AsyncImageView.h"
#import "SearchDetailViewController.h"
#import "Connection.h"

@interface SearchViewController ()

@end

@implementation SearchViewController
@synthesize dataTable;

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
    //dataTable.backgroundColor = [UIColor clearColor];
   // indicator.alpha = 1;
   // [indicator startAnimating];
   // NSString *url = @"http://ratiogold.com/webservice/get_category.php";
    NSString *url = @"http://10.10.5.30/property/Property-json.Json";
    Connection *connection = [[Connection alloc] init];
	[connection setDelegate:self];
	[connection getMethod:url ];
   // dataTable.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"woodenBackground.png"]];
    
    //logtable.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"Background-320-270.png"]];
  //  dataTable.borderStyle = UITextBorderStyleNone;
     
    // Do any additional setup after loading the view from its nib.
}


-(void)getResult:(id)_result{
//    [indicator stopAnimating];
//    indicator.alpha = 0;
    
    NSLog(@"this is array %@",_result);
//    array1 = [[NSMutableArray alloc]initWithObjects:@"test1",@"test2",@"test3",@"test4",@"test5",@"test6",@"test7",@"test8",@"test9",@"test10",@"test11",@"test12",@"test13",@"test14",@"test15",@"test16",@"test17",@"test18",@"test19",@"test20",@"test21",@"test22", nil];
//    [array addObject:array1];
    // array = [_result copy];
    //[dataTable reloadData];
}





- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
    
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
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        AsyncImageView *iconImgView=[[AsyncImageView alloc]init];
		[iconImgView setFrame:CGRectMake(05, 0, 50, 50)];
		[iconImgView setBackgroundColor:[UIColor clearColor]];
		[iconImgView setTag:20];
		[cell.contentView addSubview:iconImgView];
         
    }
    AsyncImageView *iconImgView=(AsyncImageView*)[cell.contentView viewWithTag:20];
    [iconImgView setWidth:50];
   // cell.backgroundColor = [UIColor clearColor];
    //NSLog(@"Image is %@",[[array objectAtIndex:indexPath.row] objectForKey:@"id"]);
    // [iconImgView loadImageFromURL:[NSURL URLWithString: [[array objectAtIndex:indexPath.row] valueForKey:@"category_image"]]];
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
    if (indexPath.row == 2) {
        [cell.mainImg setImage:[UIImage imageNamed:@"img4.png"]];
        cell.labl1.text = @"6754";
        cell.labl2.text = @"49002 CINNAMON FERN";
        cell.labl3.text = @"$449,000";
        cell.labl4.text = @"2 Bed/(2F,OH)Bath";
        cell.labl5.text = @"1221 sq.ft.Condo";
        cell.labl6.text = @"Active";
    }
    if (indexPath.row == 3) {
        [cell.mainImg setImage:[UIImage imageNamed:@"img5.png"]];
        cell.labl1.text = @"3487";
        cell.labl2.text = @"2539 WASHINGTON";
        cell.labl3.text = @"$710,000";
        cell.labl4.text = @"--Bed/(-F,-H)Bath";
        cell.labl5.text = @"--sq.ft.";
        cell.labl6.text = @"";
    }
    if (indexPath.row == 4) {
        [cell.mainImg setImage:[UIImage imageNamed:@"img6.png"]];
        cell.labl1.text = @"9867";
        cell.labl2.text = @"45088 Mardis st";
        cell.labl3.text = @"$650,000";
        cell.labl4.text = @"2 Bed/(2F,OH)Bath";
        cell.labl5.text = @"1331 sq.ft.Condo";
        cell.labl6.text = @"Active New";
    }
    if (indexPath.row == 5) {
        [cell.mainImg setImage:[UIImage imageNamed:@"img7.png"]];
        cell.labl1.text = @"7655";
        cell.labl2.text = @"130 RACOON CT";
        cell.labl3.text = @"$799,000";
        cell.labl4.text = @"4 Bed/(2F,1H)Bath";
        cell.labl5.text = @"1424 sq.ft.Condo";
        cell.labl6.text = @"Active";
    }
    if (indexPath.row == 6) {
        [cell.mainImg setImage:[UIImage imageNamed:@"img8.png"]];
        cell.labl1.text = @"5544";
        cell.labl2.text = @"15 JAPALA CT";
        cell.labl3.text = @"$810,00";
        cell.labl4.text = @"3 Bed/(2F,OH)Bath";
        cell.labl5.text = @"1542 sq.ft.Condo";
        cell.labl6.text = @"Active Active";
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
 }

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 130;
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
