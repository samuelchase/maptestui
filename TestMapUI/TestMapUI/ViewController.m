//
//  ViewController.m
//  TestMapUI
//
//  Created by Wildcard on 12/28/15.
//  Copyright © 2015 Wildcard. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "SAMMapView.h"

@interface ViewController ()

@property MKMapView *mapView;
@property SAMMapView *smapView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view setTranslatesAutoresizingMaskIntoConstraints:NO];

    
    UIView* subview = [[UIView alloc] init];
    subview.backgroundColor = [UIColor whiteColor];
    subview.clipsToBounds = YES;
    [subview setTranslatesAutoresizingMaskIntoConstraints:NO];
    
    // border radius
    [subview.layer setCornerRadius:10.0f];
    
    // border
    [subview.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [subview.layer setBorderWidth:1.5f];
    
    // drop shadow
    [subview.layer setShadowColor:[UIColor blackColor].CGColor];
    [subview.layer setShadowOpacity:0.8];
    [subview.layer setShadowRadius:1.0];
    [subview.layer setShadowOffset:CGSizeMake(2.0, 2.0)];
    
    [self.view addSubview:subview];
    
    
    NSMutableDictionary *items = [[NSMutableDictionary alloc] init];
    [items setValue:subview forKey:@"subview"];
    
    NSArray *constraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-offsetTop-[subview]" options:0 metrics:@{@"offsetTop": @100} views:items];
    
    NSArray *constraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[subview]-offsetRight-|" options:0 metrics:@{@"offsetLeft": @20, @"offsetRight":@20} views:items];
    
    [self.view addConstraints:constraints];
    [self.view addConstraints:constraints2];
    
    
    NSArray *constraints3 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[subview(==470)]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:items];
    [self.view addConstraints:constraints3];
    
    self.smapView = [[SAMMapView alloc] init];
    [self.smapView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.smapView.delegate = self;
    [subview addSubview:self.smapView];
    
    NSMutableDictionary *mapItems = [[NSMutableDictionary alloc] init];
    [mapItems setValue:self.smapView forKey:@"mapview"];
    
    NSArray *mapConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-offsetTop-[mapview]" options:0 metrics:@{@"offsetTop": @0} views:mapItems];
    
    NSArray *mapConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[mapview]-offsetRight-|" options:0 metrics:@{@"offsetLeft": @0, @"offsetRight":@0} views:mapItems];
    
    [self.view addConstraints:mapConstraints];
    [self.view addConstraints:mapConstraints2];
    
    [subview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[mapview(==470)]"
                                                                          options:0
                                                                          metrics:nil
                                                                          views:mapItems]];
    
    
//    self.mapView = [[MKMapView alloc] init];
//    [self.mapView setTranslatesAutoresizingMaskIntoConstraints:NO];
//    
////    [mapView.layer setCornerRadius:10.0f];
//
//    
//    [subview addSubview:self.mapView];
//    
//    NSMutableDictionary *mapItems = [[NSMutableDictionary alloc] init];
//    [mapItems setValue:self.mapView forKey:@"mapview"];
//    
//    NSArray *mapConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-offsetTop-[mapview]" options:0 metrics:@{@"offsetTop": @0} views:mapItems];
//    
//    NSArray *mapConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[mapview]-offsetRight-|" options:0 metrics:@{@"offsetLeft": @0, @"offsetRight":@0} views:mapItems];
//    
//    [self.view addConstraints:mapConstraints];
//    [self.view addConstraints:mapConstraints2];
//    
//    [subview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[mapview(==400)]"
//                                                                      options:0
//                                                                      metrics:nil
//                                                                        views:mapItems]];
    
    
}

- (void) wantsToAnimateMap {
    [self.smapView animateConstraints];
}

- (void)viewDidLayoutSubviews {
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.mapView.bounds
//                                                   byRoundingCorners:(UIRectCornerTopLeft|UIRectCornerTopRight)
//                                                         cornerRadii:CGSizeMake(3.0, 3.0)];
//    
//    // Create the shape layer and set its path
//    CAShapeLayer *maskLayer = [CAShapeLayer layer];
//    maskLayer.frame = self.mapView.bounds;
//    maskLayer.path = maskPath.CGPath;
    
    // Set the newly created shape layer as the mask for the image view's layer
//    [[self.mapView layer] setMask:maskLayer];
//    self.mapView.layer.masksToBounds = YES;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
