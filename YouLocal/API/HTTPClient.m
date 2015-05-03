//
//  HTTPClient.m
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import "HTTPClient.h"

@implementation HTTPClient

- (id) init {
    if (self = [super init]) {
        manager = [AFHTTPRequestOperationManager manager];
        [manager.requestSerializer setTimeoutInterval:10];
    }
    
    return self;
}

@end
