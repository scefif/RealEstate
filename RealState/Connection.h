//
//  Connection.h
//  NorbelleMerchant
//
//  Created by Mac Mini on 01/08/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ConnectionDelegate.h"

@interface Connection : NSObject <ConnectionDelegate>{
    
	uint _offset;
 	id delegate;                    // set the delegate for the Connection Delegate
 	NSMutableArray *resultArray; 	// Return the results from the response
 	NSMutableData *receiveData;     // Get the data from the server response
}
@property (nonatomic, retain) id delegate;
 
//Call the web service for Get Method
-(void) getMethod:(NSString *) getStr;
//-(void) postMethod:(NSString *) getStr passedURL:(NSString *) getURL;

@end
