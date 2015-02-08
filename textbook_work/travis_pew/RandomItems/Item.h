//
//  Item.h
//  RandomItems
//
//  Created by Travis Pew on 2/2/15.
//  Copyright (c) 2015 Travis Pew. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Item : NSObject
{
    NSString *_itemName;
    NSString *_serialNumber;
    int _valueInDollars;
    NSDate *_dateCreated;
    
    Item *_containedItem;
    Item *_container;
}

+ (instancetype)randomItem;

// Designated initializer for Item
- (instancetype)initWithItemName:(NSString *)name
                  valueInDollars:(int)value
                    serialNumber:(NSString *)sNumber;
- (instancetype)initWithItemName:(NSString *)name;

- (void)setContainedItem:(Item *)item;
- (Item *)containedItem;

- (void)setContainer:(Item *)item;
- (Item *)container;

- (void)setItemName:(NSString *)str;
- (NSString *)itemName;

- (void)setSerialNumber:(NSString *)str;
- (NSString *)serialNumber;

- (void)setValueInDollars:(int)v;
- (int)valueInDollars;


- (NSDate *)dateCreated;


@end
