//
//  APSAPIClient.h
//  Interview Homework Project
//
//  Created by Tomás Figueroa on 4/6/16.
//  Copyright © 2016 Applaudo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface APSAPIClient : NSObject
+ (instancetype)sharedInstance;
- (void)loadData:(void(^)(id response))successBlock error:(void(^)(NSError *error))errorBlock;

@end
