//
//  PriceViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "PriceViewController.h"
#import "ProductImageViewController.h"

@interface PriceViewController ()
@property (nonatomic,strong)ADPProduct * prodToFill;

@end
/* This view provides the user the possiblity to add a price to the product to publish*/
@implementation PriceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:productToFill
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil andProductToFill:productToFill];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - AddItemDelegate methods

-(NSString*) getTitle{
    return @"Precio";
}
-(NSString*)getDescription{
    return @"Ingresá el precio de tu producto";
}

-(void) setFieldContentIfSaved{
    if(self.prodToFill.price!=0.0){
        self.textField.text=[self.prodToFill getFormattedPriceString];
    }
}
-(void)saveField{
    self.prodToFill.price=[self.textField.text floatValue];
}

-(UIViewController*) getNextViewController:(ADPProduct*)productToFill{
    ProductImageViewController * controller = [[ProductImageViewController alloc] initWithNibName:nil bundle:nil andProductToFill:productToFill];
    return controller;
}
-(UIKeyboardType)getKeyboardType{
    return UIKeyboardTypeDecimalPad;
}

@end
