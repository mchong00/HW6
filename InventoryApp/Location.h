//
//  Location.h
//  InventoryApp
//
//  Created by Michael Chong on 3/18/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Location : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * state;
@property (nonatomic, retain) NSString * zipcode;

+(instancetype)createInMoc:(NSManagedObjectContext*)moc;

@end