//
//  addViewController.m
//  InventoryApp
//
//  Created by Michael Chong on 3/18/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "addViewController.h"
#import "ViewController.h"
#import "Item.h"

@class ViewController;

@interface addViewController () <NSTextFieldDelegate>
@property (weak)IBOutlet NSTextField *inputTextField;
@property (weak)IBOutlet NSTextField *inputTagField;
@property (weak)IBOutlet NSTextField *inputAddressField;

@end

@implementation addViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  //  self.inputTextField.delegate = self;
}


- (IBAction)submitClicked:(id)sender {
    
    NSString *titleText = self.inputTextField.stringValue;
    NSString *tagText = self.inputTagField.stringValue;
    NSString *addressText = self.inputAddressField.stringValue;
    
    ViewController *view = (ViewController *)self.presentingViewController;
    [view addItemWithTitle:titleText withTag:tagText withLocation:addressText];
    [view reloadTable];

    [self dismissController:self];
    
    
}




@end
