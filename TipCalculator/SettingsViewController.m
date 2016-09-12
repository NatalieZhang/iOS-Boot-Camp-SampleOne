//
//  SettingsViewController.m
//  TipCalculator
//
//  Created by Yuning Jin on 9/11/16.
//  Copyright © 2016 Yuning Jin. All rights reserved.
//

#import "SettingsViewController.h"

static NSString *const tipOne = @"tip1";
static NSString *const tipTwo = @"tip2";
static NSString *const tipThree = @"tip3";

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tip1;
@property (weak, nonatomic) IBOutlet UITextField *tip2;
@property (weak, nonatomic) IBOutlet UITextField *tip3;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Settings";
    [self loadUserDefaults];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self loadUserDefaults];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self saveTipSettings];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) loadUserDefaults {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    if ([userDef objectForKey:tipOne] == nil) {
        self.tip1.text = @"0.15";
        self.tip2.text = @"0.20";
        self.tip3.text = @"0.25";
    } else {
        self.tip1.text = [NSString stringWithFormat:@"%0.2f", [userDef floatForKey:tipOne]];
        self.tip2.text = [NSString stringWithFormat:@"%0.2f", [userDef floatForKey:tipTwo]];
        self.tip3.text = [NSString stringWithFormat:@"%0.2f", [userDef floatForKey:tipThree]];
    }
}

- (IBAction)tip1Changed:(UITextField *)sender {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setFloat:[self.tip1.text floatValue] forKey:tipOne];
    [userDef synchronize];
}
- (IBAction)tip2Changed:(UITextField *)sender {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setFloat:[self.tip2.text floatValue] forKey:tipTwo];
    [userDef synchronize];
}
- (IBAction)tip3Changed:(UITextField *)sender {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setFloat:[self.tip3.text floatValue] forKey:tipThree];
    [userDef synchronize];
}

- (void) saveTipSettings {
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [userDef setFloat:[self.tip1.text floatValue] forKey:tipOne];
    [userDef setFloat:[self.tip2.text floatValue] forKey:tipTwo];
    [userDef setFloat:[self.tip3.text floatValue] forKey:tipThree];
    [userDef synchronize];
}

- (IBAction)resetToDefaultTips:(UIButton *)sender {
    self.tip1.text = @"0.15";
    self.tip2.text = @"0.20";
    self.tip3.text = @"0.25";
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    [self saveTipSettings];
}

- (IBAction)onTap:(UITapGestureRecognizer *)sender {
    [self.view endEditing:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
