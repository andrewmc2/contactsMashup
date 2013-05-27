//
//  ViewController.m
//  AddressBookMashup
//
//  Created by Andrew McCallum14 on 2013-05-27.
//  Copyright (c) 2013 Andrew McCallum. All rights reserved.
//

#import "ViewController.h"
#import "Contact.h"
#import "ViewContactViewController.h"

@interface ViewController ()
{
    ViewContactViewController *viewContactViewController;
    NSIndexPath *selectedIndexPath;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray *contactArray;
@property (strong, nonatomic) Contact *selectedContact;


@end

@implementation ViewController

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"viewContact"]) {
        viewContactViewController = [segue destinationViewController];
        Contact *indexContact = [self.contactArray objectAtIndex:[self.tableView indexPathForSelectedRow].row];
        [viewContactViewController setSelectedContact:indexContact];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self createPeopleObjects];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark create People objects
-(void)createPeopleObjects
{
    self.contactArray = [NSMutableArray array];
    
    Contact *contact = [[Contact alloc] init];
    contact.firstName = @"Kobe";
    contact.lastName = @"Bryant";
    contact.email = @"kobe@gmail.com";
    contact.address = @"150 S Rodeo Dr, Beverly Hills, CA 90212";
    contact.phone = @"310 555 5555";
    contact.twitter = @"kobebryant";
    contact.picture = [UIImage imageNamed:@"kobe.png"];
    [self.contactArray addObject:contact];
    
    contact = [[Contact alloc] init];
    contact.firstName = @"Kim";
    contact.lastName = @"Kardashian";
    contact.email = @"kim@gmail.com";
    contact.address = @"12900 Mulholland Dr, Beverly Hills, CA 90210";
    contact.phone = @"310 555 6666";
    contact.twitter = @"KimKardashian";
    contact.picture = [UIImage imageNamed:@"kim.png"];
    [self.contactArray addObject:contact];
    
    contact = [[Contact alloc] init];
    contact.firstName = @"Kanye";
    contact.lastName = @"West";
    contact.email = @"kanye@gmail.com";
    contact.address = @"516 W Briar Pl, Chicago, IL 60657";
    contact.phone = @"773 555 5555";
    contact.twitter = @"kanyewet";
    contact.picture = [UIImage imageNamed:@"kanye.png"];
    [self.contactArray addObject:contact];
}

#pragma mark UITableViewDataSourceMethods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cell";
    self.selectedContact = self.contactArray[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",self.selectedContact.firstName, self.selectedContact.lastName];
    cell.imageView.image = self.selectedContact.picture;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.contactArray.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    selectedIndexPath = indexPath;
}

@end
