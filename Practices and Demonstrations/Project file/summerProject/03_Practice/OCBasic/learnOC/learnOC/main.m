//
//  main.m
//  learnOC
//
//  Created by Wayne on 2021/7/15.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSString * str = @"123";
        
        NSString * str2 = [str stringByPaddingToLength:10 withString:@"abc" startingAtIndex:2];
        
        NSLog(@"%@",str2);
        
    }
    return 0;
}
