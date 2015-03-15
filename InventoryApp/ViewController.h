//
//  ViewController.h
//  InventoryApp
//
//  Created by Michael Chong on 3/5/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController <NSTableViewDataSource, NSTableViewDelegate, NSTextFieldDelegate>

@property (weak) IBOutlet NSTableView *theTableView2;
@property (weak) IBOutlet NSTextField *inputTextField;

@property (weak) IBOutlet NSButton *addButton;

@end

