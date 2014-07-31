//
//  DescriptionViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "DescriptionViewController.h"
#import "PriceViewController.h"

@interface DescriptionViewController ()

@end
/* This view provides the user the possiblity to add a description to the product to publish*/
@implementation DescriptionViewController

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
    return @"Descripción";
}
-(NSString*)getDescription{
    return @"Contanos más acerca de tu producto";
}

-(void) setFieldContentIfSaved{
    if(self.prodToFill.description!=nil){
        self.textView.text=self.prodToFill.description;
    }
}
-(void)saveField{
    self.prodToFill.description=self.textView.text;
}

-(UIViewController*) getNextViewController:(ADPProduct*)productToFill{
    PriceViewController * controller = [[PriceViewController alloc] initWithNibName:@"DescriptionAndTextFieldViewController" bundle:nil andProductToFill:productToFill];
    return controller;
}
-(UIKeyboardType)getKeyboardType{
    return UIKeyboardTypeDefault;
}
-(NSInteger)minCharactersAllowed{
    return 0;
}
@end
