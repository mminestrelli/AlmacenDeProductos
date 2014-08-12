//
//  ADPService.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/7/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ADPService.h"
@interface ADPService()


@end

@implementation ADPService

/*Run the service in another thread with callback serviceDidFinish in main queue*/


-(void) startRequestWithProduct:(ADPProduct*) prod
{
    
    dispatch_async(dispatch_get_global_queue( DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        self.prod=prod;
        NSUInteger statusCode = [self createStatusCode];
        sleep(5);
        if (statusCode >= 200 && statusCode < 400){
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate serviceDidFinish];
            });
        }
        else{
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.delegate serviceDidFinishWithError];
            });
        }
    });
    
}


-(NSUInteger) createStatusCode{
    
    static NSUInteger counter  = 0;
    
    if (counter++ % 2){
        return 200;
    }
    else{
        return 400;
    }
    
}
/*Run request with blocks. Execute the service core in a custom serial queue  and after that executes completion or error blocks secuentially respect the service core but in main thread*/
-(void) runRequestWithProduct:(ADPProduct*) prod completionBlock:(void (^)(void)) completion errorBlock:(void (^)(void)) error {
 
    // self.statusCode=200;
    self.prod=prod;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{

        //Concatenacion de data
        sleep(5);
        
        NSUInteger statusCode = [self createStatusCode];
        
        //Ok el request
        if (statusCode >= 200 && statusCode < 400){
            dispatch_async(dispatch_get_main_queue(), ^{
                completion();
            });
        }
        //Fail de request
        else{
            
            dispatch_async(dispatch_get_main_queue(), ^{
                error();
            });

            
        }
        
        
        
    });
    
    
    
}


@end
