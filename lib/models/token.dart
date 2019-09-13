
class Token {
  String accessToken;
  String tokenType;
  int expiresIn;
  DateTime loginTime;

  Token({this.accessToken, this.tokenType, this.expiresIn, this.loginTime});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        accessToken: json['access_token'],
        tokenType: json['token_type'],
        expiresIn: int.parse(json['expires_in']),
        loginTime: DateTime.now());
  }

  DateTime get expireTime {
    return loginTime.add(Duration(seconds: expiresIn));
  }

  String get dateOnly {
    return loginTime.year.toString() +
        '-' +
        loginTime.month.toString() +
        '-' +
        loginTime.day.toString();
  }
}
