//
//  CustomCell.h
//  RealState
//
//  Created by Rahul kumar on 11/15/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell2 : UITableViewCell{
    
     IBOutlet UIImageView *mainImg;
     IBOutlet UILabel *Addresslabl;
     IBOutlet UILabel *Pricelabl;
     IBOutlet UILabel *Bedroomlabl;
     IBOutlet UILabel *bathroomlabl;
     IBOutlet UILabel *parkinglabl;
     IBOutlet UILabel *typelabl;
    IBOutlet UILabel *discriptionlabl;
    
}
@property (nonatomic,retain)IBOutlet UIImageView *mainImg;
@property (nonatomic,retain)IBOutlet UILabel *Addresslabl;
@property (nonatomic,retain)IBOutlet UILabel *Pricelabl;
@property (nonatomic,retain)IBOutlet UILabel *Bedroomlabl;
@property (nonatomic,retain)IBOutlet UILabel *bathroomlabl;
@property (nonatomic,retain)IBOutlet UILabel *parkinglabl;
@property (nonatomic,retain)IBOutlet UILabel *typelabl;
@property (nonatomic,retain)IBOutlet UILabel *discriptionlabl;

@end
