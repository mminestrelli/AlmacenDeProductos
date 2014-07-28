//
//  AppDelegate.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/22/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "ADPStoreHouse.h"
#import "ADPProduct.h"
#import "SubtitleViewController.h"
#import "TitleViewController.h"
#import "ProductImageViewController.h"
#import "ProductListViewController.h"
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    ADPStoreHouse * house = [[ADPStoreHouse alloc] init];
    ADPProduct * productToFill=[[ADPProduct alloc]initWithCode:0];
    MainViewController * mainViewController= [[MainViewController alloc]initWithNibName:nil bundle:nil storeHouse:house andProductToFill:productToFill ];
    UITabBarItem* sellProductTabBarItem = nil;
    UITabBarItem* productListTabBarItem = nil;
    
    //TitleViewController * mainViewController= [[TitleViewController alloc]initWithNibName:nil bundle:nil];
    //SubtitleViewController* mainViewController= [[SubtitleViewController alloc]initWithNibName:nil bundle:nil storeHouse:house ];
//    ProductImageViewController * mainViewController= [[ProductImageViewController alloc]initWithNibName:nil bundle:nil andProductToFill:productToFill ];
    
    ProductListViewController *productList=[[ProductListViewController alloc]initWithNibName:nil bundle:nil andStoreHouse:house];
    UINavigationController * navigationController = [[UINavigationController alloc]initWithRootViewController: mainViewController];
    UITabBarController * tabBarController = [[UITabBarController alloc] initWithNibName:nil bundle:nil];
   
    sellProductTabBarItem = [[UITabBarItem alloc] initWithTitle:@"Vender" image:[UIImage imageNamed:@"sellTabBar.png"] tag:0];
    productListTabBarItem= [[UITabBarItem alloc] initWithTitle:@"Lista de Productos"  image:[UIImage imageNamed:@"categoriesTabBar.png"]  tag:1];
    tabBarController.tabBar.barTintColor = [self colorWith255Red:84 withGreen:84 withBlue:84];
    navigationController.tabBarItem=sellProductTabBarItem;
    productList.tabBarItem=productListTabBarItem;
    
    [tabBarController setViewControllers:@[navigationController, productList]];
    
    self.window.rootViewController= tabBarController;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (UIColor*) colorWith255Red:(NSInteger) red withGreen:(NSInteger) green withBlue:(NSInteger) blue
{
    return [UIColor colorWithRed:red / 255.0 green:green / 255.0 blue:blue / 255.0 alpha:1.0];
}

@end
