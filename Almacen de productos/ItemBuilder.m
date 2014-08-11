//
//  GroupBuilder.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/11/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ItemBuilder.h"
#import "SearchItem.h"

@implementation ItemBuilder
+ (NSArray *)itemsFromJSON:(NSData *)objectNotation error:(NSError **)error
{
    NSError *localError = nil;
    NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
    
    if (localError != nil) {
        *error = localError;
        return nil;
    }
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    
    NSArray *results = [parsedObject valueForKey:@"results"];
    NSLog(@"Count %d", results.count);
    
    for (NSDictionary *itemDic in results) {
        SearchItem *item = [[SearchItem alloc] init];
        
        for (NSString *key in itemDic) {
            if ([item respondsToSelector:NSSelectorFromString(key)]) {
                [item setValue:[itemDic valueForKey:key] forKey:key];
            }
        }
        [items addObject:item];
    }
    
    return items;
}
@end
