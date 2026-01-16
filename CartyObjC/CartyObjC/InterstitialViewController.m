//
//  InterstitialViewController.m
//  CartyObjC
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

#import "InterstitialViewController.h"
#import <CartySDK/CartySDK.h>

@interface InterstitialViewController ()<CTInterstitialAdDelegate>
@property (nonatomic,weak)IBOutlet UILabel *infoLabel;
@property (nonatomic,strong)CTInterstitialAd *interstitialAd;
@end

@implementation InterstitialViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.interstitialAd = [[CTInterstitialAd alloc] init];
    self.interstitialAd.placementid = @"281217152620";
    self.interstitialAd.delegate = self;
}

-(IBAction)loadAd:(id)sender
{
    self.infoLabel.text = @"Start load Ad";
    [self.interstitialAd loadAd];
}

-(IBAction)showAd:(id)sender
{
    if(self.interstitialAd.isReady)
    {
        self.infoLabel.text = @"Start show Ad";
        [self.interstitialAd showAd:self];
    }
    else
    {
        self.infoLabel.text = @"Ad not Ready";
    }
}

- (void)CTInterstitialAdDidLoad:(nonnull CTInterstitialAd *)ad {
    NSLog(@"interstitialAdDidLoad");
}

- (void)CTInterstitialAdDidShow:(nonnull CTInterstitialAd *)ad { 
    self.infoLabel.text= @"Ad did show";
}

- (void)CTInterstitialAdLoadFail:(nonnull CTInterstitialAd *)ad withError:(nonnull NSError *)error { 
    self.infoLabel.text = [NSString stringWithFormat:@"Ad load fail %@",error];
}

- (void)CTInterstitialAdShowFail:(nonnull CTInterstitialAd *)ad withError:(nonnull NSError *)error { 
    self.infoLabel.text = [NSString stringWithFormat:@"Ad show fail %@",error];
}

- (void)CTInterstitialAdDidClick:(nonnull CTInterstitialAd *)ad {
    self.infoLabel.text = @"Ad click";
}

- (void)CTInterstitialAdDidDismiss:(nonnull CTInterstitialAd *)ad {
    self.infoLabel.text = @"Ad close";
}

@end
