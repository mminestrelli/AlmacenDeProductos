//
//  MainViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "MainViewController.h"



@interface MainViewController (){

}
@property (nonatomic,strong) ADPProduct* productReceivedInNotification;

-(void) clearNotificationHandle:(NSNotification*)notification;
@end

/* Starting view of the app, provides the possibility of adding a product or a vehicle,starts the navigation through all the views that add properties to the product. This product(prodToFill) is passed trough all the views filling the properties title,subtitle,description,price and image*/
@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.prodToFill=[[ADPProduct alloc]initWithCode:0];
    }
    //Suscription to clear and save notification in the last view of the navigation
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearNotificationHandle:) name:@"productClear" object:self.productReceivedInNotification];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveNotificationHandle:) name:@"productSave" object:self.productReceivedInNotification];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Vender"];
    self.scrollViewMain.scrollEnabled=YES;
    // Do any additional setup after loading the view from its nib.
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark Actions
/*On product button pressed a title view is set on top to start filling the product´s properties,
 prodToFill is passed.*/
- (IBAction)onProductAddButtonPressed:(UIButton *)sender {
     TitleViewController * titleView = [[TitleViewController alloc]initWithNibName:@"DescriptionAndTextFieldViewController" bundle:nil andProductToFill:self.prodToFill ];
    [self.navigationController pushViewController:titleView animated:YES];
}

#pragma mark Notification Handling

/* Clear notification is sent when the user selects the option clear in ProductImageViewController the selector handles the object recieved and uses the same code to initialize an empty product*/
-(void) clearNotificationHandle:(NSNotification*)notification{
    self.productReceivedInNotification= [[notification userInfo] objectForKey:@"producto"];
    NSInteger code=self.productReceivedInNotification.code;
    self.prodToFill=[[ADPProduct alloc]initWithCode:code];
}
/* Save notification is sent when the user selects the option save in ProductImageViewController the selector handles the object received initializing an empty product with the following code*/
-(void) saveNotificationHandle:(NSNotification*) notification{
    self.productReceivedInNotification= [[notification userInfo] objectForKey:@"producto"];
    NSInteger code=self.productReceivedInNotification.code;
    // Se cambio a productListViewController.m
    //[self.house addProduct:self.prodToFill];
    self.prodToFill=[[ADPProduct alloc]initWithCode:code+1];
}


@end
