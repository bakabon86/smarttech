class BodyRequest{
  String username;
  String password;

  BodyRequest({this.username,this.password});

  Map<String, dynamic> toJson() => {
    'username' : this.username,
    'password' : this.password
  };
}