//
//  Collection.m
//  Mapa.bg
//
//  Created by Mihail Velikov on 1/7/15.
//  Copyright (c) 2015 Mapa.bg. All rights reserved.
//

#import "Collection.h"

@implementation Collection

- (id) init {
    if (self = [super init]) {
        _total = _perPage = _currentPage = _lastPage = _from = _to = 0;
        _data = [[NSMutableArray alloc] init];
    }
    return self;
}

- (id) initWithTotal: (int) total
             perPage: (int) perPage
         currentPage: (int) currentPage
            lastPage: (int) lastPage
                from: (int) from
                  to: (int) to
             andData: (NSMutableArray *)data {
    if (self = [super init]) {
        _total = total;
        _perPage = perPage;
        _currentPage = currentPage;
        _lastPage = lastPage;
        _from = from;
        _to = to;
        _data = data;
    }
    return self;
}

- (void) addObject: (id) object {
    [_data addObject:object];
}

- (NSUInteger) count {
    return [_data count];
}

- (id) objectAtIndex: (int) index {
    return [_data objectAtIndex:index];
}

- (void) removeObjectAtIndex:(int)index {
    [_data removeObjectAtIndex:index];
}

- (void) removeAllObjects {
    [_data removeAllObjects];
    _total = _perPage = _currentPage = _lastPage = _from = _to = 0;
}

@end
