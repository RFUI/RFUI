
#import "SimpleConsoleView.h"
#import "dout.h"
#import "RFPerformance.h"

@interface SimpleConsoleView ()
@end

@implementation SimpleConsoleView
RFAlloctionLog

- (id)init {
    self = [super init];
    if (self) {
        [self onInit];
    }
    return self;
}
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self onInit];
    }
    return self;
}
- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self onInit];
    }
    return self;
}

- (void)onInit {
    self.backgroundColor = [UIColor blackColor];
    self.textColor = [UIColor whiteColor];
    self.editable = NO;

    [SimpleLogger sharedInstance].delegate = self;
}

#pragma mark - SimpleLoggerDelegate

- (void)logger:(SimpleLogger *)logger bufferChanged:(NSString *)newString {
    self.text = logger.buffer;
}

@end
