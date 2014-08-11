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


-(void) startRequestWithProduct:(ADPProduct*) prod
{
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.prod=prod;
        self.statusCode=200;
        sleep(1);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate serviceDidFinish];
        });
    });
    
}

-(ADPProduct*)getProd{
    return self.prod;
}

-(NSInteger) getStatus{
    return self.statusCode;
}
@end
