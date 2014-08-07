//
//  AbstractDescriptionAndTextViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/31/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "AbstractDescriptionAndTextViewController.h"

@interface AbstractDescriptionAndTextViewController ()<ADPAddItemDelegate>


@end

@implementation AbstractDescriptionAndTextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:(ADPProduct*) productToFill
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.prodToFill=productToFill;
    }
    return self;
}
/*On view load set the specific title and description of the step and set the save buttons */
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setTitle:[self getTitle]];
    self.labelDescription.text=[self getDescription];
    self.scrollViewContainer.scrollEnabled=NO;
    self.navigationItem.rightBarButtonItem =[[UIBarButtonItem alloc]
                                             initWithTitle:@"Continuar" style: UIBarButtonItemStyleDone target:self action:@selector(saveButtonPressed:)] ;

    UITapGestureRecognizer * tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTapPressed:)];
    [self.view addGestureRecognizer:tapGesture];
    
//    self.buttonContinue.backgroundColor=[UIColor grayColor];
//    self.buttonContinue.enabled=NO;
//    self.navigationItem.rightBarButtonItem.enabled=NO;
    self.buttonContinue.backgroundColor=[UIColor blueColor];
    self.buttonContinue.enabled=YES;
    self.navigationItem.rightBarButtonItem.enabled=YES;

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark -custom methods
/*If the amount of characters in the input is greater than the minimun requiered by the field, all buttons get enabled*/
-(void) enableButtonsWithAmountOfCharacters:(NSInteger) amount andFloor: (NSInteger) floor{
    if(amount>=floor){
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

-(void)setCharactersLeftLabelWithInteger:(NSInteger)charactersLeft{
    NSString *baseString = @"Te quedan";
    self.labelCharactersLeft.text=[baseString stringByAppendingFormat:
                                   @" %d caracteres disponibles ",charactersLeft];
    
}

#pragma mark - AddItemDelegate methods

-(NSString*)getTitle{
    return @"";
}
-(NSString*)getDescription{
    return @"";
}
- (IBAction)saveButtonPressed:(id)sender {
    
    [self saveField];
    UIViewController * nextViewController= [self getNextViewController:self.prodToFill];
    [self.navigationController pushViewController:nextViewController animated:YES];
    
}
#pragma mark - gesture
-(void) onTapPressed:(id) sender{
    
    [self.fResponder resignFirstResponder];
}


@end
