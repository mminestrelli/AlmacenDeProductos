//
//  ADPStoreHouse.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/22/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ADPStoreHouse.h"
#import "ADPProduct.h"

@interface ADPStoreHouse()


@property (nonatomic) NSInteger currentId;
@end

@implementation ADPStoreHouse

+ (id)sharedStoreHouse {
    static ADPStoreHouse *sharedStoreHouse = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStoreHouse = [[self alloc] init];
    });
    return sharedStoreHouse;
}

+ (id)sharedStoreHouseWithProduct:(ADPProduct*) prod {
    static ADPStoreHouse *sharedStoreHouse = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedStoreHouse = [[self alloc] initWithProduct:prod];
    });
    return sharedStoreHouse;
}

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

-(NSInteger) amountOfProductsStocked{
    return [self.products count];
}
#pragma mark- Saving to disk

-(void)saveToDiskAddingProduct:(ADPProduct*) product{
    //Save to file. should be asyncronous and notify with a delegate completition
    //[self addProduct:product];
    [NSKeyedArchiver archiveRootObject:self.products toFile:[self getCacheFilePath]];
}

-(void)loadFromDisk{
    //Load products from cache file
    NSMutableArray * prodsFromFile=[NSKeyedUnarchiver unarchiveObjectWithFile:[self getCacheFilePath]];
    if(prodsFromFile!=nil){
        self.products = prodsFromFile;
    }
}

-(NSString*) getCacheFilePath{
    /*Library folder, where you store configuration files and writable databases that you also want to keep around, but you don't want the user to be able to mess with through iTunes*/
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSString *file = [libraryDirectory stringByAppendingPathComponent:@"cache.txt"];
    return file;
}
@end
