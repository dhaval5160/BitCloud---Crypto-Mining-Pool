package bitcloud.crypto.cloud.mining.android

import android.content.Context
import android.graphics.Color
import android.graphics.drawable.GradientDrawable
import android.view.LayoutInflater
import android.view.View
import android.widget.Button
import android.widget.FrameLayout
import android.widget.ImageView
import android.widget.RatingBar
import android.widget.TextView
import com.google.android.libraries.ads.mobile.sdk.nativead.MediaView
import com.google.android.libraries.ads.mobile.sdk.nativead.NativeAd
import com.google.android.libraries.ads.mobile.sdk.nativead.NativeAdView
import io.flutter.plugins.googlemobileads.NativeAdFactory
import androidx.core.graphics.toColorInt

/** Compiled only when google_mobile_ads is configured with USE_NEXT_GEN_SDK=true. */
class SmallNativeAdFactory(private val context: Context) : NativeAdFactory {
    override fun createNativeAd(
        nativeAd: NativeAd,
        customOptions: Map<String, Any>?
    ): NativeAdView {
        val view = LayoutInflater.from(context)
            .inflate(R.layout.native_small, FrameLayout(context), false) as NativeAdView

        val title = view.findViewById<TextView>(R.id.ad_text_headline)
        val description = view.findViewById<TextView>(R.id.ad_text_body)
        val icon = view.findViewById<ImageView>(R.id.ad_app_icon)
        val action = view.findViewById<Button>(R.id.ad_call_to_action)
        val stars = view.findViewById<RatingBar>(R.id.ad_stars)
        val badge = view.findViewById<TextView>(R.id.ad_notification_view)
        val media = view.findViewById<MediaView>(R.id.ad_media)

        view.headlineView = title
        view.bodyView = description
        view.iconView = icon
        view.callToActionView = action
        if (stars != null) view.starRatingView = stars

        title.text = nativeAd.headline.orEmpty()
        description.text = nativeAd.body.orEmpty()
        description.visibility = if (nativeAd.body.isNullOrBlank()) View.GONE else View.VISIBLE
        action.text = nativeAd.callToAction.orEmpty()
        action.visibility = if (nativeAd.callToAction.isNullOrBlank()) View.GONE else View.VISIBLE

        val drawable = nativeAd.icon?.drawable
        icon.setImageDrawable(drawable)
        icon.visibility = if (drawable == null) View.GONE else View.VISIBLE

        val radius = 8f * context.resources.displayMetrics.density

        icon.background = GradientDrawable().apply {
            shape = GradientDrawable.RECTANGLE
            cornerRadius = radius
            setColor(Color.TRANSPARENT)
        }

        icon.clipToOutline = true
        icon.scaleType = ImageView.ScaleType.CENTER_CROP

        if (stars != null) {
            val rating = nativeAd.starRating
            if (rating != null) {
                stars.rating = rating.toFloat()
                stars.visibility = View.VISIBLE
            } else {
                stars.visibility = View.GONE
            }
        }

        val opts = customOptions.orEmpty()
        val background = color(opts["backgroundColor"], "#2E2C30")
        val foreground = color(opts["textColor"], "#2E2C30")
        val secondary = color(opts["subTextColor"], "#9CA3AF")
        val buttonColor = color(opts["buttonColor"], "#F35383")
        val accent = color(opts["startColor"], "#F35383")


        view.setBackgroundColor(background)
        title.setTextColor(foreground)
        description.setTextColor(secondary)
        action.background = GradientDrawable().apply {
            cornerRadius = 8f * context.resources.displayMetrics.density
            setColor(buttonColor)
        }
        action.setTextColor(Color.WHITE)
        badge?.let { adBadge ->
            val density = context.resources.displayMetrics.density

            val badgeDrawable = GradientDrawable().apply {
                cornerRadius = 4f * density
                setColor(Color.TRANSPARENT)
                setStroke(
                    (1f * density).toInt().coerceAtLeast(1),
                    accent
                )
            }

            adBadge.text = "Ad"
            adBadge.visibility = View.VISIBLE
            adBadge.setTextColor(foreground)
            adBadge.background = badgeDrawable
        }
        stars?.progressDrawable?.mutate()?.setTint(accent)

        // Must use the Next-Gen registration API, not setNativeAd().
        view.registerNativeAd(nativeAd, media)
        return view
    }

    private fun color(value: Any?, fallback: String): Int =
        try {
            (value as? String ?: fallback).toColorInt()
        } catch (_: IllegalArgumentException) {
            fallback.toColorInt()
        }
}
