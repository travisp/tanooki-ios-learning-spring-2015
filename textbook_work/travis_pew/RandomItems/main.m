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
        
        for (int i = 0; i < 10; i++) {
            Item *item = [Item randomItem];
            [items addObject:item];
        }
        
        for (Item *item in items) {
            NSLog(@"%@", item);
        }
        
        items = nil;
    }
    return 0;
}

