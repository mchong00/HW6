//
//  displayViewController.m
//  InventoryApp
//
//  Created by Michael Chong on 3/19/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "displayViewController.h"
#import "ViewController.h"

@interface displayViewController () <NSTextFieldDelegate>
@property (weak)IBOutlet NSTextField *displayTextField;
@property (weak)IBOutlet NSTextField *displayTagField;
@property (weak)IBOutlet NSTextField *displayAddressField;
@end

@implementation displayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    
    NSString *titleText = self.displayTextField.stringValue;
    NSString *tagText = self.displayTagField.stringValue;
    NSString *addressText = self.displayAddressField.stringValue;
    
    ViewController *view = (ViewController *)self.presentingViewController;
    [view addItemWithTitle:titleText withTag:tagText withLocation:addressText];
    titleText = [view.array objectAtIndex:1];
    [view reloadTable];
    
    
}


- (IBAction)closeClicked:(id)sender {
    [self dismissController:self];
}

@end
