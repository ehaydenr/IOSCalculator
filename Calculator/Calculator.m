//
//  Calculator.m
//  Calculator
//
//  Created by Eric Rosenberg on 5/14/14.
//  Copyright (c) 2014 ehaydenr. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator

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
        [[self currentBuffer] setString:@"0"];
        [self setJustComputed:FALSE];
    }
    if([[self currentBuffer] isEqualToString:@"0"]){
        [[self currentBuffer] setString:number];
    }else{
        [[self currentBuffer] appendString:number];
    }
}

-(void)clearCurrentBuffer{
    [self.currentBuffer setString:@"0"];
}

-(void)clearBuffer{
    [self setPendingOperation:@""];
    [self.previousBuffer setString:@"0"];
    [self.currentBuffer setString:@"0"];
}

-(NSString *)add:(float)previous with:(float)current{
    //float result = previous + current;
    return [NSString stringWithFormat:@"%f", previous + current];
}
-(NSString *)subtract:(float)previous with:(float)current{
    float result = previous - current;
    return [NSString stringWithFormat:@"%f", result];
}
-(NSString *)multiply:(float)previous with:(float)current{
    float result = previous *current;
    return [NSString stringWithFormat:@"%f", result];
}
-(NSString *)divide:(float)previous with:(float)current{
    float result = previous / current;
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
    float previousBufferValue = [[self previousBuffer] floatValue];
    float currentBufferValue = [[self currentBuffer] floatValue];
    if([op isEqualToString:@"+"]){
        [self.previousBuffer setString:[self add:previousBufferValue with:currentBufferValue]];
    }else if([op isEqualToString:@"-"]){
        [self.previousBuffer setString:[self subtract:previousBufferValue with:currentBufferValue]];
    }else if([op isEqualToString:@"x"]){
        [self.previousBuffer setString:[self multiply:previousBufferValue with:currentBufferValue]];
    }else if([op isEqualToString:@"/"]){
        [self.previousBuffer setString:[self divide:previousBufferValue with:currentBufferValue]];
    }else {
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
    [[self currentBuffer] setString:[self previousBuffer]];
    [self setJustComputed:TRUE];
    [self setPendingOperation:operation];
    
}

@end
