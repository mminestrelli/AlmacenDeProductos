//
//  ADPDaoMemory.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/21/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ADPDaoMemory.h"
#import "ADPStoreHouse.h"
@interface ADPDaoMemory()
@property (nonatomic) ADPStoreHouse* storeHouse;
@end

@implementation ADPDaoMemory

-(id)init{
    if([super init]){
        self.storeHouse=[ADPStoreHouse sharedStoreHouse];
    }
    return self;
}
/*Add product locally*/
-(void)addProduct:(ADPProduct*) product{
[self.storeHouse addProduct:product];
}

/*Delete products from memory*/
-(void)deleteProduct:(ADPProduct*)product{
    [self.storeHouse deleteProduct:product];
}

/*Gets products from memory from the singleton ADPStoreHouse*/
-(NSMutableArray*) getProducts{
    return self.storeHouse.products;
}

/*Loads memory with an array of products */
-(void)synchronizeWithProducts:(NSMutableArray*)products{
    self.storeHouse.products=products;
}
@end
