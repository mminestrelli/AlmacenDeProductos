//
//  PriceViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "PriceViewController.h"
#import "ProductImageViewController.h"

@interface PriceViewController (){
    ADPProduct* _prodToFill;
}
@property (nonatomic,strong)ADPProduct * prodToFill;

@end
/* This view provides the user the possiblity to add a price to the product to publish*/
@implementation PriceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:productToFill
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
            self.prodToFill=productToFill;

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"Precio"];
    if(self.prodToFill.price!=0.0){
        self.priceTextField.text=[NSString stringWithFormat:@"%f",self.prodToFill.price];
    }

    [ self.priceTextField setKeyboardType:UIKeyboardTypeNumbersAndPunctuation ];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]
                                             initWithTitle:@"Save" style: UIBarButtonItemStyleDone target:self action:@selector(saveButtonPressed:)] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Bar items selectors
/*Saves the data filled in this view to the correspong property in the prodTofill, this product is passed to the next property to fill*/
- (IBAction)saveButtonPressed:(UIButton *)sender {
    if([self.priceTextField.text floatValue]>0.0){
    self.prodToFill.price= [self.priceTextField.text floatValue];
    }else{
     self.prodToFill.price= 0.0;
    }
    ProductImageViewController * imageView = [[ProductImageViewController alloc]initWithNibName:nil bundle:nil andProductToFill:self.prodToFill];
    [self.navigationController pushViewController:imageView animated:YES];
}

@end
