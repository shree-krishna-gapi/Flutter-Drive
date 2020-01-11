class FeedbackForm {
  String name;
  String email;
  String mobileNo;
  String description;

  FeedbackForm(this.name,this.email,this.mobileNo,this.description);

  // Method to make GET parameters
  String toParams()=>"?name=$name&email=$email&mobileNo=$mobileNo&feedback=$description";
}