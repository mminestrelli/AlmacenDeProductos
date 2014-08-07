//
//  CongratsViewController.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/6/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADPProduct.h"
#import "ADPService.h"

@interface CongratsViewController : UIViewController
- (id)initWithServiceResponse:(ADPService*)service;
@end
