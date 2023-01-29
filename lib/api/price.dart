class Price {
  late Map<String, dynamic> current;
  late Map<String, dynamic> previous;
  late Map<String, dynamic> rrp;
  late bool isMarkedDown;
  late bool isOutletPrice;
  late String currency;
}

class Current {
  late int value;
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

class Previous {
  late int value;
  late String text;
  Previous({
    required this.value,
    required this.text,
  });

  Previous.fromMap(Map<String, dynamic> map) {
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

class Rrp {
  late int value;
  late String text;
  Rrp({
    required this.value,
    required this.text,
  });

  Rrp.fromMap(Map<String, dynamic> map) {
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
