//
//  SearchCommunicator.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/11/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "SearchCommunicator.h"
#import "SearchCommunicatorDelegate.h"

@implementation SearchCommunicator

- (void)searchWithText:(NSString*)input
{
    NSString * planeInput=[input stringByReplacingOccurrencesOfString:@" " withString:@"%20"];
    NSString *urlAsString = [NSString stringWithFormat:@"https://api.mercadolibre.com/sites/MLA/search?q=%@",planeInput];
    NSURL *url = [[NSURL alloc] initWithString:urlAsString];
    NSLog(@"%@", urlAsString);
    
    [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
        
        if (error) {
            [self.delegate fetchingItemsFailedWithError:error];
        } else {
            [self.delegate receivedItemsJSON:data];
        }
    }];
}

@end
