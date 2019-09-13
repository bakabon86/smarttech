import 'package:flutter/material.dart';

import 'package:semart_tech/models/pomMasterDataModel.dart';

import 'package:semart_tech/services/repository.dart';

class BillingList extends StatefulWidget {
  BillingList({Key key}) : super(key: key);

  _BillingListState createState() => _BillingListState();
}

class _BillingListState extends State<BillingList> {
List<DataPom> lsBilling = [];

  @override
  void initState() {
    getInvoice();
    super.initState();
  }

  void getInvoice() async {
    //lsBilling = (await Repository().getInstance());
    lsBilling = (await Repository().getPOMList());
    //lsBilling = await Repository().getList(5, 'AL01-001', 'paid', 1, 'pemilik');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
   

    Widget makeBody(DataPom billing) => Container(
          height: 120,
          padding: EdgeInsets.all(10),
          child: Card(
              elevation: 2,
              shape: Border.all(width: 1),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Text(billing.name),
                    ],
                  ))),
        );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
            title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('Billing'),
            IconButton(
              icon: Icon(
                Icons.refresh,
              ),
              onPressed: () => getInvoice(),
            )
          ],
        )),
        body: Container(
          child: ListView.builder(
            itemCount: lsBilling.length,
            itemBuilder: (BuildContext context, int index) {
              return makeBody(lsBilling[index]);
            },
          ),
        ),
      ),
    );
  }
}
