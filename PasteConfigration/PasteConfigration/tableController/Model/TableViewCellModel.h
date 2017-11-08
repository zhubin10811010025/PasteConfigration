//
//  TableViewCellModel.h
//  PasteConfigration
//
//  Created by 花田半亩 on 2017/11/8.
//  Copyright © 2017年 朱彬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewCellModel : NSObject<NSCoding,NSItemProviderReading>
@property (nonatomic,copy) NSString *titleString;
- (instancetype)initWithTitleString:(NSString *)titleString;
@end
