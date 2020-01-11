import 'package:flutter/material.dart';
import 'form_controller.dart';
import 'form.dart';
void main()=> runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Sheet Insert',
      theme: ThemeData(primarySwatch: Colors.green),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Adding Form to Google Sheet'),
    );
  }
}
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key,this.title}): super(key:key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNoController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  void _submitForm() {
    if (_formKey.currentState.validate()) {
      FeedbackForm feedbackForm = FeedbackForm(
        nameController.text,
        emailController.text,
        mobileNoController.text,
          descriptionController.text
      );
      FormController formController = FormController((String response) {
        print("Response: $response");
        if(response == FormController.STATUS_SUCCESS) {
          _showSnackbar("Feedback Submitted");
        }else {
          _showSnackbar("Error Occurred!");
        }
      });
      _showSnackbar("Submitting Feedback");
      formController.submitForm(feedbackForm);
    }
  }

  _showSnackbar(String message) {
    final snackBar = SnackBar(content: Text(message),);
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Form(
              key: _formKey,
              child: Padding(padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    TextFormField(
                      controller:  nameController,
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Enter Valid Name';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: 'Name'
                      ),
                    ),

                    TextFormField(
                      controller:  emailController,
                      validator: (value) {
                        if(!value.contains("@")){
                          return 'Enter Valid Email';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          labelText: 'Email'
                      ),
                    ),

                    TextFormField(
                      controller:  mobileNoController,
                      validator: (value) {
                        if(value.trim().length !=10){
                          return 'Enter 10 Digit Mobile Number';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: 'Mobile Number'
                      ),
                    ),

                    TextFormField(
                      controller:  descriptionController,
                      validator: (value) {
                        if(value.isEmpty){
                          return 'Enter Description';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          labelText: 'Description'
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top:20.0),
                        child: RaisedButton(onPressed: _submitForm,
                          color: Colors.green,
                          textColor: Colors.white,
                          child: Text('Submit Data'),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            )
          ],
        ),
      ),

      
      
      
    );
  }
}

