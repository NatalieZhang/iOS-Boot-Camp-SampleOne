//
//  ViewController.m
//  TipCalculator
//
//  Created by Yuning Jin on 9/11/16.
//  Copyright © 2016 Yuning Jin. All rights reserved.
//

#import "TipViewController.h"

@interface TipViewController ()
@property (weak, nonatomic) IBOutlet UITextField *billTextfield;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end

@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Tip Calculator";
    [self updateValues];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onValueChanged:(UISegmentedControl *)sender
{
    [self updateValues];
}

- (void) updateValues {
    //Get bill amount
    float billAmount = [self.billTextfield.text floatValue];
    //compute tip and total
    NSArray *tipValues = @[@(0.15), @(0.20), @(0.25)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    //update UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text =[NSString stringWithFormat:@"$%0.2f", totalAmount];
}

@end
