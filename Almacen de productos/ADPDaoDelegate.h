//
//  ADPDaoDelegate.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/21/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADPProduct.h"

@protocol ADPDaoDelegate <NSObject>
-(NSMutableArray*) getProducts;
@optional
-(void)addProduct:(ADPProduct*) product;
-(void)deleteProduct:(ADPProduct*)product;


@end
