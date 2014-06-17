//
//  SimpleConsoleView.h
//  PropertyTest
//
//  Created by BB9z on 6/8/14.
//
//

#import <UIKit/UIKit.h>
#import "SimpleLogger.h"

/**
 Recive log only from [SimpleLogger sharedInstance].
 */
@interface SimpleConsoleView : UITextView <
    SimpleLoggerDelegate
>

@end
