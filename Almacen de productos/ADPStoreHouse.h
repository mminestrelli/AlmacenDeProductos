//
//  ADPStoreHouse.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/22/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADPProduct.h"

@interface ADPStoreHouse : NSObject
@property (nonatomic,strong) NSMutableArray * products;

-(void) deleteProduct:(ADPProduct*) prod;
-(void) addProduct:(ADPProduct*) prod;
-(NSInteger) amountOfProductsStocked;
-(void)loadFromDisk;
-(void)saveToDiskAddingProduct:(ADPProduct*) product;

+ (id)sharedStoreHouseWithProduct:(ADPProduct*) prod;
+ (id)sharedStoreHouse;

@end
