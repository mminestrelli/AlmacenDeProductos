//
//  ADPVehicle.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/1/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ADPVehicle.h"

@implementation ADPVehicle

-(id) initWithTitle:(NSString*) aTitle code:(NSInteger) aCode subtitle:(NSString*) aSubtitle description:(NSString*) aDescription price:(CGFloat) aPrice brand:(NSString*) aBrand
              model:(NSString*)aModel status:(NSString*) aStatus year:(NSInteger) aYear andImage:(UIImage*) anImage{
    self=[super initWithTitle:aTitle code:aCode subtitle:aSubtitle description:aDescription price:aPrice andImage:anImage];
    if(self){
        self.brand=aBrand;
        self.model=aModel;
        self.year=aYear;
        self.status=aStatus;
    }
    
    return self;
}
@end
