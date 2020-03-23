#import "TimeConverter.h"

@interface TimeConverter ()
- (NSString*)wordFromNumber:(NSNumber*)number;
@end

@implementation TimeConverter
// Complete the following function
- (NSString*)convertFromHours:(NSString*)hours minutes:(NSString*)minutes {
    NSNumber *hoursNumber = [NSNumber numberWithInt:[hours intValue]];
    NSNumber *minutesNumber = [NSNumber numberWithInt:[minutes intValue]];
    
    if ([hoursNumber intValue] > 23 || [hoursNumber intValue] < 0 || [minutesNumber intValue] > 59 || [minutesNumber intValue] < 0) {
        return @"";
    }
    
    if ([minutesNumber intValue] == 0) {
        return [NSString stringWithFormat:@"%@ o' clock", [self wordFromNumber:hoursNumber]];
    } else if ([minutesNumber intValue] >= 1 && [minutesNumber intValue] <= 30) {
        if ([minutesNumber intValue] == 15 || [minutesNumber intValue] == 30) {
            return [NSString stringWithFormat:@"%@ past %@", [self wordFromNumber:minutesNumber],[self wordFromNumber:hoursNumber]];
        } else {
            return [NSString stringWithFormat:@"%@ minutes past %@", [self wordFromNumber:minutesNumber],[self wordFromNumber:hoursNumber]];
        }
    } else {
        NSNumber *newMinutes = [NSNumber numberWithInt:60 - [minutesNumber intValue]];
        NSNumber *newHours = [NSNumber numberWithInt:[hoursNumber intValue] + 1];
        if ([newMinutes intValue] == 15) {
            return [NSString stringWithFormat:@"quarter to %@" ,[self wordFromNumber:newHours]];
        } else {
            return [NSString stringWithFormat:@"%@ minutes to %@", [self wordFromNumber:newMinutes],[self wordFromNumber:newHours]];
        }
    }
    return @"";
}

- (NSString*)wordFromNumber:(NSNumber*)number {
    NSDictionary *words = @{
        @1:@"one",
        @2:@"two",
        @3:@"three",
        @4:@"four",
        @5:@"five",
        @6:@"six",
        @7:@"seven",
        @8:@"eight",
        @9:@"nine",
        @10:@"ten",
        @11:@"eleven",
        @12:@"twelve",
        @13:@"thirteen",
        @14:@"fourteen",
        @15:@"quater",
        @16:@"sixteen",
        @17:@"seventeen",
        @18:@"eighteen",
        @19:@"nineteen",
        @20:@"twenty",
        @30:@"thirteen",
        @40:@"fourty",
        @50:@"fifty"
    };
    
    if ([number intValue] < 21) {
        return words[number];
    } else if ([number intValue] > 20) {
        if ([number isEqualToNumber:@30]) {
            return @"half";
        } else {
            NSNumber *lastDigit = [NSNumber numberWithInt:[number intValue] % 10];
            NSNumber *firstDigit = [NSNumber numberWithInt:[number intValue] - ([number intValue] % 10)];
            return [NSString stringWithFormat:@"%@ %@",words[firstDigit],words[lastDigit]];
        }
    }
    return @"";
}
@end
