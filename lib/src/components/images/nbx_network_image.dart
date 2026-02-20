import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'configs/export.dart';

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

  /// The HTTP headers to use when loading the image.
  final Map<String, String>? httpHeaders;

  /// Cache configuration options.
  final NbxImageCacheConfig cacheConfig;

  /// Animation configuration options.
  final NbxImageAnimationConfig animationConfig;

  /// Progress indicator configuration options.
  final NbxImageProgressConfig progressConfig;

  /// Style configuration options.
  final NbxImageStyleConfig styleConfig;

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
    this.httpHeaders,
    this.cacheConfig = const NbxImageCacheConfig(),
    this.animationConfig = const NbxImageAnimationConfig(),
    this.progressConfig = const NbxImageProgressConfig(),
    this.styleConfig = const NbxImageStyleConfig(),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: styleConfig.borderRadius,
        border: styleConfig.border,
        boxShadow: styleConfig.shadow,
      ),
      clipBehavior: styleConfig.clipBehavior,
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
        memCacheWidth: cacheConfig.memCacheWidth,
        memCacheHeight: cacheConfig.memCacheHeight,
        maxWidthDiskCache: cacheConfig.maxWidthDiskCache,
        maxHeightDiskCache: cacheConfig.maxHeightDiskCache,
        cacheKey: cacheConfig.cacheKey,
        useOldImageOnUrlChange: cacheConfig.useOldImageOnUrlChange,
        fadeInDuration: animationConfig.fadeInDuration,
        fadeOutDuration: animationConfig.fadeOutDuration,
        fadeInCurve: animationConfig.fadeInCurve,
        fadeOutCurve: animationConfig.fadeOutCurve,
        filterQuality: styleConfig.filterQuality,
        repeat: styleConfig.repeat,
        matchTextDirection: styleConfig.matchTextDirection,
        color: styleConfig.color,
        colorBlendMode: styleConfig.colorBlendMode,
        cacheManager: cacheConfig.cacheManager,
        httpHeaders: httpHeaders,
        progressIndicatorBuilder:
            progressConfig.progressIndicatorBuilder ??
            _buildDefaultProgressIndicator,
      ),
    );
  }

  /// Builds the default placeholder widget.
  Widget buildDefaultPlaceholder() {
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
  Widget buildDefaultErrorWidget() {
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
    if (progressConfig.progressIndicatorCircular) {
      return Center(
        child: SizedBox(
          width: progressConfig.progressIndicatorSize.width,
          height: progressConfig.progressIndicatorSize.height,
          child: CircularProgressIndicator(
            value: progress.progress,
            strokeWidth: progressConfig.progressIndicatorStrokeWidth,
            backgroundColor:
                progressConfig.progressIndicatorBackgroundColor ??
                Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              progressConfig.progressIndicatorColor ?? Colors.blue,
            ),
          ),
        ),
      );
    } else {
      return Center(
        child: SizedBox(
          width: progressConfig.progressIndicatorSize.width,
          height: progressConfig.progressIndicatorSize.height,
          child: LinearProgressIndicator(
            value: progress.progress,
            backgroundColor:
                progressConfig.progressIndicatorBackgroundColor ??
                Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(
              progressConfig.progressIndicatorColor ?? Colors.blue,
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
      styleConfig: NbxImageStyleConfig(
        borderRadius: borderRadius ?? BorderRadius.circular(radius),
        border: border,
        shadow: shadow,
      ),
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
      styleConfig: NbxImageStyleConfig(
        borderRadius: borderRadius,
        border: border,
        shadow: shadow,
      ),
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
      styleConfig: NbxImageStyleConfig(
        borderRadius: BorderRadius.circular(borderRadius),
        border: border,
        shadow: shadow,
      ),
    );
  }
}
