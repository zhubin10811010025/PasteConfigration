//
//  TableViewCellModel.m
//  PasteConfigration
//
//  Created by 花田半亩 on 2017/11/8.
//  Copyright © 2017年 朱彬. All rights reserved.
//

#import "TableViewCellModel.h"

@implementation TableViewCellModel
-(instancetype)initWithTitleString:(NSString *)titleString {
    if (self = [super init]) {
        self.titleString = titleString;
    }
    return self;
}
@end
