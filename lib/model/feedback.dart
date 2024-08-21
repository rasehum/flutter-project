class feedback {
  String uid;
  String name;
  String email;
  String message;

  feedback({this.uid, this.name, this.message});
  feedback.fromMap(Map<String, dynamic> data) {
    uid = data['uid'];
    name = data['name'];

    message = data['message'];
  }
  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'message': message,
    };
  }
}
