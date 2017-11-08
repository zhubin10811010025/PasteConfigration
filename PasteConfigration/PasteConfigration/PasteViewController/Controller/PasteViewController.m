//
//  PasteViewController.m
//  PasteConfigration
//
//  Created by 花田半亩 on 2017/11/8.
//  Copyright © 2017年 朱彬. All rights reserved.
//

#import "PasteViewController.h"

@interface PasteViewController ()
@property (nonatomic,strong) UITextField *targetTextField;
@end

@implementation PasteViewController

-(UITextField *)targetTextField {
    if (!_targetTextField) {
        _targetTextField = [[UITextField alloc]initWithFrame:CGRectMake(10, 100, self.view.frame.size.width - 20, 30)];
        _targetTextField.borderStyle = UITextBorderStyleRoundedRect;
        
        [_targetTextField addTarget:self action:@selector(targetTextFieldAction:) forControlEvents:UIControlEventEditingChanged];
        
        [_targetTextField becomeFirstResponder];
    }
    return _targetTextField;
}

- (void)targetTextFieldAction:(UITextField *)textField {
    NSLog(@"%@",textField.text);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.targetTextField];
}


@end
