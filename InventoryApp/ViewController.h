//
//  ViewController.h
//  InventoryApp
//
//  Created by Michael Chong on 3/5/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "ConfigurableCoreDataStack.h"

@interface ViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate, NSTextFieldDelegate>

@property (weak) IBOutlet NSTableView *myTableView;
@property (weak) IBOutlet NSTextField *inputTextField;
@property (weak) IBOutlet NSButton *addButton;
@property (strong, nonatomic) NSMutableArray *array;
@property NSUInteger row;
-(void)reloadTable;
-(void)addItemWithTitle:(NSString*)title withTag:(NSString*)tag withLocation:(NSString*)location;
@end

