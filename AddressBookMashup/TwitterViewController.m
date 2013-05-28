//
//  TwitterViewController.m
//  AddressBookMashup
//
//  Created by Andrew McCallum14 on 2013-05-27.
//  Copyright (c) 2013 Andrew McCallum. All rights reserved.
//

#import "TwitterViewController.h"

@interface TwitterViewController ()

@property (strong, nonatomic) NSMutableArray *tweetArray;
@property (strong, nonatomic) NSMutableArray *tweetDateArray;
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end

@implementation TwitterViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSLog(@"%@",self.selectedContact.twitter);
    NSString *twitterURL = [NSString stringWithFormat:@"http://api.twitter.com/1/statuses/user_timeline.json?screen_name=%@",self.selectedContact.twitter];
    NSURL *url = [NSURL URLWithString:twitterURL];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:urlRequest queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *urlRepsonse, NSData *data, NSError *error) {
        NSMutableArray *responseArray = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
        
        self.tweetArray = [NSMutableArray array];
        self.tweetDateArray = [NSMutableArray array];
        
        for (NSMutableDictionary *dict in responseArray) {
            NSString *tweet = [dict objectForKey:@"text"];
            [self.tweetArray addObject:tweet];
            NSString *tweetDate = [dict objectForKey:@"created_at"];
            [self.tweetDateArray addObject:tweetDate];
        }
        
        NSLog(@"%i",self.tweetArray.count);
        [self.tableView reloadData];
        
    }];
    
    NSLog(@"beofre load");
    
    NSLog(@"after load load");

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma UITableViewDataSourceMethods

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"twitterCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
    }
    
    cell.textLabel.text = 
    cell.detailTextLabel.text = [self.tweetArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.tweetArray.count;
}



@end
