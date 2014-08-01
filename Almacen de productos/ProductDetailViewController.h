//
//  ProductDetailViewController.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/1/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIImageView *imageViewProduct;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelSubtitle;
@property (weak, nonatomic) IBOutlet UITextView *textViewDescription;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil title:(NSString*) aTitle subtitle:(NSString*) aSubtitle price:(CGFloat)aPrice description:(NSString*) aDescription andImage:(UIImage*)anImage;

@end
