//
//  APSFeedCollectionViewCell.m
//  Phun App
//
//  Created by Tomás Figueroa on 4/6/16.
//  Copyright © 2016 Applaudo. All rights reserved.
//

#import <SDWebImage/UIImageView+WebCache.h>

#import "APSFeedCollectionViewCell.h"

#import "APSFormatter.h"

@interface APSFeedCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *locationLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@end

@implementation APSFeedCollectionViewCell

- (void)setDate:(NSDate *)date
              title:(NSString *)title
    locationLineOne:(NSString *)locationLineOne
    locationLineTwo:(NSString *)locationLineTwo
           imageURL:(NSString *)imageURL
{
    static UIImage *placeholder;
    if (!placeholder) {
        placeholder = [UIImage imageNamed:@"placeholder"];
    }

    self.dateLabel.text = [[APSFormatter localDateFormater] stringFromDate:date];
    self.titleLabel.text = title;
    self.locationLabel.text = [NSString stringWithFormat:@"%@, %@", locationLineOne, locationLineTwo];
    [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:placeholder];
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    // Initialization code
}

@end
