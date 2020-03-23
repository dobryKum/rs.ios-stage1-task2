#import "FibonacciResolver.h"

@implementation FibonacciResolver
- (NSArray*)productFibonacciSequenceFor:(NSNumber*)number {
    NSNumber *first = @0;
    NSNumber *second = @1;
    while ([number intValue] >= [first intValue] * [second intValue]) {
        if ([first intValue] * [second intValue] == [number intValue]) {
            return @[first, second, @1];
        }
        NSNumber *new = [NSNumber numberWithInt:[first intValue]+[second intValue]];
        first = second;
        second = new;
    }
    return @[first, second, @0];
}
@end
