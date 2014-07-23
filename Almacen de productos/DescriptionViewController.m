//
//  DescriptionViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "DescriptionViewController.h"
#import "PriceViewController.h"

@interface DescriptionViewController (){
    ADPStoreHouse * _house;
    ADPProduct* _prodToFill;
}
@property (nonatomic,strong)ADPStoreHouse * house;
@property (nonatomic,strong)ADPProduct * prodToFill;


@end

@implementation DescriptionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
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

- (IBAction)saveButtonPressed:(UIButton *)sender {
    PriceViewController * priceView = [[PriceViewController alloc]initWithNibName:nil bundle:nil ];
    [self.navigationController pushViewController:priceView animated:YES];
}

@end
