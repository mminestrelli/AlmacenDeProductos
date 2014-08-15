//
//  DescriptionAndTextViewViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/31/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "DescriptionAndTextViewViewController.h"
#define kMaxCharactersAllowed 300

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
    [self registerForKeyboardNotifications];
    [self setCharactersLeftLabelWithInteger:kMaxCharactersAllowed];
//    self.buttonContinue.backgroundColor=[UIColor blueColor];
//    self.buttonContinue.enabled=YES;
//    self.navigationItem.rightBarButtonItem.enabled=YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - TextView delegate
//Max characters allowed:300
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSString * current=[textView.text stringByReplacingCharactersInRange:range withString:text];
    if([current length]>kMaxCharactersAllowed){
        return NO;
    }else{
        [self setCharactersLeftLabelWithInteger:kMaxCharactersAllowed-[current length]];
        return YES;
    }
    

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
// Call this method somewhere in your view controller setup code.
- (void)registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWasShown:)
                                                 name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillBeHidden:)
                                                 name:UIKeyboardDidHideNotification object:nil];
    
}

// Called when the UIKeyboardDidShowNotification is sent.
- (void)keyboardWasShown:(NSNotification*)aNotification
{
    //self.scrollViewContainer.scrollEnabled=YES;
}


// Called when the UIKeyboardWillHideNotification is sent
- (void)keyboardWillBeHidden:(NSNotification*)aNotification
{
    //    UIEdgeInsets contentInsets = UIEdgeInsetsMake(0.0, 0.0,0.0, 0.0);;
    //    self.scrollViewContainer.contentInset = contentInsets;
    //    self.scrollViewContainer.scrollIndicatorInsets = contentInsets;
    
//    [self.scrollViewContainer setContentOffset:CGPointMake(self.scrollViewContainer.contentOffset.x, -35)
//                                      animated:YES];
//    self.scrollViewContainer.scrollEnabled=NO;
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
