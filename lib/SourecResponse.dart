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


  Source({required this.name  ,required this.description ,required this.id});

  factory Source.fromJson(Map<String , dynamic>  map )
  {
    return Source(name: map['name'], description: map['description'], id: map['id']);
  }
}
