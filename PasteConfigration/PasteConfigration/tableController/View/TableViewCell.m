//
//  TableViewCell.m
//  PasteConfigration
//
//  Created by 花田半亩 on 2017/11/8.
//  Copyright © 2017年 朱彬. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
-(void)setModel:(TableViewCellModel *)model {
    _model = model;
    self.textLabel.text = model.titleString;
}
@end
