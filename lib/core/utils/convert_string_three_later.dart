String convert(String text) {
  if (text.isEmpty) {
    return text;
  }
  print('a');

  var buffer = StringBuffer();
  for (int i = 0; i < text.length; i++) {
    buffer.write(text[i]);
    var nonZeroIndex = i + 1;
    if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
      buffer.write(' ');
    }
  }

  var string = buffer.toString();
  return string;
}
