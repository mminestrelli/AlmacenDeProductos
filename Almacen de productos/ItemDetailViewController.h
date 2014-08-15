//
//  ItemDetailViewController.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/14/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SearchItem.h"

@interface ItemDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webViewDescription;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andItem:(SearchItem*)item;
@end
