main() {
  List<Map<String, dynamic>> listData = [
    {'id': 1, 'title': 'IRPF', 'category': 'Fiscal'},
    {'id': 2, 'title': 'IRPF', 'category': 'Contabil'},
    {'id': 3, 'title': 'IRPF', 'category': 'Contabil'},
    {'id': 4, 'title': 'IRPF', 'category': 'Fiscal'},
  ];

  var listFiscal = listData.where((element) => element['category'] == 'Fiscal').toList();

  print(listFiscal);

}
