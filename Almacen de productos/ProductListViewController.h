//
//  ProductListViewController.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/25/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADPStoreHouse.h"
#import "ADPProduct.h"
#import "ProductDetailViewController.h"

@interface ProductListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;
@end
