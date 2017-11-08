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

-(void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.titleString forKey:@"titleString"];
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.titleString = [aDecoder decodeObjectForKey:@"titleString"];
    }
    return self;
}

+ (instancetype)objectWithItemProviderData:(NSData *)data typeIdentifier:(NSString *)typeIdentifier error:(NSError * _Nullable __autoreleasing *)outError {
    if ([typeIdentifier isEqualToString:CELL_TYPE]) {
        TableViewCellModel *model = [NSKeyedUnarchiver unarchiveObjectWithData:data];
        return [[self alloc]initWithTitleString:model.titleString];
    }
    return nil;
}

+(NSArray<NSString *> *)readableTypeIdentifiersForItemProvider {
    return @[CELL_TYPE];
}

@end
