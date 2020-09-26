
#import "RFAssetsCacheDemoViewController.h"
#import "RFAssetsCache.h"
#import "RFAssetsCacheTestHelper.h"
#import <RFKit/UIDevice+RFKit.h>
#import <RFKit/UIViewController+RFInterfaceOrientation.h>

@interface RFAssetsCacheDemoViewController ()
@property (strong, nonatomic) RFAssetsCache *cache;
@end

@implementation RFAssetsCacheDemoViewController

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.cache = [[RFAssetsCache alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

@end
