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
@property  (nonatomic) CGFloat price;
@end

@implementation ProductDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString*) aTitle subtitle:(NSString*) aSubtitle price:(CGFloat)aPrice description:(NSString*) aDescription andImage:(UIImage*)anImage
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=aTitle;
        self.subtitle=aSubtitle;
        self.description=aDescription;
        self.image=anImage;
        self.price=aPrice;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.labelPrice=;
    self.labelSubtitle.text=self.subtitle;
    self.textViewDescription.text=self.description;
    self.imageViewProduct.image=self.image;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
