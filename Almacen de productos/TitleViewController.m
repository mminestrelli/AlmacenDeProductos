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
    ADPProduct* _prodToFill;
}
@property (nonatomic,strong)ADPProduct * prodToFill;

@end
/* This view provides the user the possiblity to add a title to the product to publish*/
@implementation TitleViewController

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
    [self setTitle:@"Título"];
    if(self.prodToFill.title!=nil){
        self.titleTextField.text=self.prodToFill.title;
        
    }
    
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]
                                             initWithTitle:@"Save" style: UIBarButtonItemStyleDone target:self action:@selector(saveButtonPressed:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Bar items selectors
/*Saves the data filled in this view to the correspong property in the prodTofill, this product is passed to the next property to fill*/
- (IBAction)saveButtonPressed:(id)sender {
    self.prodToFill.title=self.titleTextField.text;
    SubtitleViewController * subtitleView = [[SubtitleViewController alloc]initWithNibName:nil bundle:nil andProductToFill:self.prodToFill];
    [self.navigationController pushViewController:subtitleView animated:YES];
}



@end
