//
//  Calculator.m
//  Calculator
//
//  Created by Eric Rosenberg on 5/14/14.
//  Copyright (c) 2014 ehaydenr. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

@synthesize justComputed;

-(void)printBuffers{
    NSLog(@"Current Buffer: %@ \nPrevious Buffer: %@", [self currentBuffer], [self previousBuffer]);
}

-(id)init{
    if(self = [super init]){
        NSMutableString* prevBuf = [[NSMutableString alloc] initWithString:@"0"];
        NSMutableString* currBuf = [[NSMutableString alloc] initWithString:@"0"];
        
        [self setCurrentBuffer:currBuf];
        [self setPreviousBuffer:prevBuf];
        [self setPendingOperation:@""];
        [self setJustComputed:FALSE];
    }
    return self;
}

-(void)addToBuffer:(NSString *)number{
    if([self justComputed]){
        //[[self previousBuffer] setString:@"0"];
        [[self currentBuffer] setString:@"0"];
        [self setJustComputed:FALSE];
    }
    if([[self currentBuffer] isEqualToString:@"0"]){
        [[self currentBuffer] setString:number];
    }else{
        [[self currentBuffer] appendString:number];
    }
}

-(void)clearBuffer{
    [self setPendingOperation:@""];
    [self.previousBuffer setString:@"0"];
    [self.currentBuffer setString:@"0"];
}

-(NSString *)add{
    float oldPrevious = [[self previousBuffer] floatValue];
    float valueToBeAdded = [[self currentBuffer] floatValue];
    float result = oldPrevious + valueToBeAdded;
    return [NSString stringWithFormat:@"%f", result];
}
-(NSString *)subtract{
    float oldPrevious = [[self previousBuffer] floatValue];
    float valueToBeSubtracted = [[self currentBuffer] floatValue];
    float result = oldPrevious - valueToBeSubtracted;
    return [NSString stringWithFormat:@"%f", result];
}
-(NSString *)multiply{
    float oldPrevious = [[self previousBuffer] floatValue];
    float valueToBeMultiplied = [[self currentBuffer] floatValue];
    float result = oldPrevious *valueToBeMultiplied;
    return [NSString stringWithFormat:@"%f", result];
}
-(NSString *)divide{
    float oldPrevious = [[self previousBuffer] floatValue];
    float valueToBeDivided = [[self currentBuffer] floatValue];
    float result = oldPrevious / valueToBeDivided;
    return [NSString stringWithFormat:@"%f", result];
}

-(void)compute{
    
    [self executePendingOperation];
    [[self currentBuffer] setString:[self previousBuffer]];
    [[self previousBuffer] setString:@"0"];
    [self setJustComputed:TRUE];
}

-(void)executePendingOperation{

    NSString* op = [self pendingOperation];
    if([op isEqualToString:@"+"]){
        [self.previousBuffer setString:[self add]];
    }else if([op isEqualToString:@"-"]){
        [self.previousBuffer setString:[self subtract]];
    }else if([op isEqualToString:@"x"]){
        [self.previousBuffer setString:[self multiply]];
    }else if([op isEqualToString:@"/"]){
        [self.previousBuffer setString:[self divide]];
    }else {
        NSLog(@"No pending operations");
        [self.previousBuffer setString:[self currentBuffer]];
    }
}

-(void)operate:(NSString *)operation{
    if([self justComputed]){
        [self setPendingOperation:@""];
        [[self previousBuffer] setString:[self currentBuffer]];
        [self setJustComputed:FALSE];
    }
    [self executePendingOperation];
    //[[self currentBuffer] setString:@"0"];
    [[self currentBuffer] setString:[self previousBuffer]];
    [self setJustComputed:TRUE];
    [self setPendingOperation:operation];
    
}

@end
