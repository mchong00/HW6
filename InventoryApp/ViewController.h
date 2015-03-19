//
//  ViewController.h
//  InventoryApp
//
//  Created by Michael Chong on 3/5/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ConfigurableCoreDataStack.h"

@interface ViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate>

@property (weak) IBOutlet NSTableView *whyTableView;
@property (weak) IBOutlet NSButton *addButton;
@property (strong, nonatomic) NSMutableArray *array;
@property (strong, nonatomic) NSMutableArray *tagArray;
@property (strong, nonatomic) NSMutableArray *locationArray;
@property NSUInteger row;
-(void)reloadTable;
-(NSInteger)returnRow;
-(void)addItemWithTitle:(NSString*)title withTag:(NSString*)tag withLocation:(NSString*)location;
@end

