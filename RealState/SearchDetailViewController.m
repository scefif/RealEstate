//
//  SearchDetailViewController.m
//  RealState
//
//  Created by Rahul kumar on 11/15/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "SearchDetailViewController.h"
#import "PresentLocationAnnotation.h"
#import "GalleryViewController.h"
#import "AgentViewController.h"


enum
{
    kCityAnnotationIndex = 0,
    kBridgeAnnotationIndex
};

@interface SearchDetailViewController ()

@end

@implementation SearchDetailViewController
@synthesize mainImage,floorImage,image,bldlbl1,bldlbl2,bldlbl3,bldlbl4,addlbl,aptlbl1,aptlbl2,aptlbl3,pricelbl,inflbl1,inflbl2,txtView;
@synthesize text1,text10,text11,text2,text3,text4,text5,text6,text7,text8,text9,myMapView,mapAnnotation,locationManager,scoll;
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
    [mainImage setImage:image];
    [floorImage setImage:[UIImage imageNamed:@"floorPlan.png"]];
    [self.navigationController setNavigationBarHidden:NO];
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    scoll.contentSize = CGSizeMake(320, 2250);
    addlbl.text = text1;
    pricelbl.text = text2;
    aptlbl1.text = text3;
    aptlbl2.text = @"Park and CityView";
    aptlbl3.text = text4;
    bldlbl1.text = @"Cooperative";
    bldlbl2.text = @"Pets Allowed";
    bldlbl3.text = @"Elevator Operator";
    bldlbl4.text = @"Post-War building";
    inflbl1.text = [NSString stringWithFormat:@"Price:   %@",text2];
    inflbl2.text = [NSString stringWithFormat:@"Maint/CC:%@",@"$268"];
    _scrollView.clipsToBounds = NO;
	_scrollView.pagingEnabled = YES;
    
	_scrollView.showsHorizontalScrollIndicator = NO;
	
	CGFloat contentOffset = 0.0f;
	//NSArray *imageFilenames = [NSArray arrayWithObjects:@"first.jpg",@"new.jpg",@"next.jpg", @"change.jpg", @"reply.jpg",nil];
    NSArray *imageFilenames = [NSArray arrayWithObjects:@"house.png",@"hall.png",@"living.png", @"kitchen.png", @"kids.png",@"balconi.png",nil];
    
	for (NSString *singleImageFilename in imageFilenames) {
		CGRect imageViewFrame = CGRectMake(contentOffset, 0.0f, _scrollView.frame.size.width, _scrollView.frame.size.height);
        UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:imageViewFrame];
        [imageView1 setImage:[UIImage imageNamed:@"frameImg5.png"]];
        imageView1.contentMode = UIViewContentModeCenter;
        [_scrollView addSubview:imageView1];
		UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
        //imageView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"frameImg2.png"]];
        //imageView.image = [UIImage imageNamed:@"frameImg2.png"];
 		imageView.image = [UIImage imageNamed:singleImageFilename];
		imageView.contentMode = UIViewContentModeCenter;
        //_scrollView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"frameImg2.png"]];
		[_scrollView addSubview:imageView];
 		contentOffset += imageView.frame.size.width;
		_scrollView.contentSize = CGSizeMake(contentOffset, _scrollView.frame.size.height);
	}
    // Do any additional setup after loading the view from its nib.
    NSDictionary *d1,*d2,*d3,*d4,*d5;
    d1=[NSDictionary dictionaryWithObjectsAndKeys:@"23.02941395",@"latitude",@"72.54620655",@"longitude",nil];
	d2=[NSDictionary dictionaryWithObjectsAndKeys:@"23.028359049999995",@"latitude",@"72.54537318333334",@"longitude",nil];
	d3=[NSDictionary dictionaryWithObjectsAndKeys:@"23.029545",@"latitude",@"72.546036",@"longitude",nil];
	d4=[NSDictionary dictionaryWithObjectsAndKeys:@"23.030050",@"latitude",@"72.546226",@"longitude",nil];
	d5=[NSDictionary dictionaryWithObjectsAndKeys:@"23.030050",@"latitude",@"72.546022",@"longitude",nil];
	
	
	// adding data into array
	
	notationArray=[[NSMutableArray alloc] initWithObjects:d1,d2,d3,d4,d5,nil];

    myMapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 1150, 320, 171)];
    myMapView.delegate=self;
    myMapView.showsUserLocation=FALSE;
    myMapView.mapType=MKMapTypeHybrid;
	//myMapView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.scoll addSubview:myMapView];
    [NSThread detachNewThreadSelector:@selector(displayMYMap) toTarget:self withObject:nil];
	
    mapAnnotation = [[NSMutableArray alloc] initWithCapacity:2];
    [self.myMapView removeAnnotations:self.myMapView.annotations];  // remove any annotations that exist
    [self.myMapView addAnnotations:self.mapAnnotation];
}

+ (CGFloat)annotationPadding;
{
    return 10.0f;
}
+ (CGFloat)calloutHeight;
{
    return 40.0f;
}

-(IBAction)galleryView:(id)sender{
    
    
}

-(IBAction)agentView:(id)sender{
    
    
}

-(void)displayMYMap{
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta=0.1;
    span.longitudeDelta=0.1;
    CLLocationCoordinate2D location; //= [self myLocation];
    location.latitude = 40.7143528 ;
    location.longitude = -74.0059731;
    
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
