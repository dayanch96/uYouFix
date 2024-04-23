#import <Foundation/Foundation.h>

@interface YTVarispeedSwitchController : NSObject
@end

@interface YTPlayerOverlayManager : NSObject
@property (nonatomic, assign) float currentPlaybackRate;
@property (nonatomic, strong, readonly) YTVarispeedSwitchController *varispeedController;

- (void)varispeedSwitchController:(YTVarispeedSwitchController *)varispeed didSelectRate:(float)rate;
- (void)setCurrentPlaybackRate:(float)rate;
- (void)setPlaybackRate:(float)rate;
@end

%hook YTPlayerOverlayManager
%property (nonatomic, assign) float currentPlaybackRate;

%new
- (void)setCurrentPlaybackRate:(float)rate {
    [self varispeedSwitchController:self.varispeedController didSelectRate:rate];
}

%new
- (void)setPlaybackRate:(float)rate {
    [self varispeedSwitchController:self.varispeedController didSelectRate:rate];
}
%end
