//
//  ADPService.h
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/7/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ADPProduct.h"
@protocol ADPServiceDelegate <NSObject>
-(void) serviceDidFinish;
-(void) serviceDidFinishWithError;
@end

@interface ADPService : NSObject
- (void)startRequestWithProduct:(ADPProduct*) prod;
-(void) runRequestWithProduct:(ADPProduct*) prod completionBlock:(void (^)(void)) completion errorBlock:(void (^)(void)) error ;
@property(nonatomic,weak) id<ADPServiceDelegate>   delegate;
@property (nonatomic,strong) ADPProduct * prod;

@end
