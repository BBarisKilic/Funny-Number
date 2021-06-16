class Result {
  String? head;
  String? body;

  Result();

  Result.withText(String text) {
    int index = text.indexOf(" ");
    List parts = [
      text.substring(0, index).trim(),
      text.substring(index + 1).trim(),
    ];
    head = parts[0];
    body = parts[1][0].toUpperCase() + parts[1].substring(1);
  }
}
