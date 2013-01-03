//
//  SearchDetailViewController.h
//  RealState
//
//  Created by Rahul kumar on 11/15/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface SearchDetailViewController : UIViewController<MKMapViewDelegate,CLLocationManagerDelegate>{
    
    IBOutlet UIScrollView *scoll;
    IBOutlet UIImageView *mainImage;
    IBOutlet UIImageView *floorImage;
    IBOutlet UITextView *txtView;
    IBOutlet UILabel *bldlbl1;
    IBOutlet UILabel *bldlbl2;
    IBOutlet UILabel *bldlbl3;
    IBOutlet UILabel *bldlbl4;
    IBOutlet UILabel *aptlbl1;
    IBOutlet UILabel *aptlbl2;
    IBOutlet UILabel *aptlbl3;
    IBOutlet UILabel *inflbl1;
    IBOutlet UILabel *inflbl2;
    IBOutlet UILabel *addlbl;
    IBOutlet UILabel *pricelbl;
    UIImage *image;
    NSString *text1;
    NSString *text2;
    NSString *text3;
    NSString *text4;
    NSString *text5;
    NSString *text6;
    NSString *text7;
    NSString *text8;
    NSString *text9;
    NSString *text10;
    NSString *text11;
    IBOutlet MKMapView *myMapView;
    MKPlacemark *mPlacemark;
    NSMutableArray *mapAnnotation;
    CLLocationManager *locationManager;
    IBOutlet UIScrollView	*_scrollView;
    NSString *latstring;
    NSString *longstring;
    NSMutableArray *notationArray;
}
//@property(nonatomic,retain)
@property(nonatomic,retain)IBOutlet UIScrollView *scoll;
@property(nonatomic,retain) UIImage *image;
@property(nonatomic,retain)IBOutlet UIImageView *mainImage;
@property(nonatomic,retain)IBOutlet UIImageView *floorImage;
@property(nonatomic,retain)IBOutlet UITextView *txtView;
@property(nonatomic,retain)IBOutlet UILabel *bldlbl1;
@property(nonatomic,retain)IBOutlet UILabel *bldlbl2;
@property(nonatomic,retain)IBOutlet UILabel *bldlbl3;
@property(nonatomic,retain)IBOutlet UILabel *bldlbl4;
@property(nonatomic,retain)IBOutlet UILabel *aptlbl1;
@property(nonatomic,retain)IBOutlet UILabel *aptlbl2;
@property(nonatomic,retain)IBOutlet UILabel *aptlbl3;
@property(nonatomic,retain)IBOutlet UILabel *inflbl1;
@property(nonatomic,retain)IBOutlet UILabel *inflbl2;
@property(nonatomic,retain)IBOutlet UILabel *addlbl;
@property(nonatomic,retain)IBOutlet UILabel *pricelbl;
@property(nonatomic,retain)NSString *text1;
@property(nonatomic,retain)NSString *text2;
@property(nonatomic,retain)NSString *text3;
@property(nonatomic,retain)NSString *text4;
@property(nonatomic,retain)NSString *text5;
@property(nonatomic,retain)NSString *text6;
@property(nonatomic,retain)NSString *text7;
@property(nonatomic,retain)NSString *text8;
@property(nonatomic,retain)NSString *text9;
@property(nonatomic,retain)NSString *text10;
@property(nonatomic,retain)NSString *text11;
@property (nonatomic, retain) IBOutlet MKMapView* myMapView;
@property(nonatomic, retain) NSMutableArray *mapAnnotation;
@property (nonatomic, retain) CLLocationManager *locationManager;

-(IBAction)galleryView:(id)sender;
-(IBAction)agentView:(id)sender;
-(void)displayMYMap;
+ (CGFloat)annotationPadding;
+ (CGFloat)calloutHeight;
//-(CLLocationCoordinate2D) myLocation;

@end
