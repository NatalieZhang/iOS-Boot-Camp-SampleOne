//
//  ViewController.m
//  TipCalculator
//
//  Created by Yuning Jin on 9/11/16.
//  Copyright © 2016 Yuning Jin. All rights reserved.
//

#import "TipViewController.h"

static NSString *const tipOne = @"tip1";
static NSString *const tipTwo = @"tip2";
static NSString *const tipThree = @"tip3";

@interface TipViewController () {
    float tip1;
    float tip2;
    float tip3;
}
@property (weak, nonatomic) IBOutlet UITextField *billTextfield;
@property (weak, nonatomic) IBOutlet UILabel *tipLabel;
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *tipControl;

@end


@implementation TipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getUserSettings];
    self.title = @"Tip Calculator";
    [self updateValues];
    self.billTextfield.clearButtonMode = UITextFieldViewModeWhileEditing;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self getUserSettings];
    [self updateValues];
}

- (void) getUserSettings {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    if ([userDef objectForKey:tipOne] == nil) {
        tip1 = 0.15;
        tip2 = 0.20;
        tip3 = 0.25;
    } else {
        tip1 = [userDef floatForKey:tipOne];
        tip2 = [userDef floatForKey:tipTwo];
        tip3 = [userDef floatForKey:tipThree];
    }
    
    [self.tipControl setTitle:[NSString stringWithFormat:@"%1.0f%%", (tip1 * 100)] forSegmentAtIndex:0];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%1.0f%%", (tip2 * 100)] forSegmentAtIndex:1];
    [self.tipControl setTitle:[NSString stringWithFormat:@"%1.0f%%", (tip3 * 100)] forSegmentAtIndex:2];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
    [self updateValues];
}

- (IBAction)onBillValueChanged:(UITextField *)sender {
    [self updateValues];
}


- (IBAction)onValueChanged:(UISegmentedControl *)sender
{
    [self updateValues];
}

- (void) updateValuesAnimated{
    [UIView animateWithDuration:2 animations:^{
        // This causes first view to fade in and second view to fade out
        [self updateValues];
    } completion:^(BOOL finished) {
        // Do something here when the animation finishes.
    }];
}

- (void) updateValues {
    //Get bill amount
    float billAmount = [self.billTextfield.text floatValue];
    //compute tip and total
    NSArray *tipValues = @[@(tip1), @(tip2), @(tip3)];
    float tipAmount = [tipValues[self.tipControl.selectedSegmentIndex] floatValue] * billAmount;
    float totalAmount = billAmount + tipAmount;
    //update UI
    self.tipLabel.text = [NSString stringWithFormat:@"$%0.2f", tipAmount];
    self.totalLabel.text =[NSString stringWithFormat:@"$%0.2f", totalAmount];
}

@end
