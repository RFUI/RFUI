
#import "RFScrollViewPageControlDemoViewController.h"
#import "UIView+RFAnimate.h"
#import <RFKit/UIViewController+RFInterfaceOrientation.h>

@implementation RFScrollViewPageControlDemoViewController
RFUIInterfaceOrientationSupportAll

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    [self onPageCountSliderValueChanged:self.pageCountSlider];
}

- (IBAction)onPageCountSliderValueChanged:(UISlider *)sender {
    self.pageCountLabel.text = [NSString stringWithFormat:@"%.1f", sender.value];
    self.scrollView.pageCount = self.pageCountSlider.value;
}

- (IBAction)onSupportHalfPageSwitchChanged:(UISwitch *)sender {
    self.pageControl.supportHalfPage = sender.on;
}

@end


@implementation SimplePageScrollView

- (void)awakeFromNib {
    [super awakeFromNib];
    self.pageViews = [NSMutableArray array];
}

- (void)setPageCount:(float)pageCount {
    RFAssert(pageCount >= 0, @"Page count can not be negative");

    if (_pageCount != pageCount) {
        CGFloat width = self.width;
        CGFloat height = self.height;

        NSUInteger subviewCountCurrent = ceilf(_pageCount);
        NSUInteger subviewCountWillBe = ceilf(pageCount);
        if (subviewCountWillBe > subviewCountCurrent) {
            for (NSInteger i = (subviewCountWillBe - subviewCountCurrent); i > 0; i--) {
                UIView *v = [[UIView alloc] initWithFrame:CGRectMake((subviewCountWillBe - i)*width, 10, width, height-20)];
                v.autoresizingMask = UIViewAutoresizingFlexibleSize | UIViewAutoresizingFlexibleMargin;
                v.backgroundColor = [UIColor randColorWithAlpha:0.8];
                v.translatesAutoresizingMaskIntoConstraints = NO;
                [self addSubview:v];
                [self.pageViews insertObject:v atIndex:subviewCountCurrent];
                dout(@"Add a view: %@", v)
            }
        }
        else {
            // Remove last n views.
            [self.pageViews enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(UIView * view, NSUInteger idx, BOOL *stop) {
                if (idx >= subviewCountWillBe) {
                    [view removeFromSuperview];
                    dout(@"Remove a view: %@", view)
                }
                else {
                    *stop = YES;
                }
            }];

            for (NSUInteger i = subviewCountCurrent; i > subviewCountWillBe; i--) {
                [self.pageViews removeObjectAtIndex:i-1];
            }
        }

        _pageCount = pageCount;

        [self updateSubviewSize];
    }
}

- (void)updateSubviewSize {
    CGFloat width = self.width;
    CGFloat height = self.height;

    // Adjust frame
    [self.pageViews enumerateObjectsWithOptions:(NSEnumerationOptions)0 usingBlock:^(UIView * view, NSUInteger idx, BOOL *stop) {
        view.frame = CGRectMake(idx * width, 10, width, height - 20);
    }];

    // Fix last view size.
    CGFloat lastWidth = width * (self.pageCount - floorf(self.pageCount));
    [[self.pageViews lastObject] setWidth:(lastWidth > 0)? lastWidth : width];

    self.contentSize = (CGSize){ self.pageCount * width, 0 };
}

- (void)setBounds:(CGRect)bounds {
    BOOL needUpdateSize = !CGSizeEqualToSize(self.bounds.size, bounds.size);

    [super setBounds:bounds];

    if (needUpdateSize) {
        [self updateSubviewSize];
    }
}

@end
