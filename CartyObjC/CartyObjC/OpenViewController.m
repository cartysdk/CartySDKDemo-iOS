//
//  OpenViewController.m
//  CartyObjC
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

#import "OpenViewController.h"
#import <CartySDK/CartySDK.h>

@interface OpenViewController ()<CTAppOpenAdDelegate>
@property (nonatomic,weak)IBOutlet UILabel *infoLabel;
@property (nonatomic,strong)CTAppOpenAd *openAd;
@end

@implementation OpenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.openAd = [[CTAppOpenAd alloc] init];
    self.openAd.placementid = @"281217152630";
    self.openAd.delegate = self;
}

-(IBAction)loadAd:(id)sender
{
    self.infoLabel.text = @"Start load Ad";
    [self.openAd loadAd];
}

-(IBAction)showAd:(id)sender
{
    if(self.openAd.isReady)
    {
        self.infoLabel.text = @"Start show Ad";
        [self.openAd showAd:self];
    }
    else
    {
        self.infoLabel.text = @"Ad not Ready";
    }
}

- (void)CTOpenAdDidLoad:(nonnull CTAppOpenAd *)ad {
    self.infoLabel.text = @"Ad loaded";
}

- (void)CTOpenAdDidShow:(nonnull CTAppOpenAd *)ad {
    self.infoLabel.text= @"Ad did show";
}

- (void)CTOpenAdLoadFail:(nonnull CTAppOpenAd *)ad withError:(nonnull NSError *)error {
    self.infoLabel.text = [NSString stringWithFormat:@"Ad load fail %@",error];
}

- (void)CTOpenAdShowFail:(nonnull CTAppOpenAd *)ad withError:(nonnull NSError *)error {
    self.infoLabel.text = [NSString stringWithFormat:@"Ad show fail %@",error];
}

- (void)CTOpenAdDidClick:(nonnull CTAppOpenAd *)ad {
    self.infoLabel.text = @"Ad click";
}

- (void)CTOpenAdDidDismiss:(nonnull CTAppOpenAd *)ad {
    self.infoLabel.text = @"Ad close";
}

@end
