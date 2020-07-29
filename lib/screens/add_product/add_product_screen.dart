import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stock/models/Product.dart';
import 'package:flutter_stock/screens/bottomnav/stock/stock_screen.dart';
import 'package:flutter_stock/services/rest_api.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final GlobalKey<ScaffoldState> _scaffoldAddProductState =
    GlobalKey<ScaffoldState>();

class AddProductScreen extends StatefulWidget {
  final Product product;
  AddProductScreen({this.product});

  @override
  _AddProductScreenState createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final formKey = GlobalKey<FormState>();
  String productName,
      productDetail,
      productImage,
      productQty,
      productBarcode,
      productStatus,
      productPrice,
      productCategory;

  TextEditingController _productNameController = new TextEditingController();
  TextEditingController _productDetailController = new TextEditingController();
  TextEditingController _productBarcodeController = new TextEditingController();
  TextEditingController _productQtyController = new TextEditingController();
  TextEditingController _productPriceController = new TextEditingController();
  TextEditingController _productImageController = new TextEditingController();
  TextEditingController _productCategoryController =
      new TextEditingController();
  TextEditingController _productStatusController = new TextEditingController();

  TextEditingController _productIdController = new TextEditingController();

  @override
  void initState() {
    if (widget.product != null) {
      _productNameController.text = widget.product.productName;
      _productDetailController.text = widget.product.productDetail;
      _productBarcodeController.text = widget.product.productBarcode;
      _productQtyController.text = widget.product.productQty.toString();
      _productPriceController.text = widget.product.productPrice.toString();
      _productImageController.text = widget.product.productImage;
      _productCategoryController.text = widget.product.productCategory;
      _productStatusController.text = widget.product.productStatus.toString();

      _productIdController.text = widget.product.id.toString();
    }
    super.initState();
  }

  Widget productNameText() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: true,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      controller: _productNameController,
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.teal,
            size: 24,
          ),
          // hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product name',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        if (value.isEmpty) {
          return "Product name cannot left empty";
        }
        return null;
      },
      onSaved: (newValue) => productName = newValue,
    );
  }

  Widget productDetailText() {
    return TextFormField(
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      controller: _productDetailController,
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.description,
            color: Colors.teal,
            size: 24,
          ),
          // hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product detail',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        if (value.isEmpty) {
          return "Product detail cannot left empty";
        }
        return null;
      },
      onSaved: (newValue) => productDetail = newValue,
    );
  }

  Widget productBarcodeText() {
    return TextFormField(
      controller: _productBarcodeController,
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
        new LengthLimitingTextInputFormatter(13)
      ],
      autofocus: false,
      onEditingComplete: () {
        print("me - editingComplete?");
      },
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
        // icon: Icon(Icons.email),
        prefixIcon:
            // Icon(
            //   Icons.mail,
            //   color: Colors.teal,
            //   size: 24,
            // ),
            Icon(
          FontAwesomeIcons.barcode,
          color: Colors.teal,
          size: 24,
        ),
        // hintText: 'you@email.com',
        hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
        labelText: 'Product barcode',
        labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
        contentPadding:
            new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(32.0),
        ),
        errorStyle: TextStyle(fontSize: 16.0),
      ),
      validator: (value) {
        if (value.isEmpty) {
          return "Product barcode cannot left empty";
        }
        if (value.length != 13) {
          return "Barcode must be 13 digits";
        }
        return null;
      },
      onSaved: (newValue) => productBarcode = newValue,
    );
  }

  Widget productCategoryText() {
    return TextFormField(
      controller: _productCategoryController,
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.category,
            color: Colors.teal,
            size: 24,
          ),
          // hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product category',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        if (value.isEmpty) {
          return "Product category cannot left empty";
        }
        return null;
      },
      onSaved: (newValue) => productCategory = newValue,
    );
  }

  Widget productQtyText() {
    return TextFormField(
      controller: _productQtyController,
      keyboardType: TextInputType.number,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.teal,
            size: 24,
          ),
          // hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product Qty',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        if (value.isEmpty) {
          return "Product Qty cannot left empty";
        }
        return null;
      },
      onSaved: (newValue) => productQty = newValue,
    );
  }

  Widget productPriceText() {
    return TextFormField(
      controller: _productPriceController,
      keyboardType: TextInputType.number,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.attach_money,
            color: Colors.teal,
            size: 24,
          ),
          // hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product Price',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        if (value.isEmpty) {
          return "Product price cannot left empty";
        }
        return null;
      },
      onSaved: (newValue) => productPrice = newValue,
    );
  }

  Widget productImageText() {
    return TextFormField(
      controller: _productImageController,
      keyboardType: TextInputType.text,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.collections,
            color: Colors.teal,
            size: 24,
          ),
          // hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product image',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          errorStyle: TextStyle(fontSize: 16.0)),
      validator: (value) {
        return null;
      },
      onSaved: (newValue) => productImage = newValue,
    );
  }

  Widget productStatusText() {
    return TextFormField(
      controller: _productStatusController,
      keyboardType: TextInputType.phone,
      autofocus: false,
      style: TextStyle(fontSize: 20, color: Colors.teal),
      decoration: InputDecoration(
          // icon: Icon(Icons.email),
          prefixIcon: Icon(
            Icons.traffic,
            color: Colors.teal,
            size: 24,
          ),
          // hintText: 'you@email.com',
          hintStyle: TextStyle(fontSize: 20, color: Colors.grey),
          labelText: 'Product Status',
          labelStyle: TextStyle(color: Colors.teal, fontSize: 20),
          contentPadding:
              new EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32.0),
          ),
          errorStyle: TextStyle(fontSize: 16.0)),
      onSaved: (newValue) => productStatus = newValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    print("WTH?");
    print(widget.toString());
    print(widget.product);
    String _title = 'Add new product';

    if (widget.product != null) {
      print("Product was sent!");
      _title = 'Edit Product#' + widget.product.id.toString();
    } else {
      print("Product IS EMPTY!");
    }

    return Scaffold(
      key: _scaffoldAddProductState,
      appBar: AppBar(
        title: Text(_title),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Form(
          key: formKey,
          child: ListView(
            children: <Widget>[
              (_productImageController.text != null &&
                      _productImageController.text != "")
                  ? Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        child: Image.network(_productImageController.text),
                        width: MediaQuery.of(context).size.width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                    )
                  : SizedBox.shrink(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productNameText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productDetailText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productBarcodeText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productQtyText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productPriceText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productImageText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productCategoryText(),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: productStatusText(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: RaisedButton(
                      onPressed: () {
                        if (formKey.currentState.validate()) {
                          formKey.currentState.save();
                        }
                        
                        Product formProduct = Product(
                            productName: _productNameController.text,
                            productDetail: _productDetailController.text,
                            productBarcode: _productBarcodeController.text,
                            productQty: int.parse(_productQtyController.text),
                            productPrice: _productPriceController.text,
                            productImage: _productImageController.text,
                            productCategory: _productCategoryController.text,
                            productStatus:
                                int.parse(_productStatusController.text),
                          );
                        // create new
                        if (widget.product == null) {                          
                          _createProduct(formProduct);
                        } else {

                            formProduct.id = int.parse(_productIdController.text);
                          // handling update
                          _updateProduct(formProduct);
                        }
                      },
                      child: Text(
                        'Submit!',
                        style: TextStyle(fontSize: 20.0, color: Colors.white),
                      ),
                      color: Colors.teal,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0)),
                    ),
                  ),
                  RaisedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel',
                          style:
                              TextStyle(fontSize: 20.0, color: Colors.white)),
                      color: Colors.orange[900],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28.0)))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _productDetailController.dispose();
    _productBarcodeController.dispose();
    _productQtyController.dispose();
    _productPriceController.dispose();
    _productImageController.dispose();
    _productCategoryController.dispose();
    _productStatusController.dispose();
    _productIdController.dispose();
    super.dispose();
  }

  void _createProduct(formProduct) {
    CallAPI().createProduct(formProduct).then((isSuccess) {
      if (isSuccess) {
        // TODO : More gracefule Back and Refresh
        // redirect back and refresh, still need fxing
        //Navigator.pop(context);
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new StockScreen()),
        );
      } else {
        _scaffoldAddProductState.currentState.showSnackBar(SnackBar(
          backgroundColor: Colors.red[800],
          content: Row(
            children: <Widget>[
              Icon(Icons.error_outline),
              SizedBox(
                width: 15.0,
              ),
              Text("Save fail!, please try again",
                  style: TextStyle(fontSize: 20.0)),
            ],
          ),
        ));
      }
    });
  }

  void _updateProduct(formProduct) {
    print("Update Product API!");
    CallAPI().updateProduct(formProduct).then((isSuccess) {
      if (isSuccess) {

        print("UPDATE OK");
        // TODO : More gracefule Back and Refresh
        // redirect back and refresh, still need fxing
        //Navigator.pop(context);
        Navigator.push(
          context,
          new MaterialPageRoute(builder: (context) => new StockScreen()),
        );
      } else {
        print("UPDATE FAIL");

      }
    });
  }
}
