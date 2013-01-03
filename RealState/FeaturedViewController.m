//
//  FeaturedViewController.m
//  RealState
//
//  Created by Rahul kumar on 11/16/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "FeaturedViewController.h"

@interface FeaturedViewController ()

@end

@implementation FeaturedViewController
@synthesize segmentedControl;

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
    bedbool = FALSE;
    pricebool = FALSE;
    squarebool = FALSE;
    //simplBtn.enabled = NO;
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    pickerArray = [[NSMutableArray alloc]init];
    // Do any additional setup after loading the view from its nib.
}


-(IBAction)bedrooms:(id)sender{
    bedbool = TRUE;
    pricebool = FALSE;
    squarebool = FALSE;
    pickerCustomView.frame = CGRectMake(0, 205, 320, pickerCustomView.frame.size.height);
    [self.view addSubview:pickerCustomView];
    bedArray = [[NSMutableArray alloc]initWithObjects:@"1 bed room",@"2 bed rooms",@"3 bed rooms",@"4 bed rooms", nil];
    [self pickerViewItem:bedArray];
    [picker reloadAllComponents];
    picker.showsSelectionIndicator=YES;
    
}

-(IBAction)pricebtn:(id)sender{
    bedbool = FALSE;
    pricebool = TRUE;
    squarebool = FALSE;
    pickerCustomView.frame = CGRectMake(0, 205, 320, pickerCustomView.frame.size.height);
    [self.view addSubview:pickerCustomView];
    priceArray = [[NSMutableArray alloc]initWithObjects:@"$100,000-300,000",@"$200,000-600,000",@"$400,000-800,000",@"$500,000-1000,000", nil];
    [self pickerViewItem:priceArray];
    [picker reloadAllComponents];
    picker.showsSelectionIndicator=YES;
}


-(IBAction)squreftbtn:(id)sender{
    bedbool = FALSE;
    pricebool = FALSE;
    squarebool = TRUE;
    pickerCustomView.frame = CGRectMake(0, 205, 320, pickerCustomView.frame.size.height);
    [self.view addSubview:pickerCustomView];
    suareftArray = [[NSMutableArray alloc]initWithObjects:@"300 sq ft",@"400 sq ft",@"600 sq ft",@"700 sq ft", nil];
    [self pickerViewItem:suareftArray];
    [picker reloadAllComponents];
    picker.showsSelectionIndicator=YES;
}

-(void) pickerViewItem : (NSMutableArray *) getItems
{
	//pickerCustomView.frame = CGRectMake(0, 190, 320, pickerCustomView.frame.size.height);
 	[self.view addSubview:pickerCustomView];
  	pickerArray = [getItems copy];
 	[picker reloadAllComponents];
    
}

-(IBAction)advanceSrch:(id)sender{
   // [self.navigationController setNavigationBarHidden:YES];
    scroll.contentSize = CGSizeMake(320, 630);
    scroll.backgroundColor = [UIColor clearColor];
    advanceView.frame = CGRectMake(0, 100, 320, 362);
    [self.view addSubview:advanceView];
    
    
}
-(IBAction)locationSrch:(id)sender{
    //[self.navigationController setNavigationBarHidden:YES];
    [advanceView removeFromSuperview];
    locationView.frame = CGRectMake(0, 100, 320, 362);
    [self.view addSubview:locationView];

    
}
-(IBAction)segmentBtnAction:(id)sender{
    switch (self.segmentedControl.selectedSegmentIndex) {
          
        case 0:
            [self simplSrch:sender];
             break;
         
        case 1:
            [self advanceSrch:sender];
            break;
        case 2:
            [self locationSrch:sender];
            break;
        default:
           
            break;
    }

}

-(IBAction)simplSrch:(id)sender{
    [self.navigationController setNavigationBarHidden:NO];
    [advanceView removeFromSuperview];
    [locationView removeFromSuperview];
    
}

-(IBAction) doneActionForPickerView
{
    
     [pickerCustomView removeFromSuperview];
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)thePickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)thePickerView numberOfRowsInComponent:(NSInteger)component {
 	return  [pickerArray count];
}

- (NSString *)pickerView:(UIPickerView *)thePickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
     
        return  [pickerArray objectAtIndex:row];
    }

- (void)pickerView:(UIPickerView *)thePickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    if (bedbool) {
        bedlbl.text = [pickerArray objectAtIndex:row];
        bedlbl.textColor = [UIColor blackColor];
    }
    if (pricebool) {
        pricelbl.text = [pickerArray objectAtIndex:row];
        pricelbl.textColor = [UIColor blackColor];
    }
    if (squarebool) {
        sqareftlbl.text = [pickerArray objectAtIndex:row];
        sqareftlbl.textColor = [UIColor blackColor];
    }
     
//               self.getPickerString= [[itemArray objectAtIndex:row] objectForKey:getCityName];
//        [self getPickerData:self.getPickerString];
//    
//	
//    else {
//        self.getPickerString = [itemArray objectAtIndex:row];
//        [self getPickerData:self.getPickerString];
//    }
}
-(void) getPickerData : (NSString *) getStr
{
    //        NSLog(@"get str is %@", getStr);
//    citytextField.text = getStr;
//    dydtlbl.text  = getStr;
//    self.dateString = [NSString stringWithFormat:@"%@", getStr];
//    //dydtlbl.text = self.dateString;
//    dydtlbl.textColor = [UIColor blackColor];
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
