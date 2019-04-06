//
//  RFSliderViewDemoViewController.h
//  RFDemo
//
//  Created by BB9z on 6/17/14.
//  Copyright (c) 2014 RFUI. All rights reserved.
//

#import <RFKit/RFKit.h>
#import "RFSliderView.h"

@interface RFSliderViewDemoViewController : UIViewController <
    UICollectionViewDataSource
>

@property (strong, nonatomic) NSArray *items;
@property (weak, nonatomic) IBOutlet RFSliderView *sliderView;
@end


@interface RFSliderViewDemoCell : UICollectionViewCell
@property (strong, nonatomic) NSDictionary *item;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end
