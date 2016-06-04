//
//  RFDAPITestViewController.h
//  RFDemo
//
//  Created by BB9z on 3/29/16.
//  Copyright © 2016 RFUI. All rights reserved.
//

#import "RFUI.h"

@interface RFDAPITestViewController : UIViewController <
    UITableViewDelegate,
    UITableViewDataSource
>
@property (nonatomic, nullable, weak) IBOutlet UITableView *operationList;
@property (nonatomic, nullable, weak) IBOutlet UITextView *responseTextView;
@end


@interface RFDAPITestRequestObject : NSObject
@property (nonatomic, nonnull, strong) NSString *title;
@property (nonatomic, nonnull, strong) NSString *APIName;
@property (nonatomic, nullable, strong) NSString *message;
@property (nonatomic) BOOL modal;
@end
