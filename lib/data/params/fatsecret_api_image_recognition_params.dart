class FatsecretApiImageRecognitionParams {
  FatsecretApiImageRecognitionParams({required this.imageBase64});

  final String imageBase64;

  static const String imageBase64Key = 'image_base64';

  Map<String, dynamic> toMap() {
    return {imageBase64Key: imageBase64};
  }
}
