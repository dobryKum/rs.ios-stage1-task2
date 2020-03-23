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
        if ([class isEqual:[NSString class]]) {
            NSString *returnString = @"";
            for (NSObject *temp in vaultArray) {
                if([temp isKindOfClass:[NSString class]]) {
                    returnString = [returnString stringByAppendingString:(NSString*)temp];
                }
            }
            _blockC(returnString);
        } else if ([class isEqual:[NSNumber class]]) {
            int finalSum = 0;
            for(NSObject *temp in vaultArray) {
                if([temp isKindOfClass:[NSNumber class]]){
                    int newElement = [(NSNumber*)temp intValue];
                    finalSum += newElement;
                }
            }
            NSNumber *sum = [NSNumber numberWithInt:finalSum];
            _blockC(sum);
        } else if ([class isEqual:[NSDate class]]) {
            NSDate *date = [NSDate dateWithTimeIntervalSince1970:0];
            for (NSObject *temp in vaultArray) {
                if([temp isKindOfClass:[NSDate class]]) {
                    date = [date laterDate: (NSDate*)temp];
                }
            }
            NSDateFormatter *dateFormatter = [NSDateFormatter new];
            dateFormatter.dateFormat = @"dd.MM.yyy";
            NSString *returnDate = [dateFormatter stringFromDate:date];
            _blockC(returnDate);
        }
    } copy];
}

@end

