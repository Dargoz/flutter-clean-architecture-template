//
//  Generated file. Do not edit.
//

// clang-format off

#import "GeneratedPluginRegistrant.h"

#if __has_include(<google_sign_in_ios/FLTGoogleSignInPlugin.h>)
#import <google_sign_in_ios/FLTGoogleSignInPlugin.h>
#else
@import google_sign_in_ios;
#endif

#if __has_include(<package_info_plus/FLTPackageInfoPlusPlugin.h>)
#import <package_info_plus/FLTPackageInfoPlusPlugin.h>
#else
@import package_info_plus;
#endif

#if __has_include(<shared_preferences_ios/FLTSharedPreferencesPlugin.h>)
#import <shared_preferences_ios/FLTSharedPreferencesPlugin.h>
#else
@import shared_preferences_ios;
#endif

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [FLTGoogleSignInPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTGoogleSignInPlugin"]];
  [FLTPackageInfoPlusPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPackageInfoPlusPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
}

@end
