//
//  SearchItem.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/11/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SearchItem : NSObject
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * subtitle;
@property (nonatomic) NSNumber * price;
@property (nonatomic,copy) NSString * thumbnail;
@property (nonatomic,copy) NSString * permalink;
@property (nonatomic) NSInteger sold_quantity;
@end
