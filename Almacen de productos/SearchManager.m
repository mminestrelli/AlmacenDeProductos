//
//  SearchManager.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/11/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "SearchManager.h"
#import "ItemBuilder.h"
#import "SearchCommunicator.h"

@implementation SearchManager
- (void)fetchItemsWithInput:(NSString*)input
{
    //Parse and clean input
    [self.communicator searchWithText:input] ;
}

#pragma mark - SearchCommunicatorDelegate

- (void)receivedItemsJSON:(NSData *)objectNotation
{
    NSError *error = nil;
    NSArray *items = [ItemBuilder itemsFromJSON:objectNotation error:&error];
    
    if (error != nil) {
        [self.delegate fetchingItemsFailedWithError:error];
        
    } else {
        [self.delegate didReceiveItems:items];
    }
}

- (void)fetchingItemsFailedWithError:(NSError *)error
{
    [self.delegate fetchingItemsFailedWithError:error];
}
@end
