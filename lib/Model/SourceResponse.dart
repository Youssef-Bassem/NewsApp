class SourceResponse {
  String status;

  List<Source> sources;

  SourceResponse.fromJson(Map<String, dynamic> map):
        status = map['status'],
        sources = List<Source>.from(map["sources"].map((it) => Source.fromJson(it)));
}

class Source {
  String id ;
  String name ;
  String description ;
  String url;
  String category;
  String country;
  String language;


  Source.fromJson(Map<String , dynamic>  map ):
        id = map["id"] != null?map["id"]:'' ,
        name = map["name"]!=null?map["name"]:'',
        description = map["description"]!=null?map["description"]:'',
        url = map["url"]!=null?map["url"]:'',
        category = map["category"]!=null?map["category"]:'',
        language = map["language"]!=null?map["language"]:'',
        country = map["country"]!=null?map["country"]:'';
}