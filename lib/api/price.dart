class Price {
  late Current current;
  late bool? isMarkedDown;
  late bool? isOutletPrice;
  late String currency;

  Price({
    required this.currency,
    required this.current,
    required this.isMarkedDown,
    required this.isOutletPrice,
  });

  Price.fromMap(Map<String, dynamic> map) {
    this.current =
        Current.fromMap(map['current']); // it comes as a map not a list

    this.isOutletPrice = map['isOutletPrice'];

    this.isMarkedDown = map['isMarkedDown '];

    this.currency = map['currency'];
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "current": this.current.toMap(),
      "isOutletPrice": this.isOutletPrice,
      "isMarkedDown": this.isMarkedDown,
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
