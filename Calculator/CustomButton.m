//
//  CustomButton.m
//  Calculator
//
//  Created by Eric Rosenberg on 5/14/14.
//  Copyright (c) 2014 ehaydenr. All rights reserved.
//

#import "CustomButton.h"
#import <QuartzCore/QuartzCore.h>

@implementation CustomButton

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [[self layer] setBorderColor:[[UIColor blackColor] CGColor]];
    [[self layer] setBorderWidth:1.0f];
    [[self layer] setCornerRadius:8.0f];
    [[self layer] setMasksToBounds:TRUE];
}

-(void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    
    if (highlighted) {
        [self setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.1]];
    }else{
        [self setBackgroundColor:[UIColor whiteColor]];
    }
}


@end
