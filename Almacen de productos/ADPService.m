//
//  ADPService.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/7/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ADPService.h"
@interface ADPService()
@property (nonatomic) NSInteger statusCode;
@property (nonatomic,strong) ADPProduct * prod;
@end

@implementation ADPService
- (id)startRequestWithProduct:(ADPProduct*) prod
{
    if (self) {
        self.statusCode=200;
        self.prod=prod;
    }
    return self;
}

-(ADPProduct*)getProd{
    return self.prod;
}

-(NSInteger) getStatus{
    return self.statusCode;
}
@end
