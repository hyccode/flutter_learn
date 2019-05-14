class ChengyuEntity {
  String head;
  String chengyujs;
  String pinyin;
  List<String> tongyi;
  String from;
  String yinzhengjs;
  List<String> fanyi;
  String ciyujs;
  String bushou;
  String example;
  String yufa;

  ChengyuEntity(
      {this.head,
      this.chengyujs,
      this.pinyin,
      this.tongyi,
      this.from,
      this.yinzhengjs,
      this.fanyi,
      this.ciyujs,
      this.bushou,
      this.example,
      this.yufa});

  ChengyuEntity.fromJson(Map<String, dynamic> json) {
      head = json['head'];
    chengyujs = json['chengyujs'];
    pinyin = json['pinyin'];
    tongyi = new List<String>.from(json['tongyi']);
    from = json['from_'];
    yinzhengjs = json['yinzhengjs'];
    if (json['fanyi'] != null) {
      fanyi = new List<String>.from(json['fanyi']);
    }

    ciyujs = json['ciyujs'];
    bushou = json['bushou'];
    example = json['example'];
    yufa = json['yufa'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['head'] = this.head;
    data['chengyujs'] = this.chengyujs;
    data['pinyin'] = this.pinyin;
    data['tongyi'] = this.tongyi;
    data['from_'] = this.from;
    data['yinzhengjs'] = this.yinzhengjs;
    data['fanyi'] = this.fanyi;
    data['ciyujs'] = this.ciyujs;
    data['bushou'] = this.bushou;
    data['example'] = this.example;
    data['yufa'] = this.yufa;
    return data;
  }
}
