//
//  displayViewController.m
//  InventoryApp
//
//  Created by Michael Chong on 3/19/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "displayViewController.h"
#import "ViewController.h"
#import "item.h"
#import <Foundation/Foundation.h>

@interface displayViewController () <NSTextFieldDelegate>
@property (weak)IBOutlet NSTextField *displayTextField;
@property (weak)IBOutlet NSTextField *displayTagField;
@property (weak)IBOutlet NSTextField *displayAddressField;
@property (weak)IBOutlet NSButton *displayMaps;
@property NSString *url;
@end

@implementation displayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.

    ViewController *view = (ViewController *)self.presentingViewController;
    [self.displayTextField setStringValue:[view.array objectAtIndex:[view returnRow]]];
    [self.displayTagField setStringValue:[view.tagArray objectAtIndex:[view returnRow]]];
    
    self.url = [view.locationArray objectAtIndex:[view returnRow]];
    
    if (self.url == nil || [self.url length]==0 || [self.url isEqualToString:@""] || [self.url isEqualToString:@"N/A"]) {
        self.displayMaps.hidden = YES;}
    else{
        self.displayMaps.hidden = NO;
    }
    
    [self.displayAddressField setStringValue:[view.locationArray objectAtIndex:[view returnRow]]];
    
    
    //NSLog(@"%@", self.url);
    [view reloadTable];
    
    
}
- (IBAction)mapsClicked:(id)sender {
    
    NSString *newString = [NSString stringWithFormat:@"%@%@", @"http://maps.google.com/maps?saddr=", self.url];
    
    NSString *sUrl = [newString stringByAddingPercentEscapesUsingEncoding:NSASCIIStringEncoding];
    
    NSURL* url = [NSURL URLWithString:sUrl];
    [[NSWorkspace sharedWorkspace] openURLs:@[url]
                    withAppBundleIdentifier:@"com.apple.Safari"
                                    options:NSWorkspaceLaunchDefault
             additionalEventParamDescriptor:nil
                          launchIdentifiers:nil];
    
    
}

- (IBAction)closeClicked:(id)sender {
    [self dismissController:self];
}

@end
