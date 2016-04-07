//
//  APSDetailViewController.m
//  Phun App
//
//  Created by Tomás Figueroa on 4/6/16.
//  Copyright © 2016 Applaudo. All rights reserved.
//

#import <MagicalRecord/MagicalRecord.h>
#import <SDWebImage/UIImageView+WebCache.h>

#import "APSFormatter.h"
#import "APSMission.h"

#import "APSDetailViewController.h"

@interface APSDetailViewController () <UIScrollViewDelegate>

@property (strong, nonatomic) APSMission *mission;
@property (strong, nonatomic) UIScrollView *scrollView;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation APSDetailViewController

- (APSMission *)mission
{
    if (!_mission && _missionID) {
        _mission = [APSMission MR_findFirstByAttribute:@"missionID" withValue:_missionID];
    }

    return _mission;
}

- (void)setupScrollView
{
    if (!_scrollView && [self.view isKindOfClass:[UIScrollView class]]) {
        _scrollView = (UIScrollView *)self.view;
        _scrollView.alwaysBounceVertical = YES;
        _scrollView.delegate = self;
    }
}

#pragma mark - Data

- (void)loadData:(APSMission *)mission
{
    static UIImage *placeholder;
    if (!placeholder) {
        placeholder = [UIImage imageNamed:@"placeholder"];
    }

    [self.backgroundImageView sd_setImageWithURL:[NSURL URLWithString:mission.imageURL] placeholderImage:placeholder];
    self.dateLabel.text = [[APSFormatter localDateFormater] stringFromDate:mission.date];
    self.titleLabel.text = mission.title;
    self.descriptionLabel.text = mission.missionDescription;
}

#pragma mark - <UIScrollViewDelegate>

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"Offset: %@", NSStringFromCGPoint([scrollView contentOffset]));
}

#pragma mark - Actions
- (void)shareAction:(UIBarButtonItem *)sender
{
    APSMission *mission = self.mission;
    NSArray *items =
        @[ mission.title, [NSURL URLWithString:mission.imageURL], mission.missionDescription, mission.date ];

    UIActivityViewController *activity =
        [[UIActivityViewController alloc] initWithActivityItems:items applicationActivities:nil];
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        UIPopoverController *popOver = [[UIPopoverController alloc] initWithContentViewController:activity];
        [popOver presentPopoverFromBarButtonItem:sender
                        permittedArrowDirections:UIPopoverArrowDirectionAny
                                        animated:YES];
    } else {
        [self.navigationController presentViewController:activity animated:YES completion:nil];
    }
}

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self setupScrollView];
    [self loadData:self.mission];
    UIBarButtonItem *shareButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction
                                                                                 target:self
                                                                                 action:@selector(shareAction:)];
    self.navigationItem.rightBarButtonItem = shareButton;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    // Make the navigation bar transparent
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.view.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    // Set the navigation bar as default
    [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
}

@end
