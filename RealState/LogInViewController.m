//
//  LogInViewController.m
//  RealState
//
//  Created by Rahul kumar on 11/13/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "LogInViewController.h"
#import "RegistrationViewController.h"
#import "ForgotPasswordViewController.h"
#import "listViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface LogInViewController ()

@end

@implementation LogInViewController

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
    
    scoll.contentSize = CGSizeMake(320, 500);
    signBtn.layer.cornerRadius = 7; // this value vary as per your desire
    // signBtn.layer.shadowColor
    signBtn.layer.masksToBounds = NO;
    signBtn.layer.borderWidth = 0.0f;
    
    
    signBtn.layer.shadowColor = [UIColor redColor].CGColor;
    signBtn.layer.shadowOpacity = 0.8;
    signBtn.layer.shadowRadius = 12;
    signBtn.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    signBtn.clipsToBounds = YES;
    createAccBtn.layer.cornerRadius = 7; // this value vary as per your desire
    // signBtn.layer.shadowColor
    createAccBtn.layer.masksToBounds = NO;
    createAccBtn.layer.borderWidth = 0.0f;
    
    
    createAccBtn.layer.shadowColor = [UIColor redColor].CGColor;
    createAccBtn.layer.shadowOpacity = 0.8;
    createAccBtn.layer.shadowRadius = 12;
    createAccBtn.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    createAccBtn.clipsToBounds = YES;

    // Do any additional setup after loading the view from its nib.
}
-(void)viewWillAppear:(BOOL)animated{
    [self.navigationController setNavigationBarHidden:NO];
}

-(IBAction)createaccount:(id)sender{
    RegistrationViewController *reg = [[RegistrationViewController alloc]initWithNibName:@"RegistrationViewController" bundle:nil ];
    [self.navigationController pushViewController:reg animated:YES];
    
}
-(IBAction)forgotPassword:(id)sender{
    UIAlertView *alret = [[UIAlertView alloc] initWithTitle:@"Forgot Password?" message:@"Go to mobile web browser" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alret show];
//    ForgotPasswordViewController *frgt = [[ForgotPasswordViewController alloc] initWithNibName:@"ForgotPasswordViewController" bundle:nil];
//    [self.navigationController pushViewController:frgt animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    [scoll setContentOffset:CGPointMake(0, 0) animated:YES];
    return YES;
}

-(IBAction)login:(id)sender{
    if ([EmailField.text isEqualToString:@""]||[PasswordField.text isEqualToString:@""]) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Message" message:@"Email or Password cann't be blank" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil,nil ];
        [alert show];
    }
    else{
        [EmailField resignFirstResponder];
        [PasswordField resignFirstResponder];
         //    [self.navigationController pushViewController:view animated:YES];
        //[self presentModalViewController:view animated:YES];
        listViewController *srch = [[listViewController alloc]init];//WithNibName:@"SearchViewController" bundle:nil];
    [self.navigationController pushViewController:srch animated:YES];
    }
}
-(IBAction)cancel:(id)sender{
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    
    CGRect rect=textField.frame;
    [scoll setContentOffset:CGPointMake(0, rect.origin.y-60) animated:YES];
}
- (void)keyboardWillBeHidden:(NSNotification*)aNotification {
    UIEdgeInsets contentInsets = UIEdgeInsetsZero;
    scoll.contentInset = contentInsets;
    scoll.scrollIndicatorInsets = contentInsets;
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
