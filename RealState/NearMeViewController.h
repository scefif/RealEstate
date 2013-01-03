//
//  NearMeViewController.h
//  RealState
//
//  Created by Rahul kumar on 11/15/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface NearMeViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>{
    IBOutlet MKMapView *myMapView;
    MKPlacemark *mPlacemark;
    NSMutableArray *mapAnnotation;
    CLLocationManager *locationManager;
    NSMutableArray *notationArray;
    NSString *latstring;
    NSString *longstring;
    
}
@property (nonatomic, retain) IBOutlet MKMapView* myMapView;
@property(nonatomic, retain) NSMutableArray *mapAnnotation;
@property (nonatomic, retain) CLLocationManager *locationManager;
-(void)displayMYMap;
+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;
-(CLLocationCoordinate2D) myLocation;


@end
