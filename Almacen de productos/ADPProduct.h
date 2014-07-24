//
//  ADPProduct.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 7/22/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ADPProduct : NSObject

@property (nonatomic,copy) NSString * title;
@property (nonatomic,copy) NSString * subtitle;
@property (nonatomic,copy) NSString * description;
@property (nonatomic,strong) UIImage * image;
@property  (nonatomic) CGFloat price;
@property  (nonatomic) int id;

-(id) initWithTitle:(NSString*) aTitle code:(NSInteger) aCode subtitle:(NSString*) aSubtitle description:(NSString*) aDescription price:(CGFloat) aPrice andImage:(UIImage*) anImage;

-(NSInteger)getIdentification;
@end