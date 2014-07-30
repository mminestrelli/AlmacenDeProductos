//
//  PriceViewController.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADPProduct.h"
#import "ProductImageViewController.h"
#import "AbstractMasterViewController.h"

@interface PriceViewController :AbstractMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:(ADPProduct*)productToFill;

@property (weak, nonatomic) IBOutlet UITextField *priceTextField;

@end
