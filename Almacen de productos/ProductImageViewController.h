//
//  ProductImageViewController.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADPProduct.h"


@interface ProductImageViewController : UIViewController<UIPickerViewDelegate, UIPickerViewDataSource>
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:(ADPProduct*)productToFill;
@property (weak, nonatomic) IBOutlet UIScrollView *productImageSV;
@property (weak, nonatomic) IBOutlet UIPickerView *imagePickerView;
@property (weak, nonatomic) IBOutlet UIImageView *displayImageView;
@property (nonatomic,strong) NSArray * imagesNames;
@property (nonatomic,strong) NSArray * imagesPaths;
@end
