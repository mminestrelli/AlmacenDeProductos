//
//  AbstractDescriptionAndTextViewController.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/31/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ADPProduct.h"
#import "ADPAddItemDelegate.h"
#import "MBProgressHUD.h"

@interface AbstractDescriptionAndTextViewController : UIViewController

@property (strong, nonatomic) UIView * fResponder;
@property (nonatomic,strong)ADPProduct * prodToFill;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:(ADPProduct*)productToFill;
-(void) enableButtonsWithAmountOfCharacters:(NSInteger) amount andFloor: (NSInteger) floor;
-(void)setCharactersLeftLabelWithInteger:(NSInteger)charactersLeft;


@property (weak, nonatomic) IBOutlet UILabel *labelDescription;
@property (weak, nonatomic) IBOutlet UIView *viewInsider;
@property (weak, nonatomic) IBOutlet UIButton *buttonContinue;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollViewContainer;
@property (weak, nonatomic) IBOutlet UILabel *labelCharactersLeft;
- (IBAction)saveButtonPressed:(id)sender;
@end
