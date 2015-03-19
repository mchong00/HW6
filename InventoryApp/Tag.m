//
//  Tag.m
//  InventoryApp
//
//  Created by Michael Chong on 3/18/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "Tag.h"


@implementation Tag

@dynamic tag;

+(instancetype)createInMoc:(NSManagedObjectContext *)moc{
    Tag *ii = [NSEntityDescription insertNewObjectForEntityForName:@"Tag" inManagedObjectContext:moc];
    return ii;
}



@end