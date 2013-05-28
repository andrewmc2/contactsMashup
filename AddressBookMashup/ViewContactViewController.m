//
//  ViewContactViewController.m
//  AddressBookMashup
//
//  Created by Andrew McCallum14 on 2013-05-27.
//  Copyright (c) 2013 Andrew McCallum. All rights reserved.
//

#import "ViewContactViewController.h"
#import "TwitterViewController.h"
#import "MapViewViewController.h"

@interface ViewContactViewController ()
{
    TwitterViewController *twitterViewController;
    MapViewViewController *mapViewController;
}
@property (weak, nonatomic) IBOutlet UIImageView *contactBigImage;

@end

@implementation ViewContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"viewTwitter"]) {
        twitterViewController = [segue destinationViewController];
        [twitterViewController setSelectedContact:self.selectedContact];
        NSLog(@"viewTwitter");
    }
    
    if ([segue.identifier isEqualToString:@"mapPush"]) {
        mapViewController = [segue destinationViewController];
        [mapViewController setSelectedPerson:self.selectedContact];
        NSLog(@"mapPush");
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.contactBigImage.image = self.selectedContact.picture;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDataSourceMethods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"viewCell";
    UITableViewCell *cell;
//    UITableViewCell *addressCell = [tableView dequeueReusableCellWithIdentifier:@"mapPush"];
//    if (cell == nil){
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
//    }

    
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        cell.textLabel.text = @"name";
        cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", self.selectedContact.firstName, self.selectedContact.lastName];
    }

    if (indexPath.row == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        cell.textLabel.text = @"twitter";
        cell.detailTextLabel.text = self.selectedContact.twitter;
    }
    
    if (indexPath.row == 2) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"mapPush"];
        cell.textLabel.text = @"address";
        cell.detailTextLabel.text = self.selectedContact.address;
    }
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        NSLog(@"twitter");
    }
}



@end
