//
//  ios_a_threeMasterViewController.m
//  ios_a_three
//
//  Created by Matthew Swann on 7/18/14.
//  Copyright (c) 2014 xmera. All rights reserved.
//

#import "ios_a_threeMasterViewController.h"

#import "ios_a_threeDetailViewController.h"

@interface ios_a_threeMasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation ios_a_threeMasterViewController


/**
 Pre-packaged update logic.
 */
-(void) viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    UITableView *view = (UITableView *) self.view;
    [view reloadData];
    
} // end viewWillAppear()


- (void)awakeFromNib
{
    [super awakeFromNib];
}


/**
 Override logic for setEditing function. 
 
 Blueprint for this function was found through the developer.apple.com
 site.
 */
- (void)setEditing:(BOOL)flag animated:(BOOL)animated {
    
    [super setEditing:flag animated:animated];
    
    if (flag == YES){
        self.editButtonItem.title = @"done";
        
    }
    else {
        
        self.editButtonItem.title = @"remove";
    }
} // end setEditing()



- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.editButtonItem.title = @"remove";
    
    // Just because I can....
    [[self navigationItem] setBackBarButtonItem:[[UIBarButtonItem alloc] initWithTitle:@"done" style:UIBarButtonItemStylePlain target:nil action:nil]];
    
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    
    self.navigationItem.rightBarButtonItem = addButton;
    
    
} // end viewDidLoad()


- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
} // end didReceiveMemoryWarning


- (void)insertNewObject:(id)sender {
    
    // if uninitialized
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    
    NSMutableDictionary *myDict = [[NSMutableDictionary alloc] init];
    
    [myDict setObject:@"{ enter title }" forKey:@"text"];
    [myDict setObject:@"{ enter issue }" forKey:@"issueText"];
    [myDict setObject:@"{ enter publisher }" forKey:@"publisherText"];
    [myDict setObject:@"{ enter illustrator }" forKey:@"illustratorText"];
    [myDict setObject:@"{ enter writer }" forKey:@"writerText"];
    [myDict setObject:@"{ enter inker }" forKey:@"inkerText"];
    
    [_objects insertObject:myDict atIndex:0];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    
    [self performSegueWithIdentifier:@"showDetail" sender:self];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count;
}


/**
 Cell mods. Not currently working with issue number
 */
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NSMutableDictionary *myDict = _objects[indexPath.row];
    cell.textLabel.text = [myDict objectForKey:@"text"];
    cell.detailTextLabel.text = [myDict objectForKey:@"issueText"];
    return cell;
} // end cellForRowAtIndexPath()


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{

    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        [_objects removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
    
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSMutableDictionary *object = _objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

@end
