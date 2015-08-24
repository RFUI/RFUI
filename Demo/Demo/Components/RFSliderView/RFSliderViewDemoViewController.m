
#import "RFSliderViewDemoViewController.h"

@interface RFSliderViewDemoViewController ()
@end

static NSString *const ImageKey = @"image";
static NSString *const TitleKey = @"title";

@implementation RFSliderViewDemoViewController
RFUIInterfaceOrientationSupportAll

#define _itemWithImageName(NAME) \
    @{ ImageKey: [UIImage imageNamed:NAME], TitleKey: NAME }

- (void)awakeFromNib {
    [super awakeFromNib];
    self.items = @[ _itemWithImageName(@"300x600"), _itemWithImageName(@"50x50"), _itemWithImageName(@"800x600"), _itemWithImageName(@"1400x600") ];
}

#undef _itemWithImageName

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
