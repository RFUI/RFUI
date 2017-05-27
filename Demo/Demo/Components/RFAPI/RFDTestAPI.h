//
//  RFDTestAPI.h
//  RFDemo
//
//  Created by BB9z on 3/29/16.
//  Copyright © 2016 RFUI. All rights reserved.
//

#import "RFAPI.h"

@interface RFDTestAPI : RFAPI

+ (instancetype)sharedInstance;

+ (AFHTTPRequestOperation *)requestWithName:(NSString *)APIName
                                 parameters:(NSDictionary *)parameters
                             viewController:(UIViewController *)viewController
                                  forceLoad:(BOOL)forceLoad
                             loadingMessage:(NSString *)message
                                      modal:(BOOL)modal
                                    success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                                    failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure
                                 completion:(void (^)(AFHTTPRequestOperation *operation))completion;
@end


@interface UIViewController (APIControl)

/**
 完善请求取消的控制，解决 view controller 嵌套不能正确取消子控制器中的请求
 子控制器应该返回父控制器的 APIGroupIdentifier，返回 nil 时使用 receiver 的 class name
 */
@property (nonatomic, copy) NSString *APIGroupIdentifier;

@end


