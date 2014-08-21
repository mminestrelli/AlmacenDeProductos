//
//  ADPDaoFileSystem.m
//  Almacen de productos
//
//  Created by Mauricio Minestrelli on 8/21/14.
//  Copyright (c) 2014 Mercadolibre. All rights reserved.
//

#import "ADPDaoFileSystem.h"

@implementation ADPDaoFileSystem

-(void)syncronizeCache:(NSMutableArray*) products{
    [NSKeyedArchiver archiveRootObject:products toFile:[self getCacheFilePath]];
}

-(NSMutableArray*) getProducts{
    NSMutableArray * prodsFromFile=[NSKeyedUnarchiver unarchiveObjectWithFile:[self getCacheFilePath]];
    return prodsFromFile;
}

-(NSString*) getCacheFilePath{
    /*Library folder, where you store configuration files and writable databases that you also want to keep around, but you don't want the user to be able to mess with through iTunes*/
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSString *file = [libraryDirectory stringByAppendingPathComponent:@"cache.txt"];
    return file;
}

@end
