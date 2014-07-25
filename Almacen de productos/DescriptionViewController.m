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
    ADPProduct* _prodToFill;
}
@property (nonatomic,strong)ADPProduct * prodToFill;


@end

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

- (IBAction)saveButtonPressed:(UIButton *)sender {
    self.prodToFill.description=self.descriptionTextView.text;
    PriceViewController * priceView = [[PriceViewController alloc]initWithNibName:nil bundle:nil andProductToFill:self.prodToFill ];
    [self.navigationController pushViewController:priceView animated:YES];
}

@end
