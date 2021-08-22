class SourceResponse
{
  String status ;
  List<Source> Sources ;

  SourceResponse({required this.Sources , required this.status});

  factory SourceResponse.fromJson( Map<String , dynamic> map )
  {
      List list = map['sources'];
      List<Source> sources = list.map((d) => Source.fromJson(map)).toList();
      return SourceResponse(
          Sources:sources,
          status: map['status']
      );
  }

}

class Source {
  String id ;
  String name ;
  String description ;
  String url;
  String category;
  String country;
  String language;


  Source({required this.id, required this.name, required this.description,
          required this.url, required this.language, required this.category,
          required this.country});

  factory Source.fromJson(Map<String , dynamic>  map )
  {
    return Source(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      url: map['url'],
      category: map['category'],
      country: map['country'],
      language: map['language']
    );
  }
}
