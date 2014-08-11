//
//  Communicator.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/11/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol SearchCommunicatorDelegate;

@interface SearchCommunicator : NSObject
@property (weak, nonatomic) id<SearchCommunicatorDelegate> delegate;

- (void)searchWithText:(NSString*)input;
@end