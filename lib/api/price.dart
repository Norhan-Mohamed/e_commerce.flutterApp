class Price {
  late Current current;

  late String currency;

  Price({
    required this.currency,
    required this.current,
  });

  Price.fromMap(Map<String, dynamic> map) {
    this.current =
        Current.fromMap(map['current']); // it comes as a map not a list

    this.currency = map['currency'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "current": this.current.toMap(),
      "currency": this.currency,
    };
    return map;
  }
}

class Current {
  late double value;
  late String text;
  Current({
    required this.value,
    required this.text,
  });

  Current.fromMap(Map<String, dynamic> map) {
    this.value = map['value'];

    this.text = map['text'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "value": this.value,
      "text": this.text,
    };
    return map;
  }
}
