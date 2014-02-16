//
//  NTJViewController.m
//  NTJJavaScriptCoreLogicSample
//
//  Created by joshua may on 15/02/2014.
//  Copyright (c) 2014 notjosh, inc. All rights reserved.
//

#import "NTJViewController.h"

#import "NTJThingFinderService.h"
#import "NTJThing.h"

@interface NTJViewController () <UITableViewDataSource, UITableViewDelegate, NTJThingFinderServiceDelegate>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NTJThingFinderService *thingFinderService;

@end

@implementation NTJViewController

#pragma mark - Table Delegates

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.thingFinderService.things.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NTJThing *thing = self.thingFinderService.things[indexPath.section];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = thing.title;
    cell.detailTextLabel.text = thing.body;
    return cell;
}

#pragma mark - NTJApplicationThingDelegate

- (void)applicationThing:(NTJThingFinderService *)applicationThing foundTreasureAtIndexes:(NSIndexSet *)indexes
{
    [self.tableView beginUpdates];
    [self.tableView insertSections:indexes withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}

- (void)applicationThing:(NTJThingFinderService *)applicationThing zappedTreasureAtIndexes:(NSIndexSet *)indexes
{
    [self.tableView beginUpdates];
    [self.tableView deleteSections:indexes withRowAnimation:UITableViewRowAnimationAutomatic];
    [self.tableView endUpdates];
}

#pragma mark - Accessors

- (NTJThingFinderService *)thingFinderService
{
    if (nil == _thingFinderService) {
        _thingFinderService = [[NTJThingFinderService alloc] init];
        _thingFinderService.delegate = self;
    }

    return _thingFinderService;
}

#pragma mark - Actions

- (IBAction)handleTreasureHuntTapped:(id)sender
{
    [self.thingFinderService treasureHunt];
}

- (IBAction)handleZapTapped:(id)sender
{
    [self.thingFinderService zap];
}

@end
