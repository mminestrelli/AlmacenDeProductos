//
//  DescriptionAndTextViewViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/31/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "DescriptionAndTextViewViewController.h"

@interface DescriptionAndTextViewViewController ()<ADPAddItemDelegate,UITextFieldDelegate,UITextViewDelegate>


@end

@implementation DescriptionAndTextViewViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:(ADPProduct*) productToFill
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil andProductToFill:productToFill];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.textView.delegate=self;
    [self setFieldContentIfSaved];
    [self setKeyboard];
    self.buttonContinue.backgroundColor=[UIColor blueColor];
    self.buttonContinue.enabled=YES;
    self.navigationItem.rightBarButtonItem.enabled=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TextView delegate

-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if (textView.text.length >= 300 && range.length == 0)
        return NO;
    return YES;
}

#pragma mark - Keyboard handling
-(void)setKeyboard{
    [self.textView setKeyboardType:[self getKeyboardType]];
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
