//
//  RFDDelegateChainScrollviewChainTestViewController.h
//  RFDemo
//
//  Created by BB9z on 8/24/15.
//  Copyright © 2015 RFUI. All rights reserved.
//

#import "UICollectionViewDelegateChain.h"

@interface RFDDelegateChainScrollviewChainTestViewController : UIViewController <
    UICollectionViewDataSource,
    UICollectionViewDelegate
>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@end
