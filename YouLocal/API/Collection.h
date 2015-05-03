//
//  Collection.h
//  Mapa.bg
//
//  Created by Mihail Velikov on 1/7/15.
//  Copyright (c) 2015 Mapa.bg. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Collection : NSObject

@property (nonatomic) int total, perPage, currentPage, lastPage, from, to;
@property (strong, nonatomic) NSMutableArray *data;

- (id) init;
- (id) initWithTotal: (int) total
             perPage: (int) perPage
         currentPage: (int) currentPage
            lastPage: (int) lastPage
                from: (int) from
                  to: (int) to
             andData: (NSMutableArray *) data;
- (void) addObject: (id) object;
- (NSUInteger) count;
- (id) objectAtIndex: (int) index;
- (void) removeObjectAtIndex: (int) index;
- (void) removeAllObjects;

@end
