part of 'pages.dart';

class DetailProductPage extends StatefulWidget {
  final Products product;
  DetailProductPage({this.product});

  @mustCallSuper
  @override
  _DetailProductPageState createState() => _DetailProductPageState(product);
}

class _DetailProductPageState extends State<DetailProductPage> {
  Products product;
  _DetailProductPageState(this.product);

  FirebaseStorage storage = FirebaseStorage.instance;
  final ctrlName = TextEditingController();
  final ctrlPrice = TextEditingController();

  bool isLoading = false;
  @override
  void dispose() {
    ctrlName.dispose();
    ctrlPrice.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Detail Product'),
          centerTitle: true,
          leading: Container(),
        ),
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: ctrlName..text = product.name,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_tree_rounded),
                          labelText: 'Product Name',
                          hintText: 'Write your product name!',
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.number,
                        controller: ctrlPrice..text = product.price.toString(),
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.attach_money_rounded),
                          labelText: 'Price',
                          hintText: "Write your product's price!",
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 100,
                        child: Image.network(product.image),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RaisedButton(
                            color: Colors.blue,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(15),
                            child: Text('Update Product'),
                            onPressed: () async {
                              if (ctrlName.text == "" || ctrlPrice.text == "") {
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
                                bool result =
                                    await ProductServices.updateProduct(
                                        product.id,
                                        ctrlName.text,
                                        int.parse(ctrlPrice.text));
                                if (result == true) {
                                  Fluttertoast.showToast(
                                    msg: "Add product succesfull!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.green,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });
                                  Navigator.of(context).pop();
                                } else {
                                  Fluttertoast.showToast(
                                    msg: "Failed! Try again",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.BOTTOM,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0,
                                  );
                                  setState(() {
                                    isLoading = false;
                                  });
                                }
                              }
                            },
                          ),
                          RaisedButton(
                            color: Colors.redAccent,
                            textColor: Colors.white,
                            padding: EdgeInsets.all(15),
                            child: Text('Delete Product'),
                            onPressed: () async {
                              setState(() {
                                isLoading = true;
                              });
                              bool result = await ProductServices.deleteProduct(
                                product.id,
                              );
                              if (result == true) {
                                Fluttertoast.showToast(
                                  msg: "Delete product succesfull!",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                setState(() {
                                  isLoading = false;
                                });
                                Navigator.of(context).pop();
                              } else {
                                Fluttertoast.showToast(
                                  msg: "Failed! Try again",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0,
                                );
                                setState(() {
                                  isLoading = false;
                                });
                              }
                            },
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
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
    );
  }
}
