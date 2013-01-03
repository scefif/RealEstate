//
//  SearchViewController.h
//  RealState
//
//  Created by Rahul kumar on 11/13/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITableView *dataTable;
}
@property(nonatomic,retain)IBOutlet UITableView *dataTable;

@end
