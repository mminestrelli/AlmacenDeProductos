//
//  Almacen_de_productosTests.m
//  Almacen de productosTests
//
//  Created by Mauricio Minestrelli on 7/22/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "ADPProduct.h"
#import "ADPStoreHouse.h"
#import "ADPDaoManager.h"

@interface Almacen_de_productosTests : XCTestCase
@property (nonatomic,strong) ADPStoreHouse * storeHouse;
@end

@implementation Almacen_de_productosTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.storeHouse=[[ADPStoreHouse alloc]init];
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}


-(void) testAddingAndDeleting
{
    ADPProduct * prod1= [[ADPProduct alloc]initWithTitle:@"Titulo" code:23 subtitle:@"Subtitulo"description:@"Ipod Nano 32 GB"price:2500 andImage:[[UIImage alloc]init]];
    ADPProduct * prod2= [[ADPProduct alloc]initWithTitle:@"Titulo" code:24 subtitle:@"Subtitulo"description:@"Ipod Nano 16 GB"price:2200 andImage:[[UIImage alloc]init]];
    XCTAssertEqual(0, [self.storeHouse amountOfProductsStocked], "At the beginning the amount of products must be zero");
    [self.storeHouse addProduct:prod1];
    [self.storeHouse addProduct:prod2];
    XCTAssertEqual(2, [self.storeHouse amountOfProductsStocked], "In the end the amount of products must be two");
    [self.storeHouse deleteProduct:prod1];
    XCTAssertEqual(1, [self.storeHouse amountOfProductsStocked], "After deleting the amount of products must be 1");
    //NSMutableArray * aux= [self.storeHouse getProducts];
}

-(void)testSingletonUniqueInstance{
    id dao1=[ADPDaoManager sharedManager];
    id dao2=[ADPDaoManager sharedManager];
    XCTAssertEqualObjects(dao1, dao2, "An instance of a singleton created more than once should be the same");
    
    id storeHouse1=[ADPStoreHouse sharedStoreHouse];
    id storeHouse2=[ADPStoreHouse sharedStoreHouse];
    XCTAssertEqualObjects(storeHouse1, storeHouse2, "An instance of a singleton created more than once should be the same");
    
    ADPProduct * prod1= [[ADPProduct alloc]initWithTitle:@"Ipod Nano" code:24 subtitle:@"Subtitulo"description:@"Ipod Nano 32 GB"price:2500 andImage:[[UIImage alloc]init]];
    [dao1 getProducts];
    [dao1 addProduct:prod1];
    NSMutableArray * prods=[dao1 getProducts];
    XCTAssertTrue([prods containsObject:prod1],"El producto debería estar en memoria despues de agregarlo");
    [dao1 deleteProduct:prod1];
}

@end
