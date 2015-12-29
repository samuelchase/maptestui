//
//  SAMMapView.m
//  TestMapUI
//
//  Created by Wildcard on 12/28/15.
//  Copyright © 2015 Wildcard. All rights reserved.
//

#import "SAMMapView.h"

@interface SAMMapView()

@property (nonatomic, strong) NSArray *mapViewHeightConstraints;
@property (nonatomic, strong) NSDictionary *viewItems;

@end


@implementation SAMMapView


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        
        self.backgroundColor = [UIColor whiteColor];
        self.mapView = [[MKMapView alloc] init];
        
        [self addAutoSubview:self.mapView];
        
        
        self.viewItems = [[NSMutableDictionary alloc] init];
        [self.viewItems setValue:self.mapView forKey:@"mapview"];
        
        NSArray *mapConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-offsetTop-[mapview]" options:0 metrics:@{@"offsetTop": @0} views:self.viewItems];
        
        NSArray *mapConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[mapview]-offsetRight-|" options:0 metrics:@{@"offsetLeft": @0, @"offsetRight":@0} views:self.viewItems];
        
        [self addConstraints:mapConstraints];
        [self addConstraints:mapConstraints2];
        
        self.mapViewHeightConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[mapview(==350)]"
                                                                        options:0
                                                                        metrics:nil
                                                                          views:self.viewItems];
        [self addConstraints:self.mapViewHeightConstraints];
        
        self.placeTitle = [[UILabel alloc] init];
        self.placeTitle.text = @"Guam";
        [self.placeTitle setFont: [UIFont fontWithName:@"Arial" size:14.0]];
        
        self.placeDescription = [[UILabel alloc] init];
        self.placeDescription.textColor = [UIColor lightGrayColor];
        self.placeDescription.text = @"Capital Hagatna \nContinent Oceania";
        self.placeDescription.numberOfLines = 2;
        self.placeDescription.lineBreakMode = NSLineBreakByWordWrapping;
        [self.placeDescription setFont: [UIFont fontWithName:@"Arial" size:12.0]];
        
        [self addAutoSubview:self.placeTitle];
        [self addAutoSubview:self.placeDescription];
        
        
//        NSMutableDictionary *titleItems = [[NSMutableDictionary alloc] init];
//        [titleItems setValue:self.placeTitle forKey:@"titleview"];
        [self.viewItems setValue:self.placeTitle forKey:@"titleview"];
        [self.viewItems setValue:self.placeDescription forKey:@"descrview"];
        
//        NSArray *titleConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleview]-offsetBottom-|" options:0 metrics:@{@"offsetBottom": @50} views:self.viewItems];
        
        NSArray *titleConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[mapview]-offsetBottom-[titleview]" options:0 metrics:@{@"offsetBottom": @15} views:self.viewItems];
       
        NSArray *titleConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[titleview]" options:0 metrics:@{@"offsetLeft": @15} views:self.viewItems];
        
        
        [self addConstraints:titleConstraints];
        [self addConstraints:titleConstraints2];
        
        NSArray *descrConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleview]-offsetBottom-[descrview]" options:0 metrics:@{@"offsetBottom": @0} views:self.viewItems];
        
        NSArray *descrConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[descrview]" options:0 metrics:@{@"offsetLeft": @15} views:self.viewItems];
        
        [self addConstraints:descrConstraints];
        [self addConstraints:descrConstraints2];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[descrview(==200)]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:self.viewItems]];
        
//        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleview(==400)]"
//                                                                     options:0
//                                                                     metrics:nil
//                                                                       views:self.viewItems]];
        
        self.lineView = [[UIView alloc] init];
        self.lineView.backgroundColor = [UIColor lightGrayColor];
        [self addAutoSubview:self.lineView];

        
        [self.viewItems setValue:self.lineView forKey:@"lineview"];
        
        NSArray *lineConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[descrview]-offsetTop-[lineview]" options:0 metrics:@{@"offsetTop": @10} views:self.viewItems];
        
        NSArray *lineConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[lineview]-offsetRight-|" options:0 metrics:@{@"offsetLeft": @0, @"offsetRight":@0} views:self.viewItems];
        
        [self addConstraints:lineConstraints];
        [self addConstraints:lineConstraints2];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineview(==1)]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:self.viewItems]];
        

        
        self.colorPatch = [[UIView alloc] init];
        [self.colorPatch setBackgroundColor:[UIColor orangeColor]];
        
        [self addAutoSubview:self.colorPatch];
        
        [self.viewItems setValue:self.colorPatch forKey:@"patchview"];
        
        
        
        NSArray *patchConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineview]-offsetTop-[patchview]" options:0 metrics:@{@"offsetTop": @10} views:self.viewItems];
        
        NSArray *patchConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"[patchview]-offsetRight-|" options:0 metrics:@{@"offsetRight": @130} views:self.viewItems];
        
        [self addConstraints:patchConstraints];
        [self addConstraints:patchConstraints2];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[patchview(==25)]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:self.viewItems]];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[patchview(==25)]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:self.viewItems]];
        
        
        self.deepLinkButton = [[UIButton alloc] init];
        [self.deepLinkButton setTitle:@"VIEW IN MAPS" forState:UIControlStateNormal];
        [self.deepLinkButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        self.deepLinkButton.layer.cornerRadius = 2; // this value vary as per your desire
        self.deepLinkButton.clipsToBounds = YES;
        
        [self addAutoSubview:self.deepLinkButton];
        
        [self.viewItems setValue:self.deepLinkButton forKey:@"deepview"];
        
        NSArray *deepLinkButtonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineview]-offsetTop-[deepview]" options:0 metrics:@{@"offsetTop": @10} views:self.viewItems];
        
        NSArray *deepLinkButtonConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"[patchview]-offsetLeft-[deepview]" options:0 metrics:@{@"offsetLeft": @3} views:self.viewItems];
        
        [self addConstraints:deepLinkButtonConstraints];
        [self addConstraints:deepLinkButtonConstraints2];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[deepview(==25)]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:self.viewItems]];
        
        MKLocalSearchRequest *localSearchRequest = [[MKLocalSearchRequest alloc] init];
        localSearchRequest.naturalLanguageQuery = @"Guam";
        MKLocalSearch *localSearch = [[MKLocalSearch alloc] initWithRequest:localSearchRequest];
        [localSearch startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
            if (!error) {
                for (MKMapItem *mapItem in [response mapItems]) {
                    NSLog(@"Name: %@, Placemark title: %@", [mapItem name], [[mapItem placemark] title]);
                    [self.mapView setCenterCoordinate:mapItem.placemark.location.coordinate animated:YES];
                    [self.mapView setZoomEnabled:YES];
                    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(mapItem.placemark.location.coordinate, 50000, 50000);
                    MKCoordinateRegion adjustedRegion = [self.mapView regionThatFits:viewRegion];
                    [self.mapView setRegion:adjustedRegion animated:YES];
                    self.mapView.showsUserLocation = NO;
                }
            } else {
                NSLog(@"Search Request Error: %@", [error localizedDescription]);
            }
        }];
        
        
        self.expand = [[UIButton alloc] init];
        [self.expand setTitle:@"EXPAND" forState:UIControlStateNormal];
        [self.expand setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [[self.expand layer] setBorderWidth:1.0f];
        [[self.expand layer] setBorderColor:[UIColor blueColor].CGColor];
        self.expand.layer.cornerRadius = 2; // this value vary as per your desire
//        self.expand.clipsToBounds = YES;
        self.expand.userInteractionEnabled = YES;
        
        [self.expand addTarget:self action:@selector(animateConstraints) forControlEvents:UIControlEventTouchUpInside];
        
        
        [self addAutoSubview:self.expand];
        
        [self.viewItems setValue:self.expand forKey:@"buttonview"];
        
        NSArray *buttonConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineview]-offsetTop-[buttonview]-offsetBottom-|" options:0 metrics:@{@"offsetTop": @10, @"offsetBottom": @10} views:self.viewItems];
        
        NSArray *buttonConstraints2 = [NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[buttonview]" options:0 metrics:@{@"offsetLeft": @15} views:self.viewItems];
        
        [self addConstraints:buttonConstraints];
        [self addConstraints:buttonConstraints2];
        [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonview(==25)]"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:self.viewItems]];
        
    }
    return self;
}

- (void)setConstraints {
    
    self.viewItems = [[NSMutableDictionary alloc] init];
    [self.viewItems setValue:self.mapView forKey:@"mapview"];
    [self.viewItems setValue:self.placeTitle forKey:@"titleview"];
    [self.viewItems setValue:self.placeDescription forKey:@"descrview"];
    [self.viewItems setValue:self.expand forKey:@"buttonview"];
    [self.viewItems setValue:self.colorPatch forKey:@"patchview"];
    [self.viewItems setValue:self.lineView forKey:@"lineview"];
    
    
    // Map View Constraints
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-offsetTop-[mapview]" options:0 metrics:@{@"offsetTop": @0} views:self.viewItems]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[mapview]-offsetRight-|" options:0 metrics:@{@"offsetLeft": @0, @"offsetRight":@0} views:self.viewItems]];
    
    NSArray *mapViewHeightConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[mapview(==350)]"
                                                                                          options:0
                                                                                          metrics:nil
                                                                                            views:self.viewItems];
    [self addConstraints:mapViewHeightConstraints];
    
    // Title Constraints
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[mapview]-offsetBottom-[titleview]" options:0 metrics:@{@"offsetBottom": @15} views:self.viewItems]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[titleview]" options:0 metrics:@{@"offsetLeft": @15} views:self.viewItems]];
    
    // Description Constraints
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[titleview]-offsetBottom-[descrview]" options:0 metrics:@{@"offsetBottom": @0} views:self.viewItems]];
    
    [self addConstraints: [NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[descrview]" options:0 metrics:@{@"offsetLeft": @15} views:self.viewItems]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[descrview(==200)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:self.viewItems]];
    
    // Line View Constraints
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[descrview]-offsetTop-[lineview]" options:0 metrics:@{@"offsetTop": @10} views:self.viewItems]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[lineview]-offsetRight-|" options:0 metrics:@{@"offsetLeft": @0, @"offsetRight":@0} views:self.viewItems]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineview(==1)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:self.viewItems]];
    
    
    // Expand Button Constraints
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineview]-offsetTop-[buttonview]" options:0 metrics:@{@"offsetTop": @10} views:self.viewItems]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-offsetLeft-[buttonview]" options:0 metrics:@{@"offsetLeft": @15} views:self.viewItems]];

    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[buttonview(==25)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:self.viewItems]];
    
    
    // Line
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[lineview]-offsetTop-[patchview]" options:0 metrics:@{@"offsetTop": @10} views:self.viewItems]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[patchview]-offsetRight-|" options:0 metrics:@{@"offsetRight": @130} views:self.viewItems]];
    
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[patchview(==25)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:self.viewItems]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"[patchview(==25)]"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:self.viewItems]];
    
    
}

//- (IBAction)expandButtonTouched {
//    NSLog(@"Expand Buttoon Touched");
//    
//    [self animateConstraints];
//}

- (void)animateConstraints
{
    NSLog(@"GO ANIMATE");
    [self alterConstraints];
    [UIView animateWithDuration:0.5 animations:^{
        [self layoutIfNeeded];
    }];
}


- (void)alterConstraints {
    [self removeConstraints:self.mapViewHeightConstraints];
    self.mapViewHeightConstraints = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[mapview(==600)]"
                                                                            options:0
                                                                            metrics:nil
                                                                              views:self.viewItems];
    [self addConstraints:self.mapViewHeightConstraints];
    
}


- (void)addAutoSubview:(UIView *)view {
    view.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:view];
}

@end
