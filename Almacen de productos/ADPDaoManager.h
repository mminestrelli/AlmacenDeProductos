//
//  ADPDaoManager.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/21/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADPDaoMemory.h"
#import "ADPDaoFileSystem.h"
#import "ADPStoreHouse.h"

@interface ADPDaoManager : NSObject<ADPDaoDelegate>
+ (id)sharedManager;

@end
