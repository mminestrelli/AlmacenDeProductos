//
//  SearchManager.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/11/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "SearchManagerDelegate.h"
#import "SearchCommunicatorDelegate.h"

@class SearchCommunicator;

@interface SearchManager : NSObject<SearchCommunicatorDelegate>
@property (strong, nonatomic) SearchCommunicator *communicator;
@property (weak, nonatomic) id<SearchManagerDelegate> delegate;

- (void)fetchItemsWithInput:(NSString*)input;
@end