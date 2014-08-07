//
//  CongratsViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/6/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "CongratsViewController.h"
#import "ADPProduct.h"

@interface CongratsViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageCongrats;
@property (weak, nonatomic) IBOutlet UILabel *labelCongrats;
@property (weak, nonatomic) IBOutlet UILabel *labelTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelSubtitle;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewProduct;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (nonatomic,strong) ADPProduct* product;

@end

@implementation CongratsViewController

- (id)initWithServiceResponse:(ADPService*)service{
    self=[self initWithNibName:nil bundle:nil andProduct:[service getProd]];
    return self;
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProduct:(ADPProduct*)prod
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.product=prod;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.imageCongrats.image=[UIImage imageNamed:@"check.png"];
    [self.imageCongrats setTintColor:[UIColor greenColor]];
    
    self.labelTitle.text=self.product.title;
    self.labelSubtitle.text=self.product.subtitle;
    self.labelPrice.text=[NSString stringWithFormat:@"%f",self.product.price];
    self.imageViewProduct.image=self.product.image;
    self.labelCongrats.text=@"Felicitaciones! concretaste tu compra";
    self.labelDescription.text=self.product.description;
    
    self.navigationItem.hidesBackButton=YES;
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]
                                             initWithTitle:@"Seguir Vendiendo" style: UIBarButtonItemStyleDone target:self action:@selector(toRootButtonPressed)] ;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark selectors
-(void) toRootButtonPressed{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
