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
#import "Tag.h"
#import "Location.h"
#import "CoreDataChangeObserver.h"
#import "addViewController.h"
#import "displayViewController.h"

@interface ViewController ()

@property (strong, nonatomic) NSManagedObjectContext *moc;
@property (strong, nonatomic) NSArray *allItems;
@property (strong, nonatomic) NSArray *allTags;
@property (strong, nonatomic) NSArray *allLocations;
@property (strong, nonatomic) NSFetchRequest *fr;
@property (strong, nonatomic) NSFetchRequest *tagFr;
@property (strong, nonatomic) NSFetchRequest *locationFr;
@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.whyTableView.delegate = self;
    self.whyTableView.dataSource = self;
    [self.whyTableView setDoubleAction:@selector(doubleClick:)];
    
    CoreDataStackConfiguration *config = [CoreDataStackConfiguration new];
    config.storeType = NSSQLiteStoreType;
    
    //For testing purposes
    //config.storeType = NSInMemoryStoreType;
    
    config.modelName = @"InventoryModel";
    config.appIdentifier = @"com.michaelchong.example.inventory";
    config.dataFileNameWithExtension = @"InventoryDB11.sqlite";
    config.searchPathDirectory = NSApplicationSupportDirectory;
    
    ConfigurableCoreDataStack *stack = [[ConfigurableCoreDataStack alloc ] initWithConfiguration:config];
    self.moc = stack.managedObjectContext;
    
    [self reloadTable];
    
}

-(NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row
{
    NSTableCellView *cell = [self.whyTableView makeViewWithIdentifier:@"Cell" owner:nil];
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
    
    NSStoryboard *sb = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    NSViewController *vc = [sb instantiateControllerWithIdentifier:@"addViewController"];
    [self presentViewControllerAsSheet:vc];
}

-(void)addItemWithTitle:(NSString*)title withTag:(NSString*)tag withLocation:(NSString*)location
{
    Item *item = [Item createInMoc:self.moc];
    item.title = title;
    
    Tag *tagItem = [Tag createInMoc:self.moc];
    tagItem.tag = tag;

    Location *locationItem = [Location createInMoc:self.moc];
    locationItem.address = location;
    
    NSError *saveError = nil;
    BOOL success = [self.moc save:&saveError];
    if (!success) {
        [[NSApplication sharedApplication] presentError:saveError];
    }
}

-(void)reloadTable{
    [self fetchData];
    [self.whyTableView reloadData];
}

-(void)fetchData {
    self.fr = [NSFetchRequest fetchRequestWithEntityName:@"Item"];
    self.tagFr = [NSFetchRequest fetchRequestWithEntityName:@"Tag"];
    self.locationFr = [NSFetchRequest fetchRequestWithEntityName:@"Location"];
    
    NSError *fetchError = nil;
    self.allItems = [self.moc executeFetchRequest:self.fr error:&fetchError];
    self.allTags = [self.moc executeFetchRequest:self.tagFr error:&fetchError];
    self.allLocations = [self.moc executeFetchRequest:self.locationFr error:&fetchError];
    self.array = [self.allItems valueForKey:@"title"];
    self.tagArray = [self.allTags valueForKey:@"tag"];
    self.locationArray = [self.allLocations valueForKey:@"address"];
    
    //    NSLog(@"allItems are: %@", self.allItems);
}

-(void)doubleClick:(id)object {
    NSStoryboard *sb2 = [NSStoryboard storyboardWithName:@"Main" bundle:nil];
    NSViewController *vc2 = [sb2 instantiateControllerWithIdentifier:@"displayViewController"];
    [self presentViewControllerAsSheet:vc2];
}

-(NSInteger)returnRow {
    NSInteger index = [self.whyTableView selectedRow];
    return index;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
