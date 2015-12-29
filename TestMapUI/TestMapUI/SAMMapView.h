//
//  SAMMapView.h
//  TestMapUI
//
//  Created by Wildcard on 12/28/15.
//  Copyright © 2015 Wildcard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>



@protocol SAMMapViewDelegate

@optional
- (void) wantsToAnimateMap;
- (void) wantsToShrinkMap;

@end

@interface SAMMapView : UIView

@property (strong, nonatomic) MKMapView *mapView;
@property (strong, nonatomic) UILabel   *placeTitle;
@property (strong, nonatomic) UILabel   *placeDescription;
@property (strong, nonatomic) UIButton  *expand;
@property (strong, nonatomic) UIButton  *viewInMaps;
@property (strong, nonatomic) UIView    *colorPatch;
@property (strong, nonatomic) UIButton  *deepLinkButton;
@property (strong, nonatomic) UIView    *lineView;
@property (weak) UIViewController <SAMMapViewDelegate> *delegate;

- (void) animateConstraints;


@end
