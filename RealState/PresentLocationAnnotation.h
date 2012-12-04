//
//  PresentLocationAnnotation.h
//  Engage
//
//  Created by FStech on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface PresentLocationAnnotation : NSObject<MKAnnotation>{
    UIImage *image;
    NSNumber *latitude;
    NSNumber *longitude;
	CLLocationCoordinate2D coordinate;
    NSString *mapaddr;

}
@property (nonatomic, retain) UIImage *image;
@property (nonatomic, retain) NSNumber *latitude;
@property (nonatomic, retain) NSNumber *longitude;
@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, retain) NSString *mapaddr;
-(id)initWithCoordinate:(CLLocationCoordinate2D) coordinate;

@end
