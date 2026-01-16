//
//  NativeViewController.m
//  CartyObjC
//
//  Created by GZTD-03-01959 on 2026/1/5.
//

#import "NativeViewController.h"
#import <CartySDK/CartySDK.h>
#import "NativeTemplate.h"

@interface NativeViewController ()<CTNativeAdDelegate>


@property (nonatomic,weak)IBOutlet UIView *adView;
@property (nonatomic,weak)IBOutlet UILabel *infoLabel;
@property (nonatomic,strong)CTNativeAd *nativeAd;
@property (nonatomic,strong)NativeTemplate *nativeView;
@end

@implementation NativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.nativeAd = [[CTNativeAd alloc] init];
    self.nativeAd.placementid = @"281217152610";
    self.nativeAd.rootViewController = self;
    self.nativeAd.delegate = self;
}

-(IBAction)loadAd:(id)sender
{
    self.infoLabel.text = @"Start load Ad";
    [self.nativeAd loadAd];
}

-(IBAction)showAd:(id)sender
{
    if(!self.nativeAd.isReady)
    {
        self.infoLabel.text = @"Ad not Ready";
        return;
    }
    self.infoLabel.text = @"Start show Ad";
    if(self.nativeView != nil)
    {
        [self.nativeView removeFromSuperview];
    }
    self.nativeView = [[NSBundle mainBundle] loadNibNamed:@"NativeTemplate" owner:self options:nil].lastObject;
    [self.adView addSubview:self.nativeView];
    [self setFullLayOut:self.nativeView];
    [self.nativeView.mainImageView addSubview:self.nativeAd.mediaView];
    [self setFullLayOut:self.nativeAd.mediaView];
    [self.nativeView.adChoiceImageView addSubview:self.nativeAd.adChoiceView];
    [self setFullLayOut:self.nativeAd.adChoiceView];
    if(self.nativeAd.iconImageURL)
    {
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.nativeAd.iconImageURL]];
            dispatch_async(dispatch_get_main_queue(), ^{
                self.nativeView.iconImageView.image = [UIImage imageWithData:data];
            });
        });
    }
    self.nativeView.titleLabel.text = self.nativeAd.title;
    self.nativeView.textLabel.text = self.nativeAd.desc;
    self.nativeView.ctaLabel.text = self.nativeAd.ctaText;
    [self.nativeAd registerContainer:self.nativeView withClickableViews:@[self.nativeView.titleLabel,self.nativeView.iconImageView,self.nativeView.mainImageView,self.nativeView.ctaLabel]];
}

- (void)setFullLayOut:(UIView *)view
{
    if(view.superview != nil)
    {
        view.translatesAutoresizingMaskIntoConstraints = false;
        NSLayoutConstraint *right = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeRight multiplier:1.0 constant:0];
        NSLayoutConstraint *left = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeLeft multiplier:1.0 constant:0];
        NSLayoutConstraint *top = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeTop multiplier:1.0 constant:0];
        NSLayoutConstraint *bottom = [NSLayoutConstraint constraintWithItem:view attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:view.superview attribute:NSLayoutAttributeBottom multiplier:1.0 constant:0];
        [view.superview addConstraints:@[right,left,top,bottom]];
    }
}

- (void)CTNativeAdDidLoad:(nonnull CTNativeAd *)ad { 
    self.infoLabel.text = @"Ad loaded";
}

- (void)CTNativeAdDidShow:(nonnull CTNativeAd *)ad { 
    self.infoLabel.text= @"Ad did show";
}

- (void)CTNativeAdLoadFail:(nonnull CTNativeAd *)ad withError:(nonnull NSError *)error { 
    self.infoLabel.text = [NSString stringWithFormat:@"Ad load fail %@",error];
}

- (void)CTNativeAdShowFail:(nonnull CTNativeAd *)ad withError:(nonnull NSError *)error { 
    self.infoLabel.text = [NSString stringWithFormat:@"Ad show fail %@",error];
}

- (void)CTNativeAdDidClick:(nonnull CTNativeAd *)ad {
    self.infoLabel.text = @"Ad click";
}
@end
