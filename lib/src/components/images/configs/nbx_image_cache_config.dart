import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class NbxImageCacheConfig {
  final int? memCacheWidth;
  final int? memCacheHeight;
  final int? maxWidthDiskCache;
  final int? maxHeightDiskCache;
  final String? cacheKey;
  final bool useOldImageOnUrlChange;
  final BaseCacheManager? cacheManager;

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
