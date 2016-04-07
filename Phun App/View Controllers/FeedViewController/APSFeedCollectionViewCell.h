//
//  APSFeedCollectionViewCell.h
//  Phun App
//
//  Created by Tomás Figueroa on 4/6/16.
//  Copyright © 2016 Applaudo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface APSFeedCollectionViewCell : UICollectionViewCell

- (void)setDate:(NSDate *)date
              title:(NSString *)title
    locationLineOne:(NSString *)locationLineOne
    locationLineTwo:(NSString *)locationLineTwo
           imageURL:(NSString *)imageURL;

@end
