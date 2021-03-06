//
//  ImageCacheObject.h
//  DeenstDesk
//
//  Created by Rahul kumar on 11/9/12.
//  Copyright (c) 2012 Rahul kumar. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ImageCacheObject : NSObject {
   
	NSUInteger size;    // size in bytes of image data
    
	NSDate *timeStamp;  // time of last access
    
	UIImage *image;     // cached image
}

@property (nonatomic, readonly) NSUInteger size;

@property (nonatomic, retain, readonly) NSDate *timeStamp;

@property (nonatomic, retain, readonly) UIImage *image;

-(id)initWithSize:(NSUInteger)sz Image:(UIImage*)anImage;

-(void)resetTimeStamp;

@end
