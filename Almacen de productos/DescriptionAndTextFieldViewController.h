//
//  AbstractMasterViewController.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/29/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADPProduct.h"
#import "ADPAddItemDelegate.h"
#import "AbstractDescriptionAndTextViewController.h"
@interface DescriptionAndTextFieldViewController : AbstractDescriptionAndTextViewController
@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UIButton *buttonContinue;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewContainer;
@property (nonatomic,strong)ADPProduct * prodToFill;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:(ADPProduct*)productToFill;
- (IBAction)saveButtonPressed:(id)sender;
@end
