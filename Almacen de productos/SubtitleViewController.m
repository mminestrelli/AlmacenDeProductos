//
//  SubtitleViewController.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/23/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "SubtitleViewController.h"

@interface SubtitleViewController (){
}
@end
/* This view provides the user the possiblity to add a subtitle to the product to publish*/
@implementation SubtitleViewController
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil andProductToFill:productToFill{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil andProductToFill:productToFill];
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - AddItemDelegate methods

-(NSString*) getTitle{
    return @"Subtítulo";
}
-(NSString*)getDescription{
    return @"Describí tu producto en una línea";
}

-(void) setFieldContentIfSaved{
    if(self.prodToFill.subtitle!=nil){
        self.textField.text=self.prodToFill.subtitle;
    }
}
-(void)saveField{
    self.prodToFill.subtitle=self.textField.text;
}

-(UIViewController*) getNextViewController:(ADPProduct*)productToFill{
    DescriptionViewController * controller = [[DescriptionViewController alloc] initWithNibName:@"DescriptionAndTextViewViewController" bundle:nil andProductToFill:productToFill];
    return controller;
}
-(UIKeyboardType)getKeyboardType{
    return UIKeyboardTypeDefault;
}
-(NSInteger)minCharactersAllowed{
    return 5;
}
@end
