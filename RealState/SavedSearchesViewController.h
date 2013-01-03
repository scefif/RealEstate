//
//  SavedSearchesViewController.h
//  RealState
//
//  Created by Rahul kumar on 11/16/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SavedSearchesViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>{
    
    IBOutlet UITableView *dataTable;
}

@end
