class DomainLayerException implements Exception{
  String message;

  DomainLayerException({ required this.message});
  @override
  String toString() {
    return message;
  }

}