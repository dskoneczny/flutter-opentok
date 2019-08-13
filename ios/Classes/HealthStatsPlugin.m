#import "HealthStatsPlugin.h"
#import <health_stats/health_stats-Swift.h>

@implementation HealthStatsPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftHealthStatsPlugin registerWithRegistrar:registrar];
}
@end
