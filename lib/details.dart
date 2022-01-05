import 'package:azyan/collectionReport.dart';
import 'package:azyan/dashboard.dart';
import 'package:azyan/httpService.dart';
import 'package:azyan/invoicModel.dart';
import 'package:azyan/listSchemes.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class Details extends StatefulWidget {
  int tempId;
  String tocken;



  Details(this.tempId, this.tocken);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  InvoiceModel schemData;
  var count=1;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    schemData = await HttpService.invoice(widget.tempId);
    if (schemData != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow[800],
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>CollectionReport(widget.tocken)),
            ),
          ),
          title: Text(
            'Details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: schemData != null
            ? Padding(
                padding: const EdgeInsets.all(5),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 120.0,
                                  height: 40.0,
                                  decoration: new BoxDecoration(

                                      image: new DecorationImage(
                                          fit: BoxFit.fill,
                                          image: new AssetImage('assets/images/logo.png')
                                      )
                                  )),
                              SizedBox(height: 10,),
                              Text(schemData.data.schemeName,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                              Text(schemData.data.schemeNo,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15)),
                            ],
                          )),
                        ),
                        Divider(color: Colors.black),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(schemData.data.customerName,style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                        Text(schemData.data.address,style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                       Text(schemData.data.mobileNumber.toString(),style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14)),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Text(schemData.data.invoiceNumber,style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18)),
                                        Text(schemData.data.datePaid,style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Divider(color: Colors.black),
                        Container(
                          color: Colors.grey[300],
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Sl No',style:TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                                Text('Installment',style:TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                                Text('Amount',style:TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15)),
                              ],
                            ),
                          ),
                        ),

                        ListView.builder(
                            shrinkWrap: true,
                            itemCount: schemData.data.installmentDetails.length,
                            itemBuilder: (context, index) {
                              if (index==0) {
                                count = count;
                              }
                              else
                                {
                                  count = count+1;
                                }
                             return Container(

                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('$count',style:TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                      Text('Installment '+schemData.data.installmentDetails[index].installmentNumber.toString(),style:TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                      Text(schemData.data.installmentDetails[index].installmentAmount.toString()+'/-',style:TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15)),
                                    ],
                                  ),
                                ),
                              );
                            }),
                        Divider(color: Colors.black),
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 10, top: 10, bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total',style:TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                                Text(''),
                                Text(schemData.data.amount.toString()+'/-',style:TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18)),
                              ],
                            ),
                          ),
                        ),
                        Divider(color: Colors.black),
                      ],
                    ),
                  ),
                ),
              )
            : Container(
                child: SplashScreen(
                  seconds: 6,
                  loadingText: Text("Loading"),
                  photoSize: 100.0,
                  loaderColor: Colors.blue,
                ),
              ));
  }
}
