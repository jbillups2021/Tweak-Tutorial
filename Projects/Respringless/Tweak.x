#import "Tweah.h"


static float blurIntensity;

static void loadPrefs(void) {

	NSUserDefaults *prefs = [[NSUserDefaults alloc] initWithSuiteName: kSuiteName];
	blurIntensity = [prefs objectForKey:@"blurIntensity"] ? [prefs floatForKey:@"blurIntensity"] : 0.85;

}

static _UIBackdropView *blurView;

%hook CSCoverSheetViewController

%new

- (void)setupBlur {

	_UIBackdropViewSettings *settings = [_UIBackdropViewSettings settingsForStyle:2];

	blurView = [[_UIBackdropView alloc] initWithFrame:CGRectZero autosizesToFitSuperview:YES settings:settings];
	blurView.alpha = blurIntensity;
	[self.view insertSubview:blurView atIndex:0];	

}

%new

- (void)updateBlurIntensity {

	loadPrefs();
	blurView.alpha = blurIntensity;

}

- (void)viewDidLoad {

	%orig;
	[self setupBlur];

	[NSDistributedNotificationCenter.defaultCenter addObserver:self selector:@selector(updateBlurIntensity) name:RespringlessTweakDidUpdateBlurIntensityNotification object: nil];

}

%end

%ctor {
	loadPrefs();
}