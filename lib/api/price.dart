class Price {
  late List<Current>? current;
  late bool isMarkedDown;
  late bool isOutletPrice;
  late String? currency;

  Price({
    required this.currency,
    required this.current,
    required this.isMarkedDown,
    required this.isOutletPrice,
  });

  Price.fromMap(Map<String, dynamic> map) {
    print('05020');
    this.current = [];
    (map['current'] as List).forEach((element) {
      this.current!.add(Current.fromMap(element)); ///////
    });
    print('04020');
    this.isOutletPrice = map['isOutletPrice'];
    print('03020');
    this.isMarkedDown = map['isMarkedDown '];
    print('005002');
    this.currency = map['currency'];
    print('005002');
  }
  Map<String, dynamic> toMap() {
    List<Map> tmpList = [];
    this.current!.forEach((element) {
      tmpList.add(element.toMap());
    });

    Map<String, dynamic> map = {
      "current": tmpList,
      "isOutletPrice": this.isOutletPrice,
      "isMarkedDown": this.isMarkedDown,
      "currency": this.currency,
    };
    return map;
  }
}

class Current {
  late int? value;
  late String? text;
  Current({
    required this.value,
    required this.text,
  });

  Current.fromMap(Map<String, dynamic> map) {
    this.value = map['value'];
    print("0000001");
    this.text = map['text'];
    print("0000002");
  }
  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = {
      "value": this.value,
      "text": this.text,
    };
    return map;
  }
}
