//
//  BannerViewController.m
//  CartyObjC
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

#import "BannerViewController.h"
#import <CartySDK/CartySDK.h>

@interface BannerViewController ()<CTBannerAdDelegate>
@property (nonatomic,weak)IBOutlet UIView *adView;
@property (nonatomic,weak)IBOutlet UILabel *infoLabel;
@property (nonatomic,strong)CTBannerAd *bannerAd;
@end

@implementation BannerViewController

- (void)viewIsAppearing:(BOOL)animated
{
    [super viewIsAppearing:animated];
    [self.adView addSubview:self.bannerAd];
    self.bannerAd.center = CGPointMake(self.adView.bounds.size.width/2.0, self.adView.bounds.size.height/2.0);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bannerAd = [[CTBannerAd alloc] init];
    self.bannerAd.placementid = @"281217152640";
    self.bannerAd.rootViewController = self;
    self.bannerAd.bannerSize = CTBannerSizeType320x50;
    self.bannerAd.delegate = self;
}


-(IBAction)loadAd:(id)sender
{
    self.infoLabel.text = @"Start load Ad";
    [self.bannerAd loadAd];
}

- (void)CTBannerAdDidLoad:(nonnull CTBannerAd *)ad { 
    self.infoLabel.text = @"Ad loaded";
}

- (void)CTBannerAdDidShow:(nonnull CTBannerAd *)ad { 
    self.infoLabel.text= @"Ad did show";
}

- (void)CTBannerAdLoadFail:(nonnull CTBannerAd *)ad withError:(nonnull NSError *)error { 
    self.infoLabel.text = [NSString stringWithFormat:@"Ad load fail %@",error];
}

- (void)CTBannerAdShowFail:(nonnull CTBannerAd *)ad withError:(nonnull NSError *)error { 
    self.infoLabel.text = [NSString stringWithFormat:@"Ad show fail %@",error];
}

- (void)CTBannerAdDidClick:(nonnull CTBannerAd *)ad {
    self.infoLabel.text = @"Ad click";
}

- (void)CTBannerAdDidClose:(nonnull CTBannerAd *)ad {
    self.infoLabel.text = @"Ad close";
}
@end
