#import "NSString+Transform.h"

@implementation NSString (Transform)

-(NSString*)transform {
    NSMutableArray *array = [[self componentsSeparatedByString:@" "] mutableCopy];
    NSCharacterSet *vowels = [NSCharacterSet characterSetWithCharactersInString:@"aAeEyYuUiIoO"];
    
    for (NSMutableString *word in array) {
        
    }
    return self;
}

@end
