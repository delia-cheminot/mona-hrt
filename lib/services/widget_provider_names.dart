/// Fully-qualified class names for the Android AppWidgetProviders, for use
/// with [HomeWidget.updateWidget]'s `qualifiedAndroidName` parameter.
///
/// home_widget's `androidName` parameter instead resolves classes as
/// `context.packageName + "." + androidName` -- but `context.packageName`
/// is the applicationId, which varies by build type (debug builds append
/// `.dev`, see android/app/build.gradle's applicationIdSuffix), while these
/// classes live in the stable `namespace` from build.gradle. Using
/// `androidName` there throws ClassNotFoundException on debug builds, so
/// `qualifiedAndroidName` with the namespace hardcoded here is the one that
/// actually works across build types.
abstract final class WidgetProviderNames {
  static const String _package = 'com.deliacheminot.mona';

  static const String hrtWidget = '$_package.HrtWidgetProvider';
  static const String nextDoseWidget = '$_package.NextDoseWidgetProvider';
  static const String recentIntakesWidget =
      '$_package.RecentIntakesWidgetProvider';

  static const List<String> all = [
    hrtWidget,
    nextDoseWidget,
    recentIntakesWidget,
  ];
}
