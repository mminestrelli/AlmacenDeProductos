//
//  ADPVehicle.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/1/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ADPProduct.h"

@interface ADPVehicle : ADPProduct

@property (nonatomic,copy) NSString * brand;
@property (nonatomic,copy) NSString * model;
//new or used
@property (nonatomic,copy) NSString * status;
@property  (nonatomic) NSInteger year;

-(id) initWithTitle:(NSString*) aTitle code:(NSInteger) aCode subtitle:(NSString*) aSubtitle description:(NSString*) aDescription price:(CGFloat) aPrice brand:(NSString*) aBrand
              model:(NSString*)aModel status:(NSString*) aStatus year:(NSInteger) aYear andImage:(UIImage*) anImage;
@end
