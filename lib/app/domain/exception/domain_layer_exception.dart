

class DomainLayerException implements Exception {
  String cause;

  DomainLayerException(this.cause);


  String toSring(){
    return cause;
  }
}