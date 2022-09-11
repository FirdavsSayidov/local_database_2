class User{
  String? email;
  String? password;
  String? username;
  String? phonenumber;
  User({this.username,this.email,this.phonenumber,this.password});
  User.from({this.email,this.password});

    User.fromJson(Map<String,dynamic> json)
  : email = json['email'],
   password = json['password'],
  username = json['Username'],
  phonenumber = json['Phonenumber'];

    Map <String,dynamic> toJson() =>{
      'email' : email,
      'password' : password,
      'username' : username,
      'phonenumber' : phonenumber
    };


}