class MovieModel {
  int id;
  String title;
  String year;
  String rating;
  String description;
  String image;
  var createdAt;
  var updatedAt;
  static List<MovieModel> fromJsonList(jsonList) {
    return jsonList
        .map<MovieModel>((obj) => MovieModel.fromJson(obj))
        .toList();
  }
  MovieModel(
      {this.id,
        this.title,
        this.year,
        this.rating,
        this.description,
        this.image,
        this.createdAt,
        this.updatedAt});

  MovieModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    year = json['year'];
    rating = json['rating'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['year'] = this.year;
    data['rating'] = this.rating;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}