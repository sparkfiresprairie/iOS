//
//  SearchViewController.m
//  Storm
//
//  Created by Xingyuan Wang on 7/5/17.
//  Copyright © 2017 Spark. All rights reserved.
//

#import "SearchViewController.h"

const static CGFloat kPadding = 20;

@interface SearchViewController () <UITextFieldDelegate>

@end

@implementation SearchViewController
{
    UITextField *_textField;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _textField = [[UITextField alloc] init];
        _textField.delegate = self;
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        _textField.backgroundColor = [UIColor whiteColor];
        _textField.placeholder = @"Click me";
        _textField.returnKeyType = UIReturnKeySearch;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_textField];
}

- (void)viewWillLayoutSubviews
{
    _textField.frame = CGRectMake(kPadding, kPadding, self.view.bounds.size.width - 2 * kPadding, 50);
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if ([textField.text isEqualToString:@""]) {
        return NO;
    }
    [textField resignFirstResponder];
    return YES;
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
