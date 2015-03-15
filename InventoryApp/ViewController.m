//
//  ViewController.m
//  InventoryApp
//
//  Created by Michael Chong on 3/5/15.
//  Copyright (c) 2015 Michael Chong. All rights reserved.
//

#import "ViewController.h"
#import "ConfigurableCoreDataStack.h"
#import "Item.h"
#import "CoreDataChangeObserver.h"

@interface ViewController ()

@property (strong, nonatomic) NSManagedObjectContext *moc;
@property (strong, nonatomic) NSArray *allItems;
@property (strong, nonatomic) NSFetchRequest *fr;
@property (strong, nonatomic) NSMutableArray *array;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.theTableView2.delegate = self;
    self.theTableView2.dataSource = self;
    self.inputTextField.delegate = self;
    
    CoreDataStackConfiguration *config = [CoreDataStackConfiguration new];
    config.storeType = NSSQLiteStoreType;
    
    //For testing purposes
    //config.storeType = NSInMemoryStoreType;
    
    config.modelName = @"InventoryModel";
    config.appIdentifier = @"com.michaelchong.example.inventory";
    config.dataFileNameWithExtension = @"InventoryDB5.sqlite";
    config.searchPathDirectory = NSApplicationSupportDirectory;
    
    ConfigurableCoreDataStack *stack = [[ConfigurableCoreDataStack alloc ] initWithConfiguration:config];
    self.moc = stack.managedObjectContext;
    
    [self fetchData];
    [self.theTableView2 reloadData];
    
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *cell = [tableView makeViewWithIdentifier:@"Cell" owner:nil];
   
    [self fetchData];
    cell.textField.stringValue = [self.array objectAtIndex:row];
 
    
    //NSLog(@"array count is: %lu", (unsigned long)[self.array count]);
    return cell;
}

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView
{
    return [self.array count];
}

- (IBAction)addButton:(id)sender {
    Item *item = [Item createInMoc:self.moc];
    item.title = self.inputTextField.stringValue;
    
    NSError *saveError = nil;
    BOOL success = [self.moc save:&saveError];
    if (!success) {
        [[NSApplication sharedApplication] presentError:saveError];
    }
    
    self.inputTextField.stringValue = @"";
    [self fetchData];
    [self.theTableView2 reloadData];
    
}


-(void)fetchData {
    self.fr = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
//  self.fr.propertiesToFetch = @[ @"title"];
//  self.fr.resultType = NSDictionaryResultType;
    
    NSError *fetchError = nil;
    self.allItems = [self.moc executeFetchRequest:self.fr error:&fetchError];
//    NSLog(@"allItems are: %@", self.allItems);
    self.array = [self.allItems valueForKey:@"title"];
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
