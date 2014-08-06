//
//  ProductImageViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ProductImageViewController.h"

@interface ProductImageViewController ()
@property (nonatomic,strong)ADPProduct * prodToFill;


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

    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]
                                             initWithTitle:@"Guardar" style: UIBarButtonItemStyleDone target:self action:@selector(saveButtonPressed:)] ;
    

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
    
	HUD = [[MBProgressHUD alloc] initWithView:self.navigationController.view];
	[self.navigationController.view addSubview:HUD];
	
	//HUD.delegate = self;
	HUD.labelText = @"Connecting";
	HUD.minSize = CGSizeMake(135.f, 135.f);
	
	[HUD showWhileExecuting:@selector(doSomeFunkyStuff) onTarget:self withObject:nil animated:YES];
    
    
//    [NSNotification  notificationWithName:@"productSave" object:self.prodToFill];
//    [[NSNotificationCenter defaultCenter] postNotificationName:@"productSave" object:self.prodToFill userInfo:[NSDictionary dictionaryWithObject:self.prodToFill forKey:@"producto" ]];
    
//    [self.navigationController popToRootViewControllerAnimated:YES];
}
/*Pops to the root controller and notifies to discard all the changes saved in the product*/
- (IBAction)clearButtonPressed:(UIButton *)sender {

    [NSNotification  notificationWithName:@"productClear" object:self.prodToFill];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"productClear" object:self.prodToFill];
    [self.navigationController popToRootViewControllerAnimated:YES];
    
}

- (void)doSomeFunkyStuff {
	// Indeterminate mode
	sleep(2);
	// Switch to determinate mode
	HUD.mode = MBProgressHUDModeDeterminate;
	HUD.labelText = @"Progress";
	float progress = 0.0f;
	while (progress < 1.0f)
	{
		progress += 0.01f;
		HUD.progress = progress;
		usleep(50000);
	}
	// Back to indeterminate mode
//	HUD.mode = MBProgressHUDModeIndeterminate;
//	HUD.labelText = @"Cleaning up";
//	sleep(2);
	// UIImageView is a UIKit class, we have to initialize it on the main thread
	__block UIImageView *imageView;
	dispatch_sync(dispatch_get_main_queue(), ^{
		UIImage *image = [UIImage imageNamed:@"sellTabBar.png"];
		imageView = [[UIImageView alloc] initWithImage:image];
        [NSNotification  notificationWithName:@"productSave" object:self.prodToFill];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"productSave" object:self.prodToFill userInfo:[NSDictionary dictionaryWithObject:self.prodToFill forKey:@"producto" ]];
            //[self.navigationController popToRootViewControllerAnimated:YES];
        UIViewController * nextViewController= [self getNextViewController:self.prodToFill];
        [self.navigationController pushViewController:nextViewController animated:YES];
	});

	HUD.mode = MBProgressHUDModeCustomView;
	HUD.labelText = @"Completed";
	sleep(2);
}

-(UIViewController*) getNextViewController:(ADPProduct*)productToFill{
    
    CongratsViewController * controller = [[CongratsViewController alloc] initWithProduct:productToFill];
    
    return controller;
}

@end
