import 'package:azyan/collctionReportModel.dart';
import 'package:azyan/details.dart';
import 'package:azyan/httpService.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

class CollectionReport extends StatefulWidget {
  String tocken;
  CollectionReport(this.tocken);
  @override
  _CollectionReportState createState() => _CollectionReportState();
}

class _CollectionReportState extends State<CollectionReport> {
  CollectionReportModel schemData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    schemData = await HttpService.collectionReport(widget.tocken);
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
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Tansaction Report',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: schemData != null?Stack(
        children: [
          schemData.data.length>0?Container(
            height: MediaQuery.of(context).size.height * 10,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg1.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ):Container(
            height: MediaQuery.of(context).size.height * 10,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/no_data.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: schemData.data.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  Details(schemData.data[index].tempId,widget.tocken)),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 20, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Column(
                                children: [

                                  Text(schemData.data[index].schemeNo!=null?schemData.data[index].schemeNo:'No Number',
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                  Text(schemData.data[index].date,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                ],
                              ),
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Text('Ref.Id:'+schemData.data[index].referenceId.toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 15)),
                                  Text(schemData.data[index].amount.toString()+'/-',
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontWeight: FontWeight.bold,

                                          fontSize: 20)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }),
        ],
      ):Container(
        child: SplashScreen(
          seconds: 6,
          loadingText: Text("Loading"),
          photoSize: 100.0,
          loaderColor: Colors.blue,
        ),
      )
    );
  }
}
