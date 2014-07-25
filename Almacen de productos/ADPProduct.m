//
//  ADPProduct.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/22/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ADPProduct.h"

@interface ADPProduct(){
    NSInteger _code;
    NSString * _title;
    NSString * _subtitle;
    NSString * _description;
    CGFloat _price;
    UIImage * _image;
};



@end

@implementation ADPProduct

-(id) initWithTitle:(NSString*) aTitle code:(NSInteger) aCode subtitle:(NSString*) aSubtitle description:(NSString*) aDescription
price:(CGFloat) aPrice andImage:(UIImage*) anImage{
    if([super init]){
        self.title=aTitle;
        self.code=aCode;
        self.subtitle=aSubtitle;
        self.description=aDescription;
        self.price=aPrice;
        self.image=anImage;
        //self.numberFormatter = [[NSNumberFormatter alloc] init];
        //[self.numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];

    }
    return self;
}

-(id) initWithCode:(NSInteger) aCode{
   if([super init]){
       self.code=aCode;
   }
    return self;
}

-(NSInteger)getIdentification{
    return self.code;
}

@end

