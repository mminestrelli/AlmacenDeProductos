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

@property (nonatomic,strong)ADPProduct * prodToFill;

@end
/* This view provides the user the possiblity to add a description to the product to publish*/
@implementation DescriptionViewController

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
    [self setTitle:@"Descripción"];
    if(self.prodToFill.description!=nil){
        self.descriptionTextView.text=self.prodToFill.description;
        
    }
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
    self.prodToFill.description=self.descriptionTextView.text;
    PriceViewController * priceView = [[PriceViewController alloc]initWithNibName:@"DescriptionAndTextFieldViewController" bundle:nil andProductToFill:self.prodToFill ];
    [self.navigationController pushViewController:priceView animated:YES];
}

@end
