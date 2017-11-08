//
//  MenuManager.h
//  PasteConfigration
//
//  Created by 花田半亩 on 2017/11/8.
//  Copyright © 2017年 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MenuManager : NSObject
- (instancetype)initWithView:(UIView *)view;
@property (nonatomic,strong) UILongPressGestureRecognizer *longPressGestureRecognizer;
@property (nonatomic,strong) UITapGestureRecognizer *tapGestureRecognizer;
@end
