//
//  Item.h
//  InventoryApp
//
//  Created by Michael Chong on 3/5/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Item : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSData * date;
@property (nonatomic, retain) NSNumber * price;

+(instancetype)createInMoc:(NSManagedObjectContext*)moc;

@end
