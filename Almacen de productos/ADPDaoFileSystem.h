//
//  ADPDaoFileSystem.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/21/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADPDaoDelegate.h"
@interface ADPDaoFileSystem : NSObject<ADPDaoDelegate>

-(void)syncronizeCache:(NSMutableArray*) products;
@end
