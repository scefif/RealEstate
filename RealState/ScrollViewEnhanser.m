//
//  ScrollViewEnhanser.m
//  JordanRealState
//
//  Created by Rahul kumar on 11/26/12.
//  Copyright (c) 2012 Vmoksha. All rights reserved.
//

#import "ScrollViewEnhanser.h"

@implementation ScrollViewEnhanser

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	if ([self pointInside:point withEvent:event]) {
		return _scrollView;
	}
	return nil;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
