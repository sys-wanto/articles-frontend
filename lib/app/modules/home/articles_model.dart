class Articles {
  bool? isError;
  List<Data>? data;
  Vars? vars;
  List<String>? messages;

  Articles({this.isError, this.data, this.vars, this.messages});

  Articles.fromJson(Map<String, dynamic> json) {
    isError = json['is_error'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    vars = json['vars'] != null ? Vars.fromJson(json['vars']) : null;
    messages = json['messages'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['is_error'] = isError;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    if (vars != null) {
      data['vars'] = vars!.toJson();
    }
    data['messages'] = messages;
    return data;
  }
}

class Data {
  int? id;
  String? title;
  String? content;
  String? category;
  String? status;

  Data({this.id, this.title, this.content, this.category, this.status});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    title = json['Title'];
    content = json['Content'];
    category = json['Category'];
    status = json['Status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Id'] = id;
    data['Title'] = title;
    data['Content'] = content;
    data['Category'] = category;
    data['Status'] = status;
    return data;
  }
}

class Vars {
  int? rowLimit;
  int? nextPage;
  int? prevPage;
  int? dataCount;

  Vars({this.rowLimit, this.nextPage, this.prevPage, this.dataCount});

  Vars.fromJson(Map<String, dynamic> json) {
    rowLimit = json['row_limit'];
    nextPage = json['next_page'];
    prevPage = json['prev_page'];
    dataCount = json['data_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['row_limit'] = rowLimit;
    data['next_page'] = nextPage;
    data['prev_page'] = prevPage;
    data['data_count'] = dataCount;
    return data;
  }
}
