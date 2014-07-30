//
//  TitleViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "TitleViewController.h"
#import "SubtitleViewController.h"
#import "ProductImageViewController.h"
#import "MainViewController.h"

@interface TitleViewController ()

@end
/* This view provides the user the possiblity to add a title to the product to publish*/
@implementation TitleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:productToFill
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil andProductToFill:productToFill];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - AddItemDelegate methods

-(NSString*) getTitle{
    return @"Titulo";
}
-(NSString*)getDescription{
    return @"Ingresá el título del producto que querés vender";
}
/*Saves the data filled in this view to the correspong property in the prodTofill, this product is passed to the next property to fill*/
//- (IBAction)saveButtonPressed:(id)sender {
//    self.prodToFill.title=self.textField.text;
//    [super saveButtonPressed:sender];
//}

-(void) setFieldContentIfSaved{
    if(self.prodToFill.title!=nil){
            self.textField.text=self.prodToFill.title;
    }
}
-(void)saveField{
    self.prodToFill.title=self.textField.text;
}

-(UIViewController*) getNextViewController:(ADPProduct*)productToFill{
    
    SubtitleViewController * controller = [[SubtitleViewController alloc] initWithNibName:@"DescriptionAndTextFieldViewController" bundle:nil andProductToFill:productToFill];

    return controller;
}
-(UIKeyboardType)getKeyboardType{
    return UIKeyboardTypeDefault;
}
@end
