extension AssetExtensions on String {
  // PNG File Extension with directory path
  String get png => "asset/images/$this.png";

  // JPEG File Extension with directory path
  String get jpeg => "assets/images/$this.jpeg";
}