package bitcloud.crypto.cloud.mining.android


import android.os.Build
import android.os.Bundle
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.googlemobileads.GoogleMobileAdsPlugin

class MainActivity : FlutterActivity() {


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)



        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine,
            "native_banner",
            NativeBannerAdFactory(this)
        )

        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine,
            "small_native",
            SmallNativeAdFactory(this)
        )

        GoogleMobileAdsPlugin.registerNativeAdFactory(
            flutterEngine,
            "big_native",
            BigNativeAdFactory(this)
        )

    }


    override fun cleanUpFlutterEngine(flutterEngine: FlutterEngine) {
        super.cleanUpFlutterEngine(flutterEngine)

        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "native_banner")
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "small_native")
        GoogleMobileAdsPlugin.unregisterNativeAdFactory(flutterEngine, "big_native")
    }
}