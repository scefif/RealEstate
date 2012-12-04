//
//  PresentLocationAnnotation.m
//  Engage
//
//  Created by FStech on 4/10/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "PresentLocationAnnotation.h"

@implementation PresentLocationAnnotation
@synthesize image;
@synthesize latitude;
@synthesize longitude;
@synthesize coordinate,mapaddr;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	coordinate=c;
	//NSLog(@"%f,%f",c.latitude,c.longitude);
	return self;
}

- (void)dealloc
{
    [image release];
    [super dealloc];
}

- (NSString *)title
{

    NSString *string = [mapaddr stringByReplacingOccurrencesOfString:@"+" withString:@"\n"];
    return string;
}

// optional
- (NSString *)subtitle
{
    
    return @"";
}

@end
