//
//  SubtitleViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "SubtitleViewController.h"

@interface SubtitleViewController (){
    ADPProduct* _prodToFill;
}
@property (nonatomic,strong)ADPProduct * prodToFill;
@end

@implementation SubtitleViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:productToFill{
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
    [self setTitle:@"Subtítulo"];
    if(self.prodToFill.subtitle!=nil){
        self.subtitleTextField.text=self.prodToFill.subtitle;
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
    self.prodToFill.subtitle=self.subtitleTextField.text;
    DescriptionViewController * descriptionView = [[DescriptionViewController alloc]initWithNibName:nil bundle:nil andProductToFill:self.prodToFill];
    [self.navigationController pushViewController:descriptionView animated:YES];
}

@end
