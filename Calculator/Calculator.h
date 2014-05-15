//
//  Calculator.h
//  Calculator
//
//  Created by Eric Rosenberg on 5/14/14.
//  Copyright (c) 2014 ehaydenr. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

@property (retain) NSMutableString* previousBuffer;
@property (retain) NSString* pendingOperation;
@property (retain) NSMutableString* currentBuffer;
@property BOOL  justComputed;

-(void)addToBuffer:(NSString *)number;
-(void)clearBuffer;
-(void)clearCurrentBuffer;
-(NSString *)add:(float)previous with:(float)current;
-(NSString *)subtract:(float)previous with:(float)current;
-(NSString *)multiply:(float)previous with:(float)current;
-(NSString *)divide:(float)previous with:(float)current;
-(void)compute;
-(void)operate:(NSString *)operation;

@end
