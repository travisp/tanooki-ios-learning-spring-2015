//
//  main.m
//  RandomItems
//
//  Created by Travis Pew on 2/2/15.
//  Copyright (c) 2015 Travis Pew. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Item.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Create a mutable array object, store its address in items variable
        NSMutableArray *items = [[NSMutableArray alloc] init];
  
        Item *backpack = [[Item alloc] initWithItemName:@"BackPack"];
        [items addObject:backpack];
        
        Item *calculator = [[Item alloc] initWithItemName:@"Calculator"];
        [items addObject:calculator];
        
        backpack.containedItem = calculator;
        
        backpack = nil;
        calculator = nil;
        
        for (Item *item in items) {
            NSLog(@"%@", item);
        }
        
        NSLog(@"Setting items to nil...");
        items = nil;
    }
    return 0;
}

