//
//  AbstractMasterViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/29/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "DescriptionAndTextFieldViewController.h"

@interface DescriptionAndTextFieldViewController ()<ADPAddItemDelegate,UITextViewDelegate,UITextFieldDelegate>

@end

@implementation DescriptionAndTextFieldViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:(ADPProduct*) productToFill
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil andProductToFill:productToFill];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textField.delegate=self;
    [self setFieldContentIfSaved];
    [self setKeyboard];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Textfield delegate
//Max characters allowed:40
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range     replacementString:(NSString *)string
{
    [self enableButtonsWithAmountOfCharacters: textField.text.length andFloor:[self minCharactersAllowed]]; 
    if (textField.text.length >= 40 && range.length == 0)
        return NO;
    return YES;
}

#pragma mark - Keyboard handling
//Delegates in each step to decide which keyboard to use
-(void)setKeyboard{
    [self.textField setKeyboardType:[self getKeyboardType]];
}

#pragma mark - First Responder
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    self.fResponder= textField;
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    self.fResponder=textView;
    return YES;
}

#pragma mark - Keyboard

- (BOOL)textFieldShouldReturn:(UITextField *)textField;  {
    [textField resignFirstResponder];
    return YES;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    [self.view endEditing:YES];
}

#pragma mark - AddItemDelegate methods

- (IBAction)saveButtonPressed:(id)sender {
    [super saveButtonPressed:sender];
}
-(NSString*)getTitle{
    return @"";
}
-(NSString*)getDescription{
    return @"";
}

@end

