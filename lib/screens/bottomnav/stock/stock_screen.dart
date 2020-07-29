import 'package:flutter/material.dart';
import 'package:flutter_stock/screens/add_product/add_product_screen.dart';
import 'package:flutter_stock/services/rest_api.dart';
import 'package:flutter_stock/models/Product.dart';

final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();

class StockScreen extends StatefulWidget {
  StockScreen({Key key}) : super(key: key);

  @override
  _StockScreenState createState() => _StockScreenState();
}

class _StockScreenState extends State<StockScreen> {
  // CallAPI Service
  CallAPI callAPI;

  // สร้าง Context
  BuildContext context;

  @override
  void initState() {
    super.initState();
    callAPI = CallAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldState , 
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Product List'),
        actions: <Widget>[
          InkWell(
              onTap: () {
                print('top on add button');
                Navigator.pushNamed(context, "/addproduct");
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 16),
                child: Icon(Icons.add),
              ))
        ],
      ),
      body: Center(
        child: FutureBuilder(
          future: callAPI.getProducts(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
            if (snapshot.hasError) {
              return Center(
                child:
                    Text('Something wrong with ${snapshot.error.toString()}'),
              );
            } else if (snapshot.connectionState == ConnectionState.done) {
              List<Product> products = snapshot.data;
              return _buildListView(products);
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  // ListView builder
  Widget _buildListView(List<Product> products) {
    return ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          // Load Model
          Product product = products[index];
          print(product.toString());
          return Card(
            child: InkWell(
              onTap: () {
                print('tab on card view');
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 20),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.3,
                            child: product.productImage == null  ? Image(image: AssetImage('assets/images/no-image.jpg')) : Image.network(product.productImage),
                          ),
                        ),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              product.productName,
                              style: TextStyle(fontSize: 24),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Text(product.productBarcode,
                                style: TextStyle(fontSize: 18)),
                            Text("THB " + product.productPrice,
                                style: TextStyle(fontSize: 16)),
                          ],
                        ))
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        FlatButton(
                            onPressed: () {
                              print('Tab on edit button');

                              print(product);

                              // return
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return AddProductScreen(product: product);
                              }));
                            },
                            child: Text(
                              'Edit',
                              style: TextStyle(color: Colors.blue),
                            )),
                        FlatButton(
                            onPressed: () {
                              print('Tab on delete button');
                              showConfirmDeleteProduct(context , product);
                            },
                            child: Text(
                              'Delete',
                              style: TextStyle(color: Colors.red),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }


  void showConfirmDeleteProduct(BuildContext context, Product product) {
    Widget _cancelButton = RaisedButton(
      child: Text('Cancel'),
      onPressed: () {
         
        //  _scaffoldState.currentState.showSnackBar(
        //     SnackBar(content: Text("TEST SNACK BAR"))
        //   );                        
          Scaffold.of(context).showSnackBar(
            SnackBar( content: Text("Changes discarded")) 
          );

          
         Navigator.pop(context);
      },
    );
    Widget _confirmButton = RaisedButton(
      child: Text('Proceed Deleting'),
      onPressed: () {
         print("confirm dialog CONFIRM pressed") ;

         CallAPI().deleteProduct(product).then( (isSuccess) {
            // refresh parent screen

            if(isSuccess) {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new StockScreen()),
              );
            } else {
              print("Create fail");
            }
            
            
         });
      },
      color: Colors.red ,
    );


    AlertDialog dialog = AlertDialog(
      title: Text("Confirm deleting" , style: TextStyle(color: Colors.red ),) , 
      content: Text("Are you sure wants to completely remove this product#${product.id}?"),
      actions: <Widget>[
        _confirmButton , 
        _cancelButton
      ],
    );

    showDialog(
      context: context , 
      builder: (BuildContext context) {
        return dialog;
      }
    );

    

  }
}
