class PlantInfo {
  final String commonName;
  final String scientificName;
  final String species;
  final String careInstructions;
  final String? imageUrl;

  PlantInfo({
    required this.commonName,
    required this.scientificName,
    required this.species,
    required this.careInstructions,
    this.imageUrl,
  });
}
