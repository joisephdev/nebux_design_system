import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Configuration for image caching behavior in [NbxNetworkImage].
class NbxImageCacheConfig {
  /// Maximum width for the in-memory cache. Null means no constraint.
  final int? memCacheWidth;

  /// Maximum height for the in-memory cache. Null means no constraint.
  final int? memCacheHeight;

  /// Maximum width for the disk cache.
  final int? maxWidthDiskCache;

  /// Maximum height for the disk cache.
  final int? maxHeightDiskCache;

  /// Custom cache key. If null, the image URL is used.
  final String? cacheKey;

  /// Whether to keep displaying the old image when the URL changes.
  final bool useOldImageOnUrlChange;

  /// Custom cache manager instance.
  final BaseCacheManager? cacheManager;

  /// Creates a cache configuration.
  const NbxImageCacheConfig({
    this.memCacheWidth,
    this.memCacheHeight,
    this.maxWidthDiskCache,
    this.maxHeightDiskCache,
    this.cacheKey,
    this.useOldImageOnUrlChange = false,
    this.cacheManager,
  });
}
