//
//  LogInViewController.h
//  RealState
//
//  Created by Rahul kumar on 11/13/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LogInViewController : UIViewController{
    
    IBOutlet UITextField *text1;
    IBOutlet UIScrollView *scoll;
    IBOutlet UITextField *EmailField;
    IBOutlet UITextField *PasswordField;
    IBOutlet UIButton *signBtn;
    IBOutlet UIButton *createAccBtn;
}

-(IBAction)createaccount:(id)sender;
-(IBAction)forgotPassword:(id)sender;
-(IBAction)login:(id)sender;
-(IBAction)cancel:(id)sender;

@end
