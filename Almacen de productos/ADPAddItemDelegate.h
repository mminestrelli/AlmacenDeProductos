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

-(NSString*) getTitle;
-(NSString*) getDescription;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:(ADPProduct*)productToFill;
@optional

- (IBAction)clearButtonPressed:(UIButton *)sender;
-(void)setFieldContentIfSaved;
-(UIViewController*)getNextViewController:(ADPProduct*)productToFill;
-(void) saveField;
-(UIKeyboardType)getKeyboardType;
-(NSInteger)minCharactersAllowed;
- (IBAction)saveButtonPressed:(UIButton *)sender;
@end
