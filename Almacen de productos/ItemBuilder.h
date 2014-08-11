//
//  GroupBuilder.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/11/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemBuilder : NSObject

+ (NSArray *)itemsFromJSON:(NSData *)objectNotation error:(NSError **)error;

@end