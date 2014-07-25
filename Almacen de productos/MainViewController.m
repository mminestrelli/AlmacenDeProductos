//
//  MainViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "MainViewController.h"



@interface MainViewController (){
    ADPStoreHouse * _house;
    ADPProduct* _prodToFill;
    ADPProduct* _productReceivedInNotification;
}
@property (nonatomic,strong) ADPProduct* productReceivedInNotification;

-(void) clearNotificationHandle:(NSNotification*)notification;
@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil storeHouse:(ADPStoreHouse*) storeHouse andProductToFill:productToFill
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.house=storeHouse;
        self.prodToFill=productToFill;
    }
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(clearNotificationHandle:) name:@"productClear" object:self.productReceivedInNotification];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveNotificationHandle:) name:@"productSave" object:self.productReceivedInNotification];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"Main"];
    
}
//Old implementation for saving notification
//-(void) viewDidAppear:(BOOL)animated{
//    if(self.prodToFill.image!=nil){
//        NSInteger code=self.prodToFill.code;
//        [self.house addProduct:self.prodToFill];
//        self.prodToFill=[[ADPProduct alloc]initWithCode:code+1];
//    }
//}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onAddButtonPressed:(UIButton *)sender {
     TitleViewController * titleView = [[TitleViewController alloc]initWithNibName:nil bundle:nil andProductToFill:self.prodToFill ];
    [self.navigationController pushViewController:titleView animated:YES];
}

#pragma mark Notification Handling

/* Clear notification is sent when the user selects the option clear in ProductImageViewController the selector handles the object recieved and uses the same code to initialize an empty product*/
-(void) clearNotificationHandle:(NSNotification*)notification{
    NSInteger code=self.productReceivedInNotification.code;
    self.prodToFill=[[ADPProduct alloc]initWithCode:code];
}
/* Save notification is sent when the user selects the option save in ProductImageViewController the selector handles the object received adding it to the store house and initializing an empty product with the following code*/
-(void) saveNotificationHandle:(NSNotification*) notification{
    NSInteger code=self.productReceivedInNotification.code;
    [self.house addProduct:self.prodToFill];
    self.prodToFill=[[ADPProduct alloc]initWithCode:code+1];
}


@end
