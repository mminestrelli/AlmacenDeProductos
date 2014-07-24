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
    ADPStoreHouse * _house;
    ADPProduct* _prodToFill;
}
@property (nonatomic,strong)ADPStoreHouse * house;
@property (nonatomic,strong)ADPProduct * prodToFill;

@end

@implementation PriceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil storeHouse:(ADPStoreHouse*) storeHouse andProductToFill:productToFill
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.house=storeHouse;
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
- (IBAction)saveButtonPressed:(UIButton *)sender {
    if([self.priceTextField.text floatValue]>0.0){
    self.prodToFill.price= [self.priceTextField.text floatValue];
    }else{
     self.prodToFill.price= 0.0;
    }
    ProductImageViewController * imageView = [[ProductImageViewController alloc]initWithNibName:nil bundle:nil storeHouse: self.house andProductToFill:self.prodToFill];
    [self.navigationController pushViewController:imageView animated:YES];
}

@end
