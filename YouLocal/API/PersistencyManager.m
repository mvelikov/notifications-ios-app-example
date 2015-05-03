//
//  PersistencyManager.m
//  Mapa.bg
//
//  Created by Mihail Velikov on 1/7/15.
//  Copyright (c) 2015 Mapa.bg. All rights reserved.
//

#import "PersistencyManager.h"

@interface PersistencyManager () {
    Collection *collection;
}

@end
@implementation PersistencyManager

- (id) init {
    self = [super init];
    
    if (self) {
        collection = [[Collection alloc] init];
    }
    
    return self;
}

- (NSArray *) objects {
    return [collection data];
}

- (void) setObjectsFromArray: (NSArray*) array {
    [self clearObjects];
    [collection setData:[array mutableCopy]];
}

- (void) setObjectsFromDictionary: (NSDictionary*) dictionary {
    [self clearObjects];
    [collection setData:[dictionary valueForKey:@"data"]];
    [collection setTotal:[[dictionary valueForKey:@"total"] intValue]];
    [collection setPerPage:[[dictionary valueForKey:@"perPage"] intValue]];
    [collection setFrom:[[dictionary valueForKey:@"from"] intValue]];
    [collection setLastPage:[[dictionary valueForKey:@"lastPage"] intValue]];
    [collection setTo:[[dictionary valueForKey:@"to"] intValue]];
    [collection setCurrentPage:[[dictionary valueForKey:@"currentPage"] intValue]];
}

- (void) addObject:(id)object {
    [collection addObject:object];
}

- (void) clearObjects {
    [collection removeAllObjects];
}

- (int) total {
    return [collection total];
}

- (int) perPage {
    return [collection perPage];
}

- (int) currentPage {
    return [collection currentPage];
}

- (int) lastPage {
    return [collection lastPage];
}

- (int) from {
    return [collection from];
}

- (int) to {
    return [collection to];
}


@end
