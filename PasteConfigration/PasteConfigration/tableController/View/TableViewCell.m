//
//  TableViewCell.m
//  PasteConfigration
//
//  Created by 花田半亩 on 2017/11/8.
//  Copyright © 2017年 朱彬. All rights reserved.
//

#import "TableViewCell.h"
#import "MenuManager.h"

@interface TableViewCell()
@property (nonatomic,strong) MenuManager *menuManager;
@end

@implementation TableViewCell

#pragma mark 懒加载初始化
-(MenuManager *)menuManager {
    if (!_menuManager) {
        _menuManager = [[MenuManager alloc]initWithView:self];
    }
    return _menuManager;
}



-(void)setModel:(TableViewCellModel *)model {
    _model = model;
    self.textLabel.text = model.titleString;
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self addGestureRecognizer:self.menuManager.longPressGestureRecognizer];
        [self addGestureRecognizer:self.menuManager.tapGestureRecognizer];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        [self addGestureRecognizer:self.menuManager.longPressGestureRecognizer];
        [self addGestureRecognizer:self.menuManager.tapGestureRecognizer];
    }
    return self;
}

-(BOOL)canBecomeFirstResponder {
    return YES;
}

-(BOOL)canPerformAction:(SEL)action withSender:(id)sender {
    return action == @selector(copy:);
}

- (void)copy:(id)sender {
    if (self.model == nil) {
        return;
    }
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:self.model];
    
    [[UIPasteboard generalPasteboard] setData:data forPasteboardType:CELL_TYPE];
}

@end
