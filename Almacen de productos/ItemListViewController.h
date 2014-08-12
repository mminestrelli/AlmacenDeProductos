//
//  ItemListViewController.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/11/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"
@interface ItemListViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    MBProgressHUD *HUD;
}
- (id)initWithInput:(NSString*)input;
@end
