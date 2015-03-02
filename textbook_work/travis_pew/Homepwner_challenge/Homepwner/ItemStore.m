//
//  ItemStore.m
//  Homepwner
//
//  Created by Travis Pew on 2/22/15.
//  Copyright (c) 2015 Travis Pew. All rights reserved.
//

#import "ItemStore.h"
#import "Item.h"

@interface ItemStore ()

@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation ItemStore

+ (instancetype)sharedStore
{
    static ItemStore *sharedStore;
    
    // Do I need to create a sharedStore?
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}

// If a programmer calls [[ItemStore alloc] init], let him
// know the error of his ways
- (instancetype)init
{
    [NSException raise:@"Singleton"
                format:@"Use +[BNRItemStore sharedStore]"];
    return nil;
}

// Here is a real (secret) initializer
- (instancetype)initPrivate
{
    self = [super init];
    if (self) {
        _privateItems = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (NSArray *)allItems
{
    return [self.privateItems copy];
}

- (Item *)createItem
{
    Item *item = [Item randomItem];
    
    [self.privateItems addObject:item];
    
    return item;
}

@end
