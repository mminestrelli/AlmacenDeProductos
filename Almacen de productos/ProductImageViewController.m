//
//  ProductImageViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ProductImageViewController.h"

@interface ProductImageViewController (){
    ADPStoreHouse * _house;
    ADPProduct* _prodToFill;
}
@property (nonatomic,strong)ADPStoreHouse * house;
@property (nonatomic,strong)ADPProduct * prodToFill;

@end

@implementation ProductImageViewController

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
    [self setTitle:@"Imagen"];
    //self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]
                                            // initWithTitle:@"Save" style: UIBarButtonItemStyleDone target:self action:@selector(saveButtonPressed:)] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
