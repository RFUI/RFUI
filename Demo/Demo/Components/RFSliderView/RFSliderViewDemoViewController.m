
#import "RFSliderViewDemoViewController.h"

@interface RFSliderViewDemoViewController ()
@end

static NSString *const ImageKey = @"image";
static NSString *const TitleKey = @"title";

@implementation RFSliderViewDemoViewController
RFUIInterfaceOrientationSupportAll

#define _ItemWithImageName(NAME) \
    @{ ImageKey: [UIImage imageNamed:NAME], TitleKey: NAME }

- (void)awakeFromNib {
    [super awakeFromNib];
    self.items = @[ _ItemWithImageName(@"300x600"), _ItemWithImageName(@"50x50"), _ItemWithImageName(@"800x600"), _ItemWithImageName(@"1400x600") ];
}

#undef _ItemWithImageName

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RFSliderViewDemoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    cell.item = self.items[indexPath.row];
    return cell;
}

@end

@implementation RFSliderViewDemoCell

- (void)setItem:(NSDictionary *)item {
    _item = item;

    self.imageView.image = item[ImageKey];
    self.titleLabel.text = item[TitleKey];
}

@end
