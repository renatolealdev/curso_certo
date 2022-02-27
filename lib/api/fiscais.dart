
class Fiscais {
  List fiscais = [];

  Fiscais(this.fiscais);
}

class DataFiscal {
  String title;
  String banner;

  DataFiscal(this.title, this.banner);

  factory DataFiscal.fromJson(Map<String, dynamic> json) {
    return DataFiscal(json['title'], json['banner']);
  }

  Map<String, dynamic> toJson() => {
        'title': this.title,
        'banner': this.banner,
      };
}
