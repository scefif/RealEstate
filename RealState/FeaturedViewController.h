//
//  FeaturedViewController.h
//  RealState
//
//  Created by Rahul kumar on 11/16/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FeaturedViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>{
    
    IBOutlet UIPickerView *picker;
    IBOutlet UIView *pickerCustomView;
    IBOutlet UIButton *simplBtn;
    NSMutableArray *bedArray;
    NSMutableArray *priceArray;
    NSMutableArray *suareftArray;
    NSMutableArray *pickerArray;
    IBOutlet UILabel *bedlbl;
    IBOutlet UILabel *pricelbl;
    IBOutlet UILabel *sqareftlbl;
    IBOutlet UIView *advanceView;
    IBOutlet UIView *locationView;
    IBOutlet UIScrollView *scroll;
    IBOutlet UISegmentedControl *segmentedControl;
    BOOL bedbool;
    BOOL pricebool;
    BOOL squarebool;
}
@property(nonatomic,retain)IBOutlet UISegmentedControl *segmentedControl;

-(IBAction)bedrooms:(id)sender;
-(IBAction)pricebtn:(id)sender;
-(IBAction)squreftbtn:(id)sender;
-(IBAction)advanceSrch:(id)sender;
-(IBAction)locationSrch:(id)sender;
-(IBAction)simplSrch:(id)sender;
-(IBAction)segmentBtnAction:(id)sender;




@end
