
#import "RFScrollViewPageControlDemoViewController.h"
#import "UIView+RFAnimate.h"

@interface RFScrollViewPageControlDemoViewController ()
@end

@implementation RFScrollViewPageControlDemoViewController
RFUIInterfaceOrientationSupportAll

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}

#pragma mark - Config page count

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.scrollView removeAllSubviews];
    [self onPageCountSliderValueChanged:self.pageCountSlider];

    self.scrollView.translatesAutoresizingMaskIntoConstraints = YES;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    if (self.pageCount < 0) return;
    
    CGFloat width = self.scrollView.width;
    CGFloat height = self.scrollView.height;
    NSUInteger subviewCountCurrent = self.scrollView.subviews.count;
    NSUInteger subviewCountWillBe = ceilf(self.pageCount);
    
    UIView *lastSubview = [self.scrollView.subviews lastObject];
    if (subviewCountWillBe > subviewCountCurrent) {
        lastSubview.width = width;
        
        for (NSInteger i = (subviewCountWillBe - subviewCountCurrent); i > 0; i--) {
            UIView *v = [[UIView alloc] initWithFrame:CGRectMake((subviewCountWillBe - i)*width, 10, width, height-20)];
            v.autoresizingMask = UIViewAutoresizingFlexibleSize | UIViewAutoresizingFlexibleMargin;
            v.translatesAutoresizingMaskIntoConstraints = YES;
            v.backgroundColor = [UIColor randColorWithAlpha:0.8];
            [self.scrollView addSubview:v];
            _dout(@"Add a view: %@", v)
        }
    }
    else {
        // Remove last n views.
        [self.scrollView.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(UIView * view, NSUInteger idx, BOOL *stop) {
            if (idx >= subviewCountWillBe) {
                [view removeFromSuperview];
            }
            else {
                *stop = YES;
            }
        }];
    }
    
    // Fix last view size.
    CGFloat lastWidth = width * (self.pageCount - floorf(self.pageCount));
    [[self.scrollView.subviews lastObject] setWidth:(lastWidth)? : width];
    
    // Adjust x
    [self.scrollView.subviews enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(UIView * view, NSUInteger idx, BOOL *stop) {
        view.x = idx*width;
    }];
    
    _douto(self.scrollView.subviews)
    self.scrollView.contentSize = (CGSize){ self.pageCount * self.scrollView.bounds.size.width, 0 };
}

- (IBAction)onPageCountSliderValueChanged:(UISlider *)sender {
    self.pageCountLabel.text = [NSString stringWithFormat:@"%.1f", sender.value];
    self.pageCount = sender.value;
    [self.view setNeedsLayout];
}

- (IBAction)onSupportHalfPageSwitchChanged:(UISwitch *)sender {
    self.pageControl.supportHalfPage = sender.on;
}

@end
