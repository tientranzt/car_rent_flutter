class CarType {
  var car_owner;
  var car_title;
  var create_date;
  var desc;
  var image;
  var phone_owner;
  var update_date;
  var user_post;

  CarType(
      {this.car_owner,
      this.car_title,
      this.create_date,
      this.desc,
      this.image,
      this.phone_owner,
      this.update_date,
      this.user_post});

  factory CarType.fromJson(Map<String, dynamic> json) {
    return CarType(
      car_owner: json['car_owner'],
      car_title: json['car_title'],
      create_date: json['create_date'],
      desc: json['desc'],
      image: json['image'],
      phone_owner: json['phone_owner'],
      update_date: json['update_date'],
      user_post: json['user_post'],
    );
  }
}


class CarInfo {
  dynamic title;
  dynamic body;
  dynamic image;
  CarInfo({this.title, this.body, this.image});
}
