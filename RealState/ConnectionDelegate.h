//
//  ConnectionDelegate.h
//  MyScanRewards
//
//  Created by Mac Mini on 11/01/12.
//  Copyright 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

//Protocol for Connection class
@protocol ConnectionDelegate
//This method would be return the data as response from the server
-(void) getResult : (id) _result;

@end
