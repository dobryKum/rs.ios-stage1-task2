#import "Blocks.h"

@interface Blocks () {
    NSArray *vaultArray;
}

@end

@implementation Blocks

- (BlockA)blockA {
    return [^(NSArray *array) {
        vaultArray = array;
    } copy];
}

- (BlockB)blockB {
    return [^(Class class) {
        if ([class isKindOfClass:[NSString class]]) {
            
        } else if ([class isKindOfClass:[NSNumber class]]) {
            
        } else if ([class isKindOfClass:[NSDate class]]) {
            
        }
    } copy];
}

@end

