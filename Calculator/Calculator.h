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
-(NSString *)add;
-(NSString *)subtract;
-(NSString *)multiply;
-(NSString *)divide;
-(void)compute;
-(void)operate:(NSString *)operation;

@end
