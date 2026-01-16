//
//  RewardedVideoViewController.m
//  CartyObjC
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

#import "RewardedVideoViewController.h"
#import <CartySDK/CartySDK.h>

@interface RewardedVideoViewController ()<CTRewardedVideoAdDelegate>

@property (nonatomic,weak)IBOutlet UILabel *infoLabel;
@property (nonatomic,strong)CTRewardedVideoAd *rewardedVideoAd;
@end

@implementation RewardedVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.rewardedVideoAd = [[CTRewardedVideoAd alloc] init];
    self.rewardedVideoAd.placementid = @"281217152650";
    self.rewardedVideoAd.delegate = self;
}

-(IBAction)loadAd:(id)sender
{
    self.infoLabel.text = @"Start load Ad";
    [self.rewardedVideoAd loadAd];
}

-(IBAction)showAd:(id)sender
{
    if(self.rewardedVideoAd.isReady)
    {
        self.infoLabel.text = @"Start show Ad";
        self.rewardedVideoAd.customRewardString = @"customRewardString";
        [self.rewardedVideoAd showAd:self];
    }
    else
    {
        self.infoLabel.text = @"Ad not Ready";
    }
}

- (void)CTRewardedVideoAdDidLoad:(nonnull CTRewardedVideoAd *)ad { 
    self.infoLabel.text = @"Ad loaded";
}

- (void)CTRewardedVideoAdDidShow:(nonnull CTRewardedVideoAd *)ad { 
    self.infoLabel.text= @"Ad did show";
}

- (void)CTRewardedVideoAdLoadFail:(nonnull CTRewardedVideoAd *)ad withError:(nonnull NSError *)error { 
    self.infoLabel.text = [NSString stringWithFormat:@"Ad load fail %@",error];
}

- (void)CTRewardedVideoAdShowFail:(nonnull CTRewardedVideoAd *)ad withError:(nonnull NSError *)error { 
    self.infoLabel.text = [NSString stringWithFormat:@"Ad show fail %@",error];
}

- (void)CTRewardedVideoAdDidClick:(nonnull CTRewardedVideoAd *)ad {
    self.infoLabel.text = @"Ad click";
}

- (void)CTRewardedVideoAdDidDismiss:(nonnull CTRewardedVideoAd *)ad {
    if([self.infoLabel.text isEqualToString:@"Ad Rewarded"])
    {
        self.infoLabel.text = @"Ad Rewarded & Ad close";
        return;
    }
    self.infoLabel.text = @" Ad close";
}

- (void)CTRewardedVideoAdDidEarnReward:(nonnull CTRewardedVideoAd *)ad rewardInfo:(nonnull NSDictionary *)rewardInfo {
    self.infoLabel.text = @"Ad Rewarded";
}

@end
