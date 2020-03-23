#import "AbbreviationMaker.h"

@implementation AbbreviationMaker
// Complete the abbreviation function below.
- (NSString *) abbreviationFromA:(NSString *)a toB:(NSString *)b {
    NSString *aString = [[NSString stringWithString:a] uppercaseString];
    int j = 0;
    for (int i = 0; i < [a length]; i++) {
        if ([[NSString stringWithFormat:@"%c", [aString characterAtIndex:i]] compare:
             [NSString stringWithFormat:@"%c", [b characterAtIndex:j]]] == NSOrderedSame) {
            if (++j == [b length]) {
                return @"YES";
            }
        }
    }
    return @"NO";
}
@end
