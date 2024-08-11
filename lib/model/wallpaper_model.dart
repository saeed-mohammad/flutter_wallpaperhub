class WallpaperModel {
  String photographer;
  String photographerUrl;
  int photographerId;
  SrcModel src;

  WallpaperModel({
    required this.photographer,
    required this.photographerUrl,
    required this.photographerId,
    required this.src,
  });

  factory WallpaperModel.fromJson(Map<String, dynamic> jsonData) {
    return WallpaperModel(
      photographer: jsonData['photographer'],
      photographerUrl: jsonData['photographer_url'],
      photographerId: jsonData['photographer_id'],
      src: SrcModel.fromJson(jsonData['src']), // Corrected to parse 'src' using SrcModel.fromJson
    );
  }
}

class SrcModel {
  String original;
  String small;
  String portrait;

  SrcModel({
    required this.original,
    required this.small,
    required this.portrait,
  });

  factory SrcModel.fromJson(Map<String, dynamic> jsonData) {
    return SrcModel(
      original: jsonData['original'],
      small: jsonData['small'],
      portrait: jsonData['portrait'],
    );
  }
}
