//
//  PersistencyManager.h
//  Mapa.bg
//
//  Created by Mihail Velikov on 1/7/15.
//  Copyright (c) 2015 Mapa.bg. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Collection.h"

@interface PersistencyManager : NSObject
- (NSArray *) objects;
- (void) setObjectsFromArray: (NSArray*) array;
- (void) setObjectsFromDictionary: (NSDictionary*) dictionary;
- (void) clearObjects;
- (void) addObject: (id) object;

- (int) total;
- (int) perPage;
- (int) currentPage;
- (int) lastPage;
- (int) from;
- (int) to;

@end
