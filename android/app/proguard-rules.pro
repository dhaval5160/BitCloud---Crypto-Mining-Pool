
# BitCloud - Optimized R8 / ProGuard Rules

# Preserve reflection-related metadata
-keepattributes Signature,*Annotation*,InnerClasses,EnclosingMethod

# Flutter Generated Plugin Registrant
-keep class io.flutter.plugins.GeneratedPluginRegistrant { *; }

# Firebase, Google Ads, Meta Ads, AndroidX and
# other supported SDKs normally provide their
# own consumer ProGuard rules.

# Do not use:
# -keep class ** { *; }
# -keep class com.google.** { *; }
# -keep class com.facebook.** { *; }
# -keep class io.flutter.** { *; }
