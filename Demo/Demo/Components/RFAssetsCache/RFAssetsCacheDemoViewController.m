
#import "RFAssetsCacheDemoViewController.h"
#import "RFAssetsCache.h"
#import "RFAssetsCacheTestHelper.h"

@interface RFAssetsCacheDemoViewController ()
@property (strong, nonatomic) RFAssetsCache *cache;
@end

@implementation RFAssetsCacheDemoViewController
RFUIInterfaceOrientationSupportAll

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.cache = [[RFAssetsCache alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}

@end
