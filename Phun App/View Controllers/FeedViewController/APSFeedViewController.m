//
//  APSFeedViewController.m
//  Phun App
//
//  Created by Tomás Figueroa on 4/6/16.
//  Copyright © 2016 Applaudo. All rights reserved.
//

#import <MagicalRecord/MagicalRecord.h>

#import "APSAPIClient.h"
#import "APSMission.h"

#import "APSFeedViewController.h"
#import "APSDetailViewController.h"
#import "APSFeedCollectionViewCell.h"

static NSString *const kShowMissionSegue = @"showMissionSegue";

@interface APSFeedViewController () <UICollectionViewDelegateFlowLayout>

@property (strong, nonatomic) NSArray *data;
@property (strong, nonatomic) UIRefreshControl *refresControl;

@end

@implementation APSFeedViewController

static NSString *const reuseIdentifier = @"Cell";

#pragma mark -

- (NSArray *)data
{
    if (!_data) {
        _data = [APSMission MR_findAllSortedBy:@"date" ascending:YES];
    }

    return _data;
}

- (UIRefreshControl *)refresControl
{
    if (!_refresControl) {
        _refresControl = [UIRefreshControl new];
    }
    return _refresControl;
}

#pragma mark - Data

- (void)loadData
{
    [[APSAPIClient sharedInstance] loadData:^(id response) {
        if ([response isKindOfClass:[NSArray class]]) {

            [MagicalRecord saveWithBlock:^(NSManagedObjectContext *_Nonnull localContext) {
                [APSMission MR_importFromArray:response inContext:localContext];
            } completion:^(BOOL contextDidSave, NSError * _Nullable error) {
                [self didLoadData];
            }];
        }
    }
        error:^(NSError *error) {
            NSLog(@"Error: %@", error);
        }];
}

- (void)didLoadData
{
    self.data = [APSMission MR_findAllSortedBy:@"date" ascending:YES];
    [self.collectionView reloadData];
    [self.refresControl endRefreshing];
}

#pragma mark - ViewController Lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;

    [self.collectionView registerNib:[UINib nibWithNibName:@"APSFeedCollectionViewCell" bundle:[NSBundle mainBundle]]
          forCellWithReuseIdentifier:reuseIdentifier];
    
    UIRefreshControl *refresControl = self.refresControl;
    [refresControl addTarget:self action:@selector(loadData) forControlEvents:UIControlEventValueChanged];
    [self.collectionView addSubview:refresControl];

    // Do any additional setup after loading the view.

    [self loadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:kShowMissionSegue] && [sender isKindOfClass:[APSMission class]]) {
        APSDetailViewController *dvc = segue.destinationViewController;
        APSMission *mission = sender;
        dvc.missionID = mission.missionID;
    }
}

#pragma mark - <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView
                  cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    APSFeedCollectionViewCell *cell =
        [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];

    APSMission *mission = [self.data objectAtIndex:indexPath.item];
    // Configure the cell
    [cell setDate:mission.date
                  title:mission.title
        locationLineOne:mission.locationLineOne
        locationLineTwo:mission.locationLineTwo
               imageURL:mission.imageURL];

    return cell;
}

#pragma mark - <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    APSMission *mission = [self.data objectAtIndex:indexPath.item];
    [self performSegueWithIdentifier:kShowMissionSegue sender:mission];
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
        return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions
performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
        return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath
*)indexPath withSender:(id)sender {
        return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath
*)indexPath withSender:(id)sender {

}
*/

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    float fullWidth = CGRectGetWidth(collectionView.frame);
    float cellWidth, cellHeight;
    cellWidth = (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) ? fullWidth / 2 : fullWidth;
    cellHeight = cellWidth * .5625;
    
    return CGSizeMake(cellWidth, cellHeight);
}

@end
