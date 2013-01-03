//
//  NearMeViewController.m
//  RealState
//
//  Created by Rahul kumar on 11/15/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "NearMeViewController.h"
#import "PresentLocationAnnotation.h"

enum
{
    kCityAnnotationIndex = 0,
    kBridgeAnnotationIndex
};

@interface NearMeViewController ()

@end

@implementation NearMeViewController
@synthesize myMapView,mapAnnotation,locationManager;;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

+ (CGFloat)annotationPadding;
{
    return 10.0f;
}
+ (CGFloat)calloutHeight;
{
    return 40.0f;
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    latstring = [[NSString alloc] init];
    longstring = [[NSString alloc] init];
    NSDictionary *d1,*d2,*d3,*d4,*d5;
    d1=[NSDictionary dictionaryWithObjectsAndKeys:@"40.8158871",@"latitude",@"-73.9503793",@"longitude",nil];
	d2=[NSDictionary dictionaryWithObjectsAndKeys:@"40.8113824",@"latitude",@"-73.9547994",@"longitude",nil];
	d3=[NSDictionary dictionaryWithObjectsAndKeys:@"40.8169443",@"latitude",@"-73.9558333",@"longitude",nil];
	d4=[NSDictionary dictionaryWithObjectsAndKeys:@"40.8143826",@"latitude",@"-73.9567997",@"longitude",nil];
	d5=[NSDictionary dictionaryWithObjectsAndKeys:@"40.8111409",@"latitude",@"-73.9572948",@"longitude",nil];
    notationArray=[[NSMutableArray alloc] initWithObjects:d1,d2,d3,d4,d5,nil];
    [self.navigationController setNavigationBarHidden:NO];
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];

    myMapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 43, 320, 415)];
    myMapView.delegate=self;
    myMapView.showsUserLocation=FALSE;
    myMapView.mapType=MKMapTypeHybrid;
	//myMapView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:myMapView];
    [NSThread detachNewThreadSelector:@selector(displayMYMap) toTarget:self withObject:nil];
	
    mapAnnotation = [[NSMutableArray alloc] init];//WithCapacity:2];
    [self.myMapView removeAnnotations:self.myMapView.annotations];  // remove any annotations that exist
    [self.myMapView addAnnotations:self.mapAnnotation];
    // Do any additional setup after loading the view from its nib.
}


-(void)displayMYMap{
    NSLog(@"ArrayValue:%@ and count:%d",notationArray,[notationArray count]);
    for (int i=0; i<[notationArray count]; i++) {
        float latitude=[[[notationArray objectAtIndex:i] valueForKey:@"latitude"] floatValue];
        float longitude=[[[notationArray objectAtIndex:i] valueForKey:@"longitude"] floatValue];
        
        MKCoordinateRegion region;
        MKCoordinateSpan span;
        span.latitudeDelta=0.05;
        span.longitudeDelta=0.05;
        CLLocationCoordinate2D location; //= [self myLocation];
        location.latitude = latitude;//40.7143528 ;
        location.longitude = longitude;//-74.0059731;
        
        PresentLocationAnnotation *prestloc = [[PresentLocationAnnotation alloc] initWithCoordinate:location];
        //[prestloc setMapaddr:location];
        [mapAnnotation insertObject:prestloc atIndex:kCityAnnotationIndex];
        region.span=span;
        region.center=location;
        [myMapView setRegion:region animated:TRUE];
        [myMapView regionThatFits:region];
        [myMapView addAnnotation:prestloc];
        //    if (myMapView.userLocation) {
        //        [myMapView addAnnotation:prestloc];
        //        //[self.myMapView removeAnnotations:self.myMapView.annotations];
        //    }
        //    else{
        //        [self.myMapView removeAnnotations:self.myMapView.annotations];
        //    }
    }
    
    
}

-(CLLocationCoordinate2D) myLocation;
{
//    latstring = [NSString stringWithFormat:@"%f",  coordinate.latitude];
//    longstring = [NSString stringWithFormat:@"%f", newLocation.coordinate.longitude]
     // To get the current location of the place
 	self.locationManager = [[CLLocationManager alloc] init];
    
  	self.locationManager.delegate = self;
 	self.locationManager.distanceFilter =kCLLocationAccuracyNearestTenMeters; //whenever we move
 	self.locationManager.desiredAccuracy = kCLLocationAccuracyBest; //100 m
	//Start the location manager, then only updates the current location
    double latitude = 0.0;
    double longitude = 0.0;
    [self.locationManager startUpdatingLocation];
    CLLocationCoordinate2D location;
    latitude = [latstring doubleValue];
    longitude = [longstring doubleValue];
    location.latitude =latitude;
    location.longitude =longitude;
    return location;
 	
}

//In Location manager delegate method, if the location is updated it will call and get the values from the newLocation using CLLocation
-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    //CLLocationDistance distance = [newLocation distanceFromLocation:oldLocation];
   // NSDate* eventDate = newLocation.timestamp;
    //NSTimeInterval howRecent = [eventDate timeIntervalSinceNow];
    latstring = [NSString stringWithFormat:@"%f", newLocation.coordinate.latitude];
    longstring = [NSString stringWithFormat:@"%f", newLocation.coordinate.longitude];
    [locationManager stopUpdatingLocation];
}


- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"location"];
    annView.pinColor = MKPinAnnotationColorRed;
    annView.animatesDrop=FALSE;
    annView.canShowCallout = YES;
    annView.calloutOffset = CGPointMake(-5, 5);
    return annView;
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
