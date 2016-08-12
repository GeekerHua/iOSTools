//
//  NSString+Base64.m
//  Base64
//
//  Created by base on 14/12/10.
//  Copyright (c) 2014年 base. All rights reserved.
//

#import "NSString+Base64.h"

@implementation NSString (Base64)

- (NSString *)base64encode {
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding];
    
    return [data base64EncodedStringWithOptions:0];
}

- (NSString *)base64decode {
    NSData *data = [[NSData alloc] initWithBase64EncodedString:self options:0];
    
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

- (NSString *)basicAuthString {
    return [@"BASIC " stringByAppendingString:self.base64encode];
}

@end
