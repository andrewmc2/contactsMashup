//
//  MapViewViewController.m
//  AddressBookMashup
//
//  Created by Andrew McCallum14 on 2013-05-27.
//  Copyright (c) 2013 Andrew McCallum. All rights reserved.
//

#import "MapViewViewController.h"


@interface MapViewViewController ()

@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewViewController

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
    MKCoordinateSpan span = MKCoordinateSpanMake(0.15, 0.15);
    CLLocationCoordinate2D center = CLLocationCoordinate2DMake(self.selectedPerson.location.latitude, self.selectedPerson.location.longitude);
    MKCoordinateRegion region = MKCoordinateRegionMake(center, span);
    self.mapView.region = region;
    [self displayPins];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)displayPins
{
    CelebHouse *celebHouse = [[CelebHouse alloc] init];
    celebHouse.title = @"yo";
    celebHouse.coordinate = self.selectedPerson.location;
    [self.mapView addAnnotation:celebHouse];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id < MKAnnotation >)annotation
{
    NSString *reuseID = @"reuseID";
    MKAnnotationView *annotationView = [self.mapView dequeueReusableAnnotationViewWithIdentifier:reuseID];
    if (annotationView == nil) {
        annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:reuseID];
        ((MKPinAnnotationView*)(annotationView)).animatesDrop = YES;
    } else {
        annotationView.annotation = annotation;
    }
return annotationView;
}

@end
