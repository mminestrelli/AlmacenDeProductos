//
//  ProductImageViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ProductImageViewController.h"

@interface ProductImageViewController ()<ADPServiceDelegate>
@property (nonatomic,strong)ADPProduct * prodToFill;
@property (nonatomic,strong) ADPService * service;


@end
/* This step provides the user the possiblity to add an image to the product to publish,then notifies on clear o save done*/
@implementation ProductImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:productToFill
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.prodToFill=productToFill;
        //random images for the picker
        self.imagesNames=@[@"Imagen1", @"Imagen2",
                           @"Imagen3", @"Imagen4", @"Imagen5"];
        self.imagesPaths=@[@"gallery1_2256", @"gallery2_2256",
                           @"gallery3_2256", @"gallery4_2256", @"gallery5_2256"];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setTitle:@"Imagen"];
    //default image
    self.displayImageView.image=[UIImage imageNamed: @"gallery1_2256.jpg"];
    self.productImageSV.scrollEnabled=YES;
    self.imagePickerView.delegate=self;
    self.service.delegate=self;

    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]
                                             initWithTitle:@"Guardar" style: UIBarButtonItemStyleDone target:self action:@selector(saveButtonPressed:)] ;
    self.scrollViewContainer.scrollEnabled=NO;

    //Funcionalidad de descartar cambios
    //self.navigationItem.leftBarButtonItem =[[UIBarButtonItem alloc]
    //                                         initWithTitle:@"Borrar" style: UIBarButtonItemStyleDone target:self action:@selector(clearButtonPressed:)];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark PickerView DataSource

- (NSInteger)numberOfComponentsInPickerView:
(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView
numberOfRowsInComponent:(NSInteger)component
{
    return [self.imagesNames count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component
{
    return self.imagesNames[row];
}

#pragma mark PickerView Delegate
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row
      inComponent:(NSInteger)component
{
    NSString*aux=self.imagesPaths[row];
    self.displayImageView.image=[UIImage imageNamed: [aux stringByAppendingString:@".jpg"]];

}

#pragma mark Bar items selectors
/*Saves the information in the model between steps and pops to the root controller. Also notifies that the product has all it´s properties and must be saved*/
- (IBAction)saveButtonPressed:(UIButton *)sender {
    self.prodToFill.image=self.displayImageView.image;
    [self loadingHud];
    if (self.service==nil) {
        self.service= [[ADPService alloc]init];
        [self.service setDelegate:self];
    }
    
    [self.service startRequestWithProduct:self.prodToFill];
}
/*Pops to the root controller and notifies to discard all the changes saved in the product*/
- (IBAction)clearButtonPressed:(UIButton *)sender {

    [NSNotification  notificationWithName:@"productClear" object:self.prodToFill];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"productClear" object:self.prodToFill];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

#pragma mark ADPServiceDelegate methods
-(void) serviceDidFinish{
    if([self.service getStatus]==200){
        [NSNotification  notificationWithName:@"productSave" object:self.prodToFill];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"productSave" object:self.prodToFill userInfo:[NSDictionary dictionaryWithObject:self.prodToFill forKey:@"producto" ]];
        CongratsViewController * nextViewController = [[CongratsViewController alloc] initWithServiceResponse:self.service];
        [self.navigationController pushViewController:nextViewController animated:YES];
    }
    [self finishingHUD];
}

#pragma mark MBProgressHud animations
-(void) loadingHud{
    HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
    HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
	// Configure for text only and offset down
	HUD.mode = MBProgressHUDModeText;
	HUD.labelText = @"Cargando";
	HUD.margin = 10.f;
	HUD.yOffset = 150.f;
	HUD.removeFromSuperViewOnHide = YES;

}
-(void)finishingHUD{
    HUD.mode = MBProgressHUDModeText;
	HUD.labelText = @"Listo!";
    [HUD hide:YES afterDelay:3];
}



@end
