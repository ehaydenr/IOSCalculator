//
//  ViewController.h
//  Calculator
//
//  Created by Eric Rosenberg on 5/14/14.
//  Copyright (c) 2014 ehaydenr. All rights reserved.
//

#import <UIKit/UIKit.h>

@class  Calculator;

@interface ViewController : UIViewController

@property (weak) IBOutlet UITextField *textField;
@property (strong) Calculator *calculator;

-(IBAction)write:(UIButton *)sender;
-(IBAction)clear:(id)sender;
-(IBAction)operate:(UIButton *)operation;
-(IBAction)compute:(id)sender;

-(void)updateUI;

@end
