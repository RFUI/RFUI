
#import "RFDDelegateChainScrollviewChainTestViewController.h"
#import <RFKit/UIViewController+RFInterfaceOrientation.h>

@interface RFDDelegateChainScrollviewChainTestViewController ()
@property (strong, nonatomic) id dc;
@end

@implementation RFDDelegateChainScrollviewChainTestViewController
_RFUIInterfaceOrientationSupportDefault

- (void)viewDidLoad {
    [super viewDidLoad];

    UICollectionViewDelegateChain *dc = [UICollectionViewDelegateChain new];
    dc.delegate = self;
    self.dc = dc;
    self.collectionView.delegate = dc;

    [self addListener];
}

- (void)addListener {
    [self.dc setDidScroll:^(UIScrollView *sv, id<UIScrollViewDelegate> delegate) {
        doutwork();
    }];

    [self.dc setDidSelectItem:^(UICollectionView *cv, NSIndexPath *ip, id<UICollectionViewDelegate> delegate) {
        douto(ip)
    }];

    // Must set to another object first to refresh delegate cache on iOS 9.
    self.collectionView.delegate = nil;
    self.collectionView.delegate = self.dc;
}

#pragma mark - UICollectionViewDataSource

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 50;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}

@end
