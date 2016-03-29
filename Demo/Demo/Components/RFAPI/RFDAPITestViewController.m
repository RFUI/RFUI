
#import "RFDAPITestViewController.h"
#import "RFDTestAPI.h"

@interface RFDAPITestViewController ()
@property (nonatomic, strong) NSArray<RFDAPITestRequestObject *> *items;
@end

@implementation RFDAPITestViewController
RFUIInterfaceOrientationSupportDefault

- (void)viewDidLoad {
    [super viewDidLoad];

    RFDAPITestRequestObject *r1 = [RFDAPITestRequestObject new];
    r1.title = @"Null";
    r1.APIName = @"NullTest";
    r1.message = @"Request: Null";

    RFDAPITestRequestObject *r2 = [RFDAPITestRequestObject new];
    r2.title = @"An object";
    r2.APIName = @"ObjSample";
    r2.message = @"";

    RFDAPITestRequestObject *r3 = [RFDAPITestRequestObject new];
    r3.title = @"Objects";
    r3.APIName = @"ObjArraySample";
    r3.message = @"Loadding...";
    r3.modal = YES;

    RFDAPITestRequestObject *r4 = [RFDAPITestRequestObject new];
    r4.title = @"Empty object";
    r4.APIName = @"ObjEmpty";
    // r4 no progress

    self.items = @[ r1, r2, r3, r4 ];
}

#pragma mark - List

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RFDAPITestRequestObject *requestDefine = self.items[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = requestDefine.title;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RFDAPITestRequestObject *requestDefine = self.items[indexPath.row];
    @weakify(self);
    [RFDTestAPI requestWithName:requestDefine.APIName parameters:nil viewController:self forceLoad:NO loadingMessage:requestDefine.message modal:requestDefine.modal success:^(AFHTTPRequestOperation *operation, id responseObject) {
        @strongify(self);
        [self displayResponse:responseObject error:nil];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        @strongify(self);
        [self displayResponse:nil error:error];
    } completion:nil];
}

- (void)displayResponse:(id)responseObject error:(NSError *)error {
    if (error) {
        self.responseTextView.text = [NSString stringWithFormat:@"%@", error];
        self.responseTextView.textColor = [UIColor redColor];
        return;
    }
    self.responseTextView.text = [NSString stringWithFormat:@"%@", responseObject];
    self.responseTextView.textColor = [UIColor darkTextColor];
}

@end


@implementation RFDAPITestRequestObject


@end
