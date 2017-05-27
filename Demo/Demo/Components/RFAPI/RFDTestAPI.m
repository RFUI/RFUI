
#import "RFDTestAPI.h"
#import "APINetworkActivityManager.h"
#import "AFURLResponseSerialization.h"

@interface RFDTestAPI ()
@end

@implementation RFDTestAPI

+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (void)onInit {
    [super onInit];

    NSString *configPath = [[NSBundle mainBundle] pathForResource:@"TestAPIDefine" ofType:@"plist"];
    NSDictionary *rules = [[NSDictionary alloc] initWithContentsOfFile:configPath];
    RFAPIDefineManager *dm = self.defineManager;
    [dm setDefinesWithRulesInfo:rules];
    dm.defaultResponseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingAllowFragments];
    self.networkActivityIndicatorManager = [APINetworkActivityManager new];
}

+ (AFHTTPRequestOperation *)requestWithName:(NSString *)APIName parameters:(NSDictionary *)parameters viewController:(UIViewController *)viewController forceLoad:(BOOL)forceLoad loadingMessage:(NSString *)message modal:(BOOL)modal success:(void (^)(AFHTTPRequestOperation *, id))success failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure completion:(void (^)(AFHTTPRequestOperation *))completion {
    RFAPIControl *cn = [[RFAPIControl alloc] init];
    if (message) {
        cn.message = [[RFNetworkActivityIndicatorMessage alloc] initWithIdentifier:APIName title:nil message:message status:RFNetworkActivityIndicatorStatusLoading];
        cn.message.modal = modal;
    }
    cn.identifier = APIName;
    cn.groupIdentifier = viewController.APIGroupIdentifier;
    cn.forceLoad = forceLoad;
    return [[self sharedInstance] requestWithName:APIName parameters:parameters controlInfo:cn success:success failure:failure completion:completion];
}

@end

#import <objc/runtime.h>

static char UIViewController_APIControl_CateogryProperty;

@implementation UIViewController (APIControl)

- (NSString *)APIGroupIdentifier {
    id value = objc_getAssociatedObject(self, &UIViewController_APIControl_CateogryProperty);
    if (value) return value;
    return NSStringFromClass(self.class);
}

- (void)setAPIGroupIdentifier:(NSString *)APIGroupIdentifier {
    objc_setAssociatedObject(self, &UIViewController_APIControl_CateogryProperty, APIGroupIdentifier, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

@end
