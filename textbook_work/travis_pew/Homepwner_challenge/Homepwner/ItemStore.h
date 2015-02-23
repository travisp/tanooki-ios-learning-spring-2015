//
//  ItemStore.h
//  Homepwner
//
//  Created by Travis Pew on 2/22/15.
//  Copyright (c) 2015 Travis Pew. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Item;

@interface ItemStore : NSObject

@property (nonatomic, readonly, copy) NSArray *allItems;
@property (nonatomic, readonly, copy) NSArray *expensiveItems;
@property (nonatomic, readonly, copy) NSArray *cheapItems;

// Notice that this is a class method and prefixed with a + instead of a -
+ (instancetype)sharedStore;
- (Item *)createItem;

@end
