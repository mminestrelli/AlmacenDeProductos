//
//  AbstractMasterViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/29/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "DescriptionAndTextFieldViewController.h"
#define kMaxCharactersAllowed 40

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
    [self registerForKeyboardNotifications];
    [self setCharactersLeftLabelWithInteger:kMaxCharactersAllowed];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Textfield delegate
//Max characters allowed:40
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range     replacementString:(NSString *)string
{
    NSString * current=[textField.text stringByReplacingCharactersInRange:range withString:string];
    if([current length]>kMaxCharactersAllowed){
        return NO;
    }else{
        //Min character amount validation disabled
        [self enableButtonsWithAmountOfCharacters: [current length] andFloor:[self minCharactersAllowed]];
        [self setCharactersLeftLabelWithInteger:kMaxCharactersAllowed-[current length]];
        return YES;
    }
    
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

// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardWillHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    //self.scrollViewContainer.scrollEnabled=YES;
//    NSDictionary* info = [aNotification userInfo];
//    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    
//    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0, kbSize.height, 0.0);
//    self.scrollViewContainer.contentInset = contentInsets;
//    self.scrollViewContainer.scrollIndicatorInsets = contentInsets;
//    
//    // If active text field is hidden by keyboard, scroll it so it's visible
//    // Your app might not need or want this behavior.
//    CGRect aRect = self.view.frame;
//    aRect.size.height -= kbSize.height;
//    if (!CGRectContainsPoint(aRect, self.viewInsider.frame.origin) ) {
//        [self.scrollViewContainer scrollRectToVisible:self.containerView.frame animated:YES];
//        self.scrollViewContainer.scrollEnabled=YES;
//    }
}


// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
//    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0,0.0, 0.0);;
//    self.scrollViewContainer.contentInset = contentInsets;
//    self.scrollViewContainer.scrollIndicatorInsets = contentInsets;
    
    [self.scrollViewContainer setContentOffset:CGPointMake(self.scrollViewContainer.contentOffset.x, -35)
                             animated:YES];
    //self.scrollViewContainer.scrollEnabled=NO;
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

