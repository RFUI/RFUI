
#import "RFScrollViewPageControlDemoViewController.h"
#import "UIView+RFAnimate.h"

@implementation RFScrollViewPageControlDemoViewController
RFUIInterfaceOrientationSupportPortrait

- (void)viewDidLoad {
    [super viewDidLoad];

    self.scrollView.pageCount = self.pageCountSlider.value;
}

- (IBAction)onPageCountSliderValueChanged:(UISlider *)sender {
    self.pageCountLabel.text = [NSString stringWithFormat:@"%.1f", sender.value];
}

- (IBAction)onSupportHalfPageSwitchChanged:(UISwitch *)sender {
    self.pageControl.supportHalfPage = sender.on;
}

@end


@implementation SimplePageScrollView

- (void)awakeFromNib {
    [super awakeFromNib];
    [self removeAllSubviews];
}

- (void)setPageCount:(float)pageCount {
    RFAssert(pageCount >= 0, @"Page count can not be negative");

    if (_pageCount != pageCount) {
        CGFloat width = self.width;
        CGFloat height = self.height;

        NSUInteger subviewCountCurrent = _pageCount;
        NSUInteger subviewCountWillBe = ceilf(pageCount);
        if (subviewCountWillBe > subviewCountCurrent) {
            for (NSInteger i = (subviewCountWillBe - subviewCountCurrent); i > 0; i--) {
                UIView *v = [[UIView alloc] initWithFrame:CGRectMake((subviewCountWillBe - i)*width, 10, width, height-20)];
                v.autoresizingMask = UIViewAutoresizingFlexibleSize | UIViewAutoresizingFlexibleMargin;
                v.backgroundColor = [UIColor randColorWithAlpha:0.8];
                [self addSubview:v];
                dout(@"Add a view: %@", v)
            }
        }
        else {
            // Remove last n views.
            [self.subviews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(UIView * view, NSUInteger idx, BOOL *stop) {
                if (idx >= subviewCountWillBe) {
                    [view removeFromSuperview];
                }
                else {
                    *stop = YES;
                }
            }];
        }

        _pageCount = pageCount;

        [self setNeedsLayout];
    }
}

- (void)layoutSubviews {
    // No super

    CGFloat width = self.width;
    CGFloat height = self.height;

    // Fix last view size.
    CGFloat lastWidth = width * (self.pageCount - floorf(self.pageCount));
    [[self.subviews lastObject] setWidth:(lastWidth)? : width];

    // Adjust x
    [self.subviews enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(UIView * view, NSUInteger idx, BOOL *stop) {
        view.frame = CGRectMake(idx * width, 10, width, height - 20);
    }];

    _douto(self.subviews)
    self.contentSize = (CGSize){ self.pageCount * width, 0 };
}

@end
