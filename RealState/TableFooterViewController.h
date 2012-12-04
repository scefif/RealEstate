//
//  TableFooterViewController.h
//  RealState
//
//  Created by Rahul kumar on 11/19/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableFooterViewController : UIView{
    
    UIActivityIndicatorView *activityIndicator;
    UILabel *infoLabel;
    UILabel *infoLabel2;
    
}

@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, retain) IBOutlet UILabel *infoLabel;
@property (nonatomic, retain) IBOutlet UILabel *infoLabel2;

 

@end
