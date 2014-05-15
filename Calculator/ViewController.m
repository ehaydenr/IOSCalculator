//
//  ViewController.m
//  Calculator
//
//  Created by Eric Rosenberg on 5/14/14.
//  Copyright (c) 2014 ehaydenr. All rights reserved.
//

#import "ViewController.h"
#import "Calculator.h"

@interface ViewController ()

@end

@implementation ViewController

-(IBAction)write:(UIButton *)sender{
    [self.calculator addToBuffer:[sender currentTitle]];
    [self updateUI];
}

-(IBAction)clearCurrentBuffer:(id)sender{
    [self.calculator clearCurrentBuffer];
    [self updateUI];
}

-(IBAction)clearEverything:(id)sender{
    [self.calculator clearBuffer];
    [self updateUI];
}

-(IBAction)operate:(UIButton *)sender{
    NSString *title = [sender currentTitle];
    [self.calculator operate:title];
    [self updateUI];
}

-(IBAction)compute:(id)sender{
    [self.calculator compute];
    [self updateUI];
}

-(void)updateUI{
    float fl = [[self.calculator currentBuffer] floatValue];
    NSString* buf = [NSString stringWithFormat:@"%.4g",fl];
    [self.textField setText:buf];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    Calculator *myCalc = [[Calculator alloc] init];
    [self setCalculator:myCalc];
    [self updateUI];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
