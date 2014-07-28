//
//  ADPStoreHouse.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/22/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ADPStoreHouse.h"
#import "ADPProduct.h"

@interface ADPStoreHouse(){
    NSMutableArray* _products;
    NSInteger _currentId;
}

@property (nonatomic,strong) NSMutableArray * products;
@property (nonatomic) NSInteger currentId;
@end

@implementation ADPStoreHouse

-(id)init{
    if([super init]){
        self.currentId=0;
        self.products= [[NSMutableArray alloc]init];
    }
    return self;
}

-(id) initWithProduct:(ADPProduct*) prod{
    if([super init]){
        self.currentId=0;
        self.products= [[NSMutableArray alloc]init];
        [self.products addObject:prod];
    }
    return self;
}

-(void) addProduct:(ADPProduct*) prod{
    [self.products addObject:prod];
    self.currentId ++;
}

-(void) deleteProduct:(ADPProduct*) prod{
    NSInteger i=0;
    BOOL found= NO;
    //[self.products removeObjectIdenticalTo:prod]
    for (i=0; i<[self.products count] || !found; i++) {
        if ([prod getIdentification]==[ [self.products objectAtIndex:i] getIdentification]) {
            found=YES;
            [self.products removeObjectAtIndex:i];
        }
    }
}
-(NSMutableArray*) getProducts{
    return self.products;
};

-(NSInteger) amountOfProductsStocked{
    return [self.products count];
}
@end
