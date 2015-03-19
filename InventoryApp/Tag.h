//
//  Tag.h
//  InventoryApp
//
//  Created by Michael Chong on 3/18/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@interface Tag : NSManagedObject

@property (nonatomic, retain) NSString * tag;

+(instancetype)createInMoc:(NSManagedObjectContext*)moc;

@end