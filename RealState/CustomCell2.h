//
//  CustomCell.h
//  RealState
//
//  Created by Rahul kumar on 11/15/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell{
    
     IBOutlet UIImageView *mainImg;
     IBOutlet UILabel *labl1;
     IBOutlet UILabel *labl2;
     IBOutlet UILabel *labl3;
     IBOutlet UILabel *labl4;
     IBOutlet UILabel *labl5;
     IBOutlet UILabel *labl6;
    
}
@property (nonatomic,retain)IBOutlet UIImageView *mainImg;
@property (nonatomic,retain)IBOutlet UILabel *labl1;
@property (nonatomic,retain)IBOutlet UILabel *labl2;
@property (nonatomic,retain)IBOutlet UILabel *labl3;
@property (nonatomic,retain)IBOutlet UILabel *labl4;
@property (nonatomic,retain)IBOutlet UILabel *labl5;
@property (nonatomic,retain)IBOutlet UILabel *labl6;

@end
