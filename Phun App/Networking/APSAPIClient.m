//
//  APSAPIClient.m
//  Interview Homework Project
//
//  Created by Tomás Figueroa on 4/6/16.
//  Copyright © 2016 Applaudo. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>

#import "APSAPIClient.h"

@interface APSAPIClient ()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;

@end

@implementation APSAPIClient

#pragma mark - Getters

- (AFHTTPSessionManager *)sessionManager
{
    if (!_sessionManager) {
        _sessionManager = [[AFHTTPSessionManager alloc]
            initWithBaseURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/phunware/"]];

        // Github returns files from raw.githubusercontent.com
        // as text/plain, so we can't use the default
        // AFJSONResponseSerializer and we need to manually
        // parse the response with NSJSONSerialization
        _sessionManager.responseSerializer = [AFHTTPResponseSerializer new];
    }

    return _sessionManager;
}

#pragma mark - Class methods

+ (instancetype)sharedInstance
{
    static id instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [self new];
    });

    return instance;
}

#pragma mark - Data fetching

- (void)loadData:(void (^)(id response))successBlock error:(void (^)(NSError *error))errorBlock
{
    [self.sessionManager GET:@"dev-interview-homework/master/feed.json"
        parameters:nil
        progress:nil
        success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
            NSError *error;

            id jsonObject = [self parseJSONResponse:responseObject error:&error];

            if (!jsonObject) {
                errorBlock(error);
            }

            successBlock(jsonObject);
        }
        failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
            errorBlock(error);
        }];
}

- (id)parseJSONResponse:(NSData *)data error:(NSError **)error
{
    return [NSJSONSerialization JSONObjectWithData:data options:0 error:error];
}

@end
