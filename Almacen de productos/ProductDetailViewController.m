//
//  ProductDetailViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/1/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ProductDetailViewController.h"

@interface ProductDetailViewController ()
@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * subtitle;
@property (nonatomic,copy) NSString * description;
@property (nonatomic,strong) UIImage * image;
@property  (nonatomic,copy) NSString * price;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewContainer;
@end

@implementation ProductDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProduct:(ADPProduct*)product
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=product.title;
        self.subtitle=product.subtitle;
        self.description=product.description;
        self.image=product.image;
        //self.price=@"$";
        //self.price= [self.price stringByAppendingString:[product getFormattedPriceString]];
        self.price=[NSString stringWithFormat:@"%f",product.price];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.labelPrice.text=self.price;
    self.labelSubtitle.text=self.subtitle;
    self.textViewDescription.text=self.description;
    self.imageViewProduct.image=self.image;
    self.scrollViewContainer.scrollEnabled=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
