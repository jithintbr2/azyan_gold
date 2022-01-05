import 'package:azyan/listSchemes.dart';
import 'package:flutter/material.dart';
import 'package:azyan/common.dart';
import 'package:azyan/httpService.dart';
import 'package:azyan/paymentPageModel.dart';
import 'package:azyan/paymentWebPage.dart';
import 'package:azyan/tempData.dart';
import 'package:splashscreen/splashscreen.dart';

class PaymentPage extends StatefulWidget {
  int customerMasterId;
  String tocken;
  int tempId = 50000;

  PaymentPage(this.tocken, this.customerMasterId);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  PaymnetDetails schemData;
  bool val = false;
  List<checkBoxClass> listItems;
  List<checkBoxClass> checkedItems = new List();

  int totalPrice = 0;
  List<checkBoxClass> ids;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    listItems = new List();
  }

  getData() async {
    schemData = await HttpService.paymentDetails(
        widget.tocken, widget.customerMasterId);

    if (schemData != null) {
      schemData.data.forEach((element) {
        listItems.add(checkBoxClass(
            element.installmentAmount,
            'Installment ' + element.installmentNumber.toString(),
            element.customerSchemeDetailsId));
      });
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {  Navigator.of(context).pop();
      },
        //   Navigator.push(
        // context,
        // MaterialPageRoute(
        //     builder: (context) =>ListSchemes(widget.tocken)),


      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.yellow[800],
            title: Text(
              'Payment',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: schemData != null
              ? Container(
                  height: MediaQuery.of(context).size.height, child: content())
              : Container(
                  child: SplashScreen(
                    seconds: 6,
                    loadingText: Text("Loading"),
                    photoSize: 100.0,
                    loaderColor: Colors.blue,
                  ),
                )),
    );
  }

  content() {
    return schemData.data.length > 0
        ? Stack(
            children: [
              mainItems(),
              Align(
                child: bottom(),
                alignment: Alignment.bottomCenter,
              )
            ],
          )
        : Container(
            height: MediaQuery.of(context).size.height * 10,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/no_data.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          );
  }

  mainItems() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return chekBox(
            listItems[index],
            index == 0 ? null : listItems[index - 1],
            index == listItems.length - 1 ? null : listItems[index+1]);
      },
      itemCount: listItems.length,
    );
  }

  bottom() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width * 7,
        color: Colors.white,
        child: Row(
          children: [
            Container(
              height: 50,
              color: Colors.blue,
              width: MediaQuery.of(context).size.height * .25,
              child: Center(
                child: Text(
                  'Total: ' + totalPrice.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: MediaQuery.of(context).size.height * .2,
              color: Colors.green,
              child: Center(
                child: FlatButton(
                  onPressed: () async {
                    if (totalPrice > 0) {
                      Map<String, dynamic> body = {

                        "token": widget.tocken,
                        "customerSchemeDetailsId":
                            checkedItems.map((e) => e.ids).toList(),
                        "totalAmount": totalPrice.toString()
                      };

                      TempData object = await HttpService.tempDataStore(body);

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  PaymentWebPage(object.data,widget.tocken)));
                    } else {
                      Common.toastMessaage(
                          'Choose atleast One Installment', Colors.red);
                    }
                  },
                  child: Text(
                    'Pay',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  chekBox(checkBoxClass obj, checkBoxClass previousObject,
      checkBoxClass nextObject) {
    return Card(
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Expanded(child:
          CheckboxListTile(
            title:Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
        obj.title,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
      ),
      Text(
        obj.price.toString() + '/-',
        style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold,
            fontSize: 20),
      ),
              ],
            ),value: checkedItems.contains(obj) ? true : false,
            onChanged: (bool value) {
              if (value) {
                if (previousObject != null) {
                  if (checkedItems.contains(previousObject)) {
                    setState(() {
                      totalPrice = 0;
                      checkedItems.add(obj);
                      checkedItems.forEach((element){
                        totalPrice = totalPrice + element.price;
                      });
                    });

                  }
                  else
                  {
                    Common.toastMessaage(
                        'Please Select in Order', Colors.red);


                  }
                } else {
                  setState(() {
                    totalPrice = 0;
                    checkedItems.add(obj);
                    checkedItems.forEach((element){
                      totalPrice = totalPrice + element.price;
                    });
                  });

                }
              } else {

                if (nextObject != null) {

                  if (!checkedItems.contains(nextObject)) {

                    setState(() {
                      totalPrice = 0;
                      checkedItems.remove(obj);
                      checkedItems.forEach((element){
                        totalPrice = totalPrice + element.price;
                      });
                    });
                  }
                  else
                  {
                    Common.toastMessaage(
                        'Please Remove Last Selected One', Colors.red);
                  }


                } else {
                  print('c');
                  setState(() {
                    totalPrice = 0;
                    checkedItems.remove(obj);
                    checkedItems.forEach((element){
                      totalPrice = totalPrice + element.price;
                    });
                  });
                }
              }
            },
            controlAffinity: ListTileControlAffinity.leading,
          ),
          )

        ],
      ),




    );
  }
}

class checkBoxClass {
  checkBoxClass(this.price, this.title, this.ids, {this.chheckval: false});

  int ids;
  bool chheckval;
  String title;
  var price;

  getChlk() {
    return chheckval;
  }

  gettitle() {
    return title;
  }

  getPrice() {
    return price;
  }

  updateChk(val) {
    chheckval = val;
  }
}
