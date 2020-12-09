part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ctrlName = TextEditingController();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();

  @override
  void dispose() {
    ctrlName.dispose();
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: 20),
                  TextFormField(
                    controller: ctrlName,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.account_circle),
                        labelText: 'Full Name',
                        hintText: 'Write your full name',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: ctrlEmail,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email),
                        labelText: 'Email',
                        hintText: 'Write your email',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    obscureText: true,
                    controller: ctrlPassword,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        labelText: 'Password',
                        hintText: 'Write your password',
                        border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 40),
                  RaisedButton.icon(
                    icon: Icon(Icons.add),
                    label: Text('Sign Up'),
                    textColor: Colors.white,
                    color: Colors.blue[500],
                    onPressed: () async {
                      if (ctrlName.text == '' ||
                          ctrlEmail.text == '' ||
                          ctrlPassword.text == '') {
                        Fluttertoast.showToast(
                          msg: "Please fill all fields!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0,
                        );
                      } else {
                        String result = await AuthServices.signUp(
                            ctrlEmail.text, ctrlPassword.text, ctrlName.text);
                        if (result == "success") {
                          Fluttertoast.showToast(
                            msg: "Sign up successfully!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          Fluttertoast.showToast(
                            msg: result,
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        }
                      }
                    },
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  RichText(
                    text: TextSpan(
                        text: 'Already Registered? Sign in.',
                        style: TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return SignInPage();
                            }));
                          }),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
