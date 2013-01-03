//
//  TableHeaderViewController.h
//  RealState
//
//  Created by Rahul kumar on 12/3/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableHeaderViewController : UIView{
    
    UILabel *title;
    UIActivityIndicatorView *activityIndicator;
}

@property (nonatomic, retain) IBOutlet UILabel *title;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
