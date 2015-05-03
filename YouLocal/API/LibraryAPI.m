//
//  LibraryAPI.m
//  YouLocal
//
//  Created by Mihail Velikov on 5/3/15.
//  Copyright (c) 2015 YouLoc.al. All rights reserved.
//

#import "LibraryAPI.h"

@implementation LibraryAPI


- (id) init
{
    self = [super init];
    
    if (self) {
        persistencyManager = [[PersistencyManager alloc] init];
        httpClient = [[HTTPClient alloc] init];
        httpClient.delegate = self;
    }
    return self;
}

+ (LibraryAPI*) sharedInstance
{
    // 1
    static LibraryAPI *_sharedInstance = nil;
    
    // 2
    static dispatch_once_t oncePredicate;
    
    // 3
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[LibraryAPI alloc] init];
    });
    return _sharedInstance;
}


- (NSArray *) getObjects {
    return [persistencyManager objects] ;
}

- (void) setObjectsFromArray: (NSArray*) array {
    [self clearObjects];
    [persistencyManager setObjectsFromArray:[array mutableCopy]];
}

- (void) addObject:(id)object {
    [persistencyManager addObject:object];
}

- (void) clearObjects {
    [persistencyManager clearObjects];
}

- (int) total {
    return [persistencyManager total];
}

- (int) perPage {
    return [persistencyManager perPage];
}

- (int) currentPage {
    return [persistencyManager currentPage];
}

- (int) lastPage {
    return [persistencyManager lastPage];
}

- (int) from {
    return [persistencyManager from];
}

- (int) to {
    return [persistencyManager to];
}

/**
 * This method is used in cases when system returns successful request
 * with 0 results
 */
- (void) setEmptyPersistencyManagerToStopPreloading {
    [persistencyManager setObjectsFromDictionary:@{
                                                   @"data" : [@[] mutableCopy],
                                                   @"total" : @0,
                                                   @"lastPage" : @0,
                                                   @"perPage" : @0,
                                                   @"currentPage": [NSString stringWithFormat:@"%d", 1],
                                                   @"from" : @0
                                                   }];
}

@end
