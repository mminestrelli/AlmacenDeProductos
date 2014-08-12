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

/*Run the service in another thread with callback serviceDidFinish in main queue*/
-(void) startRequestWithProduct:(ADPProduct*) prod
{
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.prod=prod;
        self.statusCode=200;
        sleep(5);
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.delegate serviceDidFinish];
        });
    });
    
}
/*Run request with blocks. Execute the service core in a custom serial queue  and after that executes completion or error blocks secuentially respect the service core but in main thread*/
-(void) runRequestWithProduct:(ADPProduct*) prod completionBlock:(void (^)(void)) completion errorBlock:(void (^)(void)) error {
    dispatch_queue_t serial_queue = dispatch_queue_create(
                                                      "my_queue", DISPATCH_QUEUE_SERIAL
                                                      );
    self.statusCode=200;
    dispatch_async(serial_queue, ^{
        self.prod=prod;
        
        sleep(5);
    });
    
    if (self.statusCode==200) {
        dispatch_async(serial_queue, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                completion();
            });
        });
    }else{
        dispatch_async(serial_queue, ^{
            dispatch_async(dispatch_get_main_queue(), ^{
                error();
            });

        });
    }


}

-(ADPProduct*)getProd{
    return self.prod;
}

-(NSInteger) getStatus{
    return self.statusCode;
}
@end
