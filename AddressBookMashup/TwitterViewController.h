//
//  TwitterViewController.h
//  AddressBookMashup
//
//  Created by Andrew McCallum14 on 2013-05-27.
//  Copyright (c) 2013 Andrew McCallum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Contact.h"


@interface TwitterViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tweetTableView;
//this will contain tweets returned by twitter api
@property (strong, nonatomic) Contact *selectedContact;


@end
