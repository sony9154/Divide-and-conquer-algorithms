//
//  main.m
//  ComplexSorting
//
//  Created by Peter Yo on 8月/9/16.
//  Copyright © 2016年 Peter Hsu. All rights reserved.
//

#import <Foundation/Foundation.h>

NSDictionary<NSNumber *, NSArray *>* divideNumbers(NSArray * targets) {
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    for (NSNumber *target in targets) {
        int index = target.intValue % 10;
        if (!dic[@(index)]) {  // value如果沒有值為真,執行以下
            dic[@(index)] = [NSMutableArray array]; // 就初始化value(因為value是個可變陣列容器)
        }
        [dic[@(index)] addObject:target];
    }
    return dic;
}

NSArray * sortFromLarge(NSDictionary * targets) {
    NSMutableArray *result = [NSMutableArray array];
    for (int i = 9; i >= 0; i--) {
        if (targets[@(i)]) {
            [result addObject:targets[@(i)]];//為何不是array形式 @[29,17,37,66,86,36,81] ?
        }
    }
    return result;
}

NSArray * sortFromSmall(NSArray * targets) {
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:nil ascending:YES];
    NSArray *sortedArray = [targets sortedArrayUsingDescriptors:@[sortDescriptor]];
    return sortedArray;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSDictionary *dic = divideNumbers(@[@(17), @(29), @(66), @(86), @(36), @(37), @(81)]);
        NSLog(@"%@", dic);
        NSArray *targetGroup = sortFromLarge(dic);
        NSLog(@"%@", targetGroup);
        NSMutableArray *result = [NSMutableArray array];
        for (NSArray *target in targetGroup) {
            [result addObjectsFromArray:sortFromSmall(target)];
        }
        NSLog(@"%@", result);
    }
    return 0;
}
