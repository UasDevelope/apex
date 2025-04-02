class AppAssets {
  // Logos (PNG)
  static get logo => "logo".png;
}

extension AssetExtensions on String {
  // PNG File Extension with directory path
  String get png => "assets/images/$this.png";

  // JPEG File Extension with directory path
  String get jpeg => "assets/images/$this.jpeg";
}
