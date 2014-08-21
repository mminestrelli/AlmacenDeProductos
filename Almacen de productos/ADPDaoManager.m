//
//  ADPDaoManager.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/21/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ADPDaoManager.h"
@interface ADPDaoManager()
@property (nonatomic) BOOL initializedFromCache;
@property (nonatomic,strong) ADPDaoMemory * daoMemory;
@property (nonatomic,strong) ADPDaoFileSystem * daoFileSystem;
@end

@implementation ADPDaoManager
#pragma mark Singleton Methods

+ (id)sharedManager {
    static ADPDaoManager *sharedDaoManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedDaoManager = [[self alloc] init];
    });
    return sharedDaoManager;
}

-(id) init{
    if([super init]){
        self.initializedFromCache=NO;
        self.daoFileSystem=[[ADPDaoFileSystem alloc]init];
        self.daoMemory=[[ADPDaoMemory alloc]init];
    }
    return self;
}

/*Returns products in memory. If cache from file was not loaded it loads it*/
-(NSMutableArray*) getProducts{
    //ahora o en el init? debería ser async?
    if(!self.initializedFromCache){
        [self.daoMemory synchronizeWithProducts:[self.daoFileSystem getProducts] ];
        self.initializedFromCache=YES;
    }
    return [self.daoMemory getProducts];
}
/*Add product in memory and synchronize cache*/
-(void)addProduct:(ADPProduct*) product{
    [self.daoMemory addProduct:product];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            [self.daoFileSystem syncronizeCache:[self.daoMemory getProducts]];
        });
}

/*Delete product from memory and synchronize cache*/
-(void)deleteProduct:(ADPProduct*)product{
    [self.daoMemory deleteProduct:product];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self.daoFileSystem syncronizeCache:[self.daoMemory getProducts]];
    });
}
@end
