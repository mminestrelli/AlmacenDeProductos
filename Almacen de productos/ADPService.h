//
//  ADPService.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/7/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADPProduct.h"
@interface ADPService : NSObject
-(ADPProduct*)getProd;
- (id)startRequestWithProduct:(ADPProduct*) prod;
-(NSInteger) getStatus;
@end
