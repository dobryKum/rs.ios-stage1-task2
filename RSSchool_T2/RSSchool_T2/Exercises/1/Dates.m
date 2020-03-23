#import "Dates.h"

@implementation Dates

- (NSString *)textForDay:(NSString *)day month:(NSString *)month year:(NSString *)year {
    
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    
    dateComponents.day = [day intValue];
    dateComponents.month = [month intValue];
    dateComponents.year = [year intValue];
    
    NSCalendar* gregorianCalendar = [NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    
    if ([dateComponents isValidDateInCalendar:gregorianCalendar]) {
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
        dateFormatter.dateFormat = @"dd MMMM, EEEE";
        NSDate *date = [gregorianCalendar dateFromComponents:dateComponents];
        NSString *returnDate = [dateFormatter stringFromDate:date];
        return returnDate;
    } else {
        return @"Такого дня не существует";
    }
}

@end
