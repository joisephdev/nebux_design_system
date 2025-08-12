import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// A robust network image widget that provides comprehensive image loading,
/// caching, error handling, and customization options.
///
/// This widget wraps [CachedNetworkImage] and provides additional features
/// such as custom error widgets, loading indicators, and flexible sizing options.
class NbxNetworkImage extends StatelessWidget {
  /// The URL of the image to load and display.
  final String imageUrl;

  /// The width of the image. If null, the image will size itself based on its content.
  final double? width;

  /// The height of the image. If null, the image will size itself based on its content.
  final double? height;

  /// How to inscribe the image into the space allocated during layout.
  final BoxFit fit;

  /// Widget displayed while the image is loading.
  /// If null, a default loading indicator is shown.
  final Widget? placeholder;

  /// Widget displayed when an error occurs while loading the image.
  /// If null, a default error widget is shown.
  final Widget? errorWidget;

  /// The width to use for the in-memory cache.
  final int? memCacheWidth;

  /// The height to use for the in-memory cache.
  final int? memCacheHeight;

  /// The maximum width to use for the disk cache.
  final int? maxWidthDiskCache;

  /// The maximum height to use for the disk cache.
  final int? maxHeightDiskCache;

  /// The key to use for the cache.
  final String? cacheKey;

  /// Whether to use the old image when the URL changes.
  final bool useOldImageOnUrlChange;

  /// The duration of the fade-in animation.
  final Duration fadeInDuration;

  /// The duration of the fade-out animation.
  final Duration fadeOutDuration;

  /// The curve of the fade-in animation.
  final Curve fadeInCurve;

  /// The curve of the fade-out animation.
  final Curve fadeOutCurve;

  /// The quality of the image filter.
  final FilterQuality filterQuality;

  /// How to repeat the image if it doesn't fill the space.
  final ImageRepeat repeat;

  /// Whether to match the text direction.
  final bool matchTextDirection;

  /// The color to blend with the image.
  final Color? color;

  /// The blend mode to use when blending the color.
  final BlendMode? colorBlendMode;

  /// The cache manager to use.
  final dynamic cacheManager;

  /// The HTTP headers to use when loading the image.
  final Map<String, String>? httpHeaders;

  /// Builder for the progress indicator.
  final ProgressIndicatorBuilder? progressIndicatorBuilder;

  /// The size of the progress indicator.
  final Size progressIndicatorSize;

  /// The color of the progress indicator.
  final Color? progressIndicatorColor;

  /// The stroke width of the progress indicator.
  final double progressIndicatorStrokeWidth;

  /// The background color of the progress indicator.
  final Color? progressIndicatorBackgroundColor;

  /// Whether to use a circular progress indicator.
  final bool progressIndicatorCircular;

  /// The border radius of the image container.
  final BorderRadius? borderRadius;

  /// The border of the image container.
  final BoxBorder? border;

  /// The shadow of the image container.
  final List<BoxShadow>? shadow;

  /// The clip behavior of the image container.
  final Clip clipBehavior;

  /// Creates a network image widget.
  ///
  /// The [imageUrl] parameter is required and should be a valid URL string.
  /// All other parameters are optional and provide customization options.
  const NbxNetworkImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.placeholder,
    this.errorWidget,
    this.memCacheWidth,
    this.memCacheHeight,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    this.cacheKey,
    this.useOldImageOnUrlChange = false,
    this.fadeInDuration = const Duration(milliseconds: 300),
    this.fadeOutDuration = const Duration(milliseconds: 300),
    this.fadeInCurve = Curves.easeOut,
    this.fadeOutCurve = Curves.easeIn,
    this.filterQuality = FilterQuality.low,
    this.repeat = ImageRepeat.noRepeat,
    this.matchTextDirection = false,
    this.color,
    this.colorBlendMode,
    this.cacheManager,
    this.httpHeaders,
    this.progressIndicatorBuilder,
    this.progressIndicatorSize = const Size(20, 20),
    this.progressIndicatorColor,
    this.progressIndicatorStrokeWidth = 2.0,
    this.progressIndicatorBackgroundColor,
    this.progressIndicatorCircular = true,
    this.borderRadius,
    this.border,
    this.shadow,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: border,
        boxShadow: shadow,
      ),
      clipBehavior: clipBehavior,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
        placeholder: placeholder != null
            ? (context, url) => placeholder!
            : null,
        errorWidget: errorWidget != null
            ? (context, url, error) => errorWidget!
            : null,
        memCacheWidth: memCacheWidth,
        memCacheHeight: memCacheHeight,
        maxWidthDiskCache: maxWidthDiskCache,
        maxHeightDiskCache: maxHeightDiskCache,
        cacheKey: cacheKey,
        useOldImageOnUrlChange: useOldImageOnUrlChange,
        fadeInDuration: fadeInDuration,
        fadeOutDuration: fadeOutDuration,
        fadeInCurve: fadeInCurve,
        fadeOutCurve: fadeOutCurve,
        filterQuality: filterQuality,
        repeat: repeat,
        matchTextDirection: matchTextDirection,
        color: color,
        colorBlendMode: colorBlendMode,
        cacheManager: cacheManager,
        httpHeaders: httpHeaders,
        progressIndicatorBuilder:
            progressIndicatorBuilder ?? _buildDefaultProgressIndicator,
      ),
    );
  }

  /// Builds the default placeholder widget.
  Widget _buildDefaultPlaceholder() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[200],
      child: Center(
        child: Icon(Icons.image, size: _getIconSize(), color: Colors.grey[400]),
      ),
    );
  }

  /// Builds the default error widget.
  Widget _buildDefaultErrorWidget() {
    return Container(
      width: width,
      height: height,
      color: Colors.grey[100],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.broken_image,
              size: _getIconSize(),
              color: Colors.grey[400],
            ),
            const SizedBox(height: 8),
            Text(
              'Failed to load image',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the default progress indicator.
  Widget _buildDefaultProgressIndicator(
    BuildContext context,
    String url,
    DownloadProgress progress,
  ) {
    if (progressIndicatorCircular) {
      return Center(
        child: SizedBox(
          width: progressIndicatorSize.width,
          height: progressIndicatorSize.height,
          child: CircularProgressIndicator(
            value: progress.progress,
            strokeWidth: progressIndicatorStrokeWidth,
            backgroundColor:
                progressIndicatorBackgroundColor ?? Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              progressIndicatorColor ?? Colors.blue,
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: SizedBox(
          width: progressIndicatorSize.width,
          height: progressIndicatorSize.height,
          child: LinearProgressIndicator(
            value: progress.progress,
            backgroundColor:
                progressIndicatorBackgroundColor ?? Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              progressIndicatorColor ?? Colors.blue,
            ),
          ),
        ),
      );
    }
  }

  /// Calculates the appropriate icon size based on the widget dimensions.
  double _getIconSize() {
    if (width != null && height != null) {
      return (width! < height! ? width! : height!) * 0.3;
    } else if (width != null) {
      return width! * 0.3;
    } else if (height != null) {
      return height! * 0.3;
    }
    return 48.0; // Default size
  }
}

/// Extension methods for NbxNetworkImage to provide convenient factory constructors.
extension NbxNetworkImageExtensions on NbxNetworkImage {
  /// Creates a circular network image with the specified radius.
  static NbxNetworkImage circular({
    required String imageUrl,
    required double radius,
    BoxFit fit = BoxFit.cover,
    Widget? placeholder,
    Widget? errorWidget,
    BorderRadius? borderRadius,
    BoxBorder? border,
    List<BoxShadow>? shadow,
  }) {
    return NbxNetworkImage(
      imageUrl: imageUrl,
      width: radius * 2,
      height: radius * 2,
      fit: fit,
      placeholder: placeholder,
      errorWidget: errorWidget,
      borderRadius: borderRadius ?? BorderRadius.circular(radius),
      border: border,
      shadow: shadow,
    );
  }

  /// Creates a square network image with the specified size.
  static NbxNetworkImage square({
    required String imageUrl,
    required double size,
    BoxFit fit = BoxFit.cover,
    Widget? placeholder,
    Widget? errorWidget,
    BorderRadius? borderRadius,
    BoxBorder? border,
    List<BoxShadow>? shadow,
  }) {
    return NbxNetworkImage(
      imageUrl: imageUrl,
      width: size,
      height: size,
      fit: fit,
      placeholder: placeholder,
      errorWidget: errorWidget,
      borderRadius: borderRadius,
      border: border,
      shadow: shadow,
    );
  }

  /// Creates a network image with rounded corners.
  static NbxNetworkImage rounded({
    required String imageUrl,
    double? width,
    double? height,
    required double borderRadius,
    BoxFit fit = BoxFit.cover,
    Widget? placeholder,
    Widget? errorWidget,
    BoxBorder? border,
    List<BoxShadow>? shadow,
  }) {
    return NbxNetworkImage(
      imageUrl: imageUrl,
      width: width,
      height: height,
      fit: fit,
      placeholder: placeholder,
      errorWidget: errorWidget,
      borderRadius: BorderRadius.circular(borderRadius),
      border: border,
      shadow: shadow,
    );
  }
}
