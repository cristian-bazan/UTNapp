class Encoder {
  
  List<String> encode(String text) {

    List<String> values = [];
    for (var i = 0; i < text.length; i++) {
      int valor = text.codeUnitAt(i);
      int coder = "\$".codeUnitAt(0);
      int encoderValor = valor + coder;
      values.add(encoderValor.toString());
    }
    
    return values;
  }

  String decode(List<String> values) {

    String text = '';
    for (var i = 0; i < values.length; i++) {
      int valor = int.parse( values[i]);
      int coder = "\$".codeUnitAt(0);
      int decoderValor = valor - coder;
      String character = String.fromCharCode(decoderValor);
      text = text+character;
    }
    
    return text;
  }
  
}