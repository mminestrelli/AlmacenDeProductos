//
//  AbstractMasterViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/29/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "AbstractMasterViewController.h"

@interface AbstractMasterViewController ()<ADPAddItemDelegate,UITextViewDelegate,UITextFieldDelegate>
@property (strong, nonatomic) UIView * fResponder;

@end

@implementation AbstractMasterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:(ADPProduct*) productToFill
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.prodToFill=productToFill;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:[self getTitle]];
    self.labelDescription.text=[self getDescription];
    self.textField.delegate=self;
    [self setFieldContentIfSaved];
    [self setKeyboard];
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]
                                             initWithTitle:@"Guardar" style: UIBarButtonItemStyleDone target:self action:@selector(saveButtonPressed:)] ;
    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapPressed:)];
    [self.view addGestureRecognizer:tapGesture];
    self.buttonContinue.backgroundColor=[UIColor grayColor];
    self.navigationItem.rightBarButtonItem.enabled=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Textfield delegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range     replacementString:(NSString *)string
{
    [self enableButtonsWithAmountOfCharacters: textField.text.length andFloor:[self minCharactersAllowed]]; 
    if (textField.text.length >= 40 && range.length == 0)
        return NO;
    return YES;
}

-(void) enableButtonsWithAmountOfCharacters:(NSInteger) amount andFloor: (NSInteger) floor{
    if(amount>=floor-1){
        //enable button
        self.buttonContinue.enabled=YES;
        self.navigationItem.rightBarButtonItem.enabled=YES;
        self.buttonContinue.backgroundColor=[UIColor blueColor];
    }else{
        self.buttonContinue.backgroundColor=[UIColor grayColor];
        self.buttonContinue.enabled=NO;
        self.navigationItem.rightBarButtonItem.enabled=NO;
    }
}

#pragma mark - Keyboard handling
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

//-(void) keyboardWillShow: (NSNotification *) notification{
//    NSDictionary* info = [notification userInfo];
//    CGSize kbSize = [[info objectForKey:UIKeyboardFrameBeginUserInfoKey] CGRectValue].size;
//    
//    UIEdgeInsets contentInsets = UIEdgeInsetsMake(64.0, 0.0, kbSize.height, 0.0);
//    self.scrollViewContainer.contentInset = contentInsets;
//    self.scrollViewContainer.scrollIndicatorInsets = contentInsets;
//    
//    
//}
//
//-(void) keyboardWillHide: (NSNotification *) notification{
//    UIEdgeInsets contentInsets = UIEdgeInsetsMake(64.0, 0.0, 0.0, 0.0);;
//    self.scrollViewContainer.contentInset = contentInsets;
//    self.scrollViewContainer.scrollIndicatorInsets = contentInsets;
//}
#pragma mark - gesture
-(void) onTapPressed:(id) sender{
    
    [self.fResponder resignFirstResponder];
}
#pragma mark - AddItemDelegate methods

- (IBAction)saveButtonPressed:(id)sender {

    [self saveField];
    UIViewController * nextViewController= [self getNextViewController:self.prodToFill];
    [self.navigationController pushViewController:nextViewController animated:YES];
    
}

-(NSString*)getTitle{
    return @"";
}
-(NSString*)getDescription{
    return @"";
}

@end

