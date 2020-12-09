part of 'pages.dart';

class SignInPage extends StatefulWidget {
  SignInPage({Key key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Sign In'),
        ),
        body: Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.all(10),
            child: ListView(
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
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
                      icon: Icon(Icons.subdirectory_arrow_right),
                      label: Text('Sign In'),
                      textColor: Colors.white,
                      color: Colors.blue[500],
                      onPressed: () async {
                        if (ctrlEmail.text == '' || ctrlPassword.text == '') {
                          Fluttertoast.showToast(
                            msg: "Please fill all fields!",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.BOTTOM,
                            backgroundColor: Colors.red,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        } else {
                          setState(() {
                            isLoading = true;
                          });
                          String result = await AuthServices.signIn(
                              ctrlEmail.text, ctrlPassword.text);
                          if (result == 'success') {
                            Fluttertoast.showToast(
                              msg: "Sign in successfully!",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0,
                            );
                            setState(() {
                              isLoading = false;
                            });
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return MainMenu();
                            }));
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
                          setState(() {
                            isLoading = false;
                          });
                        }
                      },
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    RichText(
                      text: TextSpan(
                          text: 'No Account? Sign up.',
                          style: TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacement(context,
                                  MaterialPageRoute(builder: (context) {
                                return SignUpPage();
                              }));
                            }),
                    )
                  ],
                ),
                isLoading == true
                    ? Container(
                        width: double.infinity,
                        height: double.infinity,
                        color: Colors.transparent,
                        child: SpinKitFadingCircle(
                          size: 50,
                          color: Colors.blue,
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
