//
//  AppDelegate.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/22/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"
#import "ProductListViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

- (UIColor*) colorWith255Red:(NSInteger) red withGreen:(NSInteger) green withBlue:(NSInteger) blue;
@end
