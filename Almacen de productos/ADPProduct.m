//
//  ADPProduct.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/22/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ADPProduct.h"

@interface ADPProduct();

//User number formatting preferences
@property (nonatomic,strong) NSNumberFormatter * numberFormatter;

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
        self.numberFormatter = [[NSNumberFormatter alloc] init];
        [self.numberFormatter setNumberStyle:NSNumberFormatterDecimalStyle];

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
/*Encoding and decoding */
-(void)encodeWithCoder:(NSCoder *)encoder{
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.subtitle forKey:@"subtitle"];
    [encoder encodeInt:self.code forKey:@"code"];
    [encoder encodeObject:self.description forKey:@"description"];
    [encoder encodeFloat:self.price forKey:@"price" ];
    [encoder encodeObject:self.image forKey:@"image"];
}

- (id)initWithCoder:(NSCoder *)decoder {
    if (self = [super init]) {
        self.title = [decoder decodeObjectForKey:@"title"];
        self.subtitle = [decoder decodeObjectForKey:@"subtitle"];
        self.description = [decoder decodeObjectForKey:@"description"];
        self.image = [decoder decodeObjectForKey:@"image"];
        self.code= [decoder decodeIntForKey:@"code"];
        self.price= [decoder decodeFloatForKey:@"price"];
    }
    return self;
}

/*Returns saved price as string formatted acording to user preferences*/
-(NSString*)getFormattedPriceString{
    return [self.numberFormatter stringFromNumber:[NSNumber numberWithFloat:self.price]];
}
@end

