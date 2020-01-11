import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'form.dart';

class FormController {
  final void Function(String) callback;
  static const String URL ="https://script.google.com/macros/s/AKfycbxw6Mg_WGFbCvO6yWM6qx0Kwx5BNxpEKYIuMdbmwbWkB6vWN7U/exec";
  static const STATUS_SUCCESS = "SUCCESS";
  FormController(this.callback);
  // Async function which saves feedback, parses [feedbackform] parameters
  // and sends HTTP GET request on [URL]. On successful response, [callback] is called.
  void submitForm(FeedbackForm feedbackForm) async {
    try {
      await http.get (
        URL + feedbackForm.toParams()
      ).then((response){
        callback(convert.jsonDecode(response.body)['status']);
      });
    } catch(e) {
      print(e);
    }
  }
}