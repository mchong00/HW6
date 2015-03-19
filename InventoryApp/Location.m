//
//  Location.m
//  InventoryApp
//
//  Created by Michael Chong on 3/18/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "Location.h"

@implementation Location

@dynamic address;
@dynamic city;
@dynamic state;
@dynamic zipcode;

+(instancetype)createInMoc:(NSManagedObjectContext *)moc{
    Location *ii = [NSEntityDescription insertNewObjectForEntityForName:@"Location" inManagedObjectContext:moc];
    return ii;
}



@end