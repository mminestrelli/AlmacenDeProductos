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

@interface TitleViewController (){
    ADPStoreHouse * _house;
    ADPProduct* _prodToFill;
}
@property (nonatomic,strong)ADPStoreHouse * house;
@property (nonatomic,strong)ADPProduct * prodToFill;

@end

@implementation TitleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil storeHouse:(ADPStoreHouse*) storeHouse andProductToFill:productToFill
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.house=storeHouse;
        self.prodToFill=productToFill;
        //if([self.prodToFill getTitle]!=nil)
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"Título"];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]
                                             initWithTitle:@"Save" style: UIBarButtonItemStyleDone target:self action:@selector(saveButtonPressed:)] ;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveButtonPressed:(id)sender {
    SubtitleViewController * subtitleView = [[SubtitleViewController alloc]initWithNibName:nil bundle:nil storeHouse: self.house andProductToFill:self.prodToFill];
    [self.navigationController pushViewController:subtitleView animated:YES];
}

@end
