//
//  MapViewViewController.h
//  AddressBookMashup
//
//  Created by Andrew McCallum14 on 2013-05-27.
//  Copyright (c) 2013 Andrew McCallum. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "Contact.h"
#import "CelebHouse.h"

@interface MapViewViewController : UIViewController <MKMapViewDelegate>

@property (strong, nonatomic) Contact *selectedPerson;

@end
