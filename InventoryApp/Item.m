//
//  Item.m
//  InventoryApp
//
//  Created by Michael Chong on 3/5/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "Item.h"


@implementation Item

@dynamic title;

+(instancetype)createInMoc:(NSManagedObjectContext *)moc{
    Item *ii = [NSEntityDescription insertNewObjectForEntityForName:@"Item" inManagedObjectContext:moc];
    return ii;
}



@end
