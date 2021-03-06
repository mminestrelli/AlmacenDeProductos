//
//  MainViewController.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADPStoreHouse.h"
#import "TitleViewController.h"

@interface MainViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewMain;
@property (nonatomic,strong)ADPStoreHouse * house;
@property (nonatomic,strong)ADPProduct * prodToFill;
- (IBAction)onProductAddButtonPressed:(UIButton *)sender;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil;

@end
