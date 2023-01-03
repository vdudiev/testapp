import 'package:testapp/sourse.dart';

class ProductModel {
  double? clr;
  double? prtn;
  double? ft;
  double? tcrb;
  double? sgr;
  double? gl;
  double? clrj;
  double? ncrb;
  List<String>? als;
  String? src;
  String? sgm;
  String? gr;
  String? nm;
  Mmt? mmt;
  bool? isFavorite;

  ProductModel(
      {this.clr,
      this.prtn,
      this.isFavorite = false,
      this.ft,
      this.tcrb,
      this.sgr,
      this.gl,
      this.clrj,
      this.ncrb,
      this.als,
      this.src,
      this.sgm,
      this.gr,
      this.nm,
      this.mmt});

  ProductModel.fromJson(Map<String, dynamic> json) {
    isFavorite = json['isFavorite'] ?? false;
    clr = json['clr'].toString().toDouble();
    prtn = json['prtn'].toString().toDouble();
    ft = json['ft'].toString().toDouble();
    tcrb = json['tcrb'].toString().toDouble();
    sgr = json['sgr'].toString().toDouble();
    gl = json['gl'].toString().toDouble();
    clrj = json['clrj'].toString().toDouble();
    ncrb = json['ncrb'].toString().toDouble();
    als =
        json["als"] == null ? [] : List<String>.from(json["als"].map((x) => x));

    src = json['src'];
    sgm = json['sgm'];
    gr = json['gr'];
    nm = json['nm'];
    mmt = json['mmt'] != null ? Mmt?.fromJson(json['mmt']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['clr'] = clr;
    data['prtn'] = prtn;
    data['ft'] = ft;
    data['tcrb'] = tcrb;
    data['sgr'] = sgr;
    data['gl'] = gl;
    data['clrj'] = clrj;
    data['ncrb'] = ncrb;
    data['als'] = als;
    data['src'] = src;
    data['sgm'] = sgm;
    data['gr'] = gr;
    data['nm'] = nm;
    if (mmt != null) {
      data['mmt'] = mmt?.toJson();
    }
    return data;
  }
}

class Mmt {
  String? u;
  double? q;
  double? s;
  double? g;
  bool? df;

  Mmt({this.u, this.q, this.s, this.g, this.df});

  Mmt.fromJson(Map<String, dynamic> json) {
    u = json['u'];
    q = json['q'].toString().toDouble();
    s = json['s'].toString().toDouble();
    g = json['g'].toString().toDouble();
    df = json['df'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['u'] = u;
    data['q'] = q;
    data['s'] = s;
    data['g'] = g;
    data['df'] = df;
    return data;
  }
}
