//
//  MainMenuViewController.m
//  CatchMe
//
//  Created by Dean on 20/03/2014.
//  Copyright (c) 2014 Dean. All rights reserved.
//

#import "MainMenuViewController.h"
#import "TestModel.h"

@interface MainMenuViewController () <CLLocationManagerDelegate>

@end

@implementation MainMenuViewController
{
    CLLocationManager *manager;
    CLPlacemark *placemark;
}
@synthesize longitude = _longitude;
@synthesize latitude = _latitude;

- (NSString*) longitude
{
    if (!_longitude){
        _longitude = [[NSString alloc] init];
    }
    return _longitude;
}

- (NSString*) latitude
{
    if (!_latitude){
        _latitude = [[NSString alloc] init];
    }
    return _latitude;
}

- (IBAction)CatchMeOnClick:(id)sender {
    manager.delegate = self; //Delegate manager
    manager.desiredAccuracy = kCLLocationAccuracyBest; //Get most accurate location possible
    [manager startUpdatingLocation]; //start getting the location!
    
    if (_latitude == nil)
        NSLog(@"Wait: coordinates not retrieved");
    else
    {
        TestModel *testModel = [[TestModel alloc] init];
        [testModel sendLocation:self.latitude :self.longitude];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    manager = [[CLLocationManager alloc] init]; //When page loads create a new manager.
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", error);
    NSLog(@"Failed to get location! :(");
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    //NSLog(@"Location: %@", [locations lastObject]);
    
    //Get the latest CLLocation object from the array
    CLLocation *currentLocation = [locations lastObject];
    
    if (locations != nil) {
        self.latitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        self.longitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
    }
}

@end
