//
//  listViewController.h
//  JordanRealState
//
//  Created by Rahul kumar on 11/23/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STableViewController.h"

@interface listViewController : STableViewController{
    NSMutableArray *items;
     NSMutableArray *ResultArray;
    UIActivityIndicatorView *activity;
    BOOL firstLoadbool;
    BOOL refreshBool1;
    BOOL loadMoreBool;
    
}
@end
