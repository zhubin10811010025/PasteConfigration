//
//  PasteViewController.m
//  PasteConfigration
//
//  Created by 花田半亩 on 2017/11/8.
//  Copyright © 2017年 朱彬. All rights reserved.
//

#import "PasteViewController.h"
#import "MenuManager.h"
#import "TableViewCellModel.h"

@interface PasteViewController ()
@property (nonatomic,strong) UITextField *targetTextField;
@property (nonatomic,strong) MenuManager *menuManager;
@end

@implementation PasteViewController

#pragma mark 懒加载

-(MenuManager *)menuManager {
    if (!_menuManager) {
        _menuManager = [[MenuManager alloc]initWithView:self.view];
    }
    return _menuManager;
}

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
    
    [self.view addGestureRecognizer:self.menuManager.longPressGestureRecognizer];
    [self.view addGestureRecognizer:self.menuManager.tapGestureRecognizer];
    
    [self.view addSubview:self.targetTextField];
    
    UIPasteConfiguration *pasteConfiguration = [[UIPasteConfiguration alloc]initWithAcceptableTypeIdentifiers:@[CELL_TYPE]];
    self.pasteConfiguration = pasteConfiguration;
}


-(void)pasteItemProviders:(NSArray<NSItemProvider *> *)itemProviders {
    for (NSItemProvider *item in itemProviders) {
        [item loadObjectOfClass:TableViewCellModel.class completionHandler:^(id<NSItemProviderReading>  _Nullable object, NSError * _Nullable error) {
            if (object) {
                TableViewCellModel *model = (TableViewCellModel *)object;
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.targetTextField.text = [NSString stringWithFormat:@"复制的内容:%@",model.titleString];
                });
            }
        }];
    }
}

@end
