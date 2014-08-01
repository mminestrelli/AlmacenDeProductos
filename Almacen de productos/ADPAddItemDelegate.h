//
//  ADPAddItemDelegate.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/29/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ADPAddItemDelegate <NSObject>
/*All the methods an adding product step must or have the possibility to implement*/
@required

/*Returns the title of the step*/
-(NSString*) getTitle;
/*Returns the description of what the step does*/
-(NSString*) getDescription;
/*Initializes an step with a product*/
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:(ADPProduct*)productToFill;
@optional
/*If the step has a value in it´s corresponding property it´s set in text component*/
-(void)setFieldContentIfSaved;
/*Returns the controller of the next step*/
-(UIViewController*)getNextViewController:(ADPProduct*)productToFill;
/*Saves the input text in the corresponding property of the product*/
-(void) saveField;
/*Returns the keyboard type used by the step*/
-(UIKeyboardType)getKeyboardType;
/*Returns the min amount of characters needed in the text component*/
-(NSInteger)minCharactersAllowed;
/*Saves the information in the model between steps and pushes the next controller*/
- (IBAction)saveButtonPressed:(UIButton *)sender;
@end
