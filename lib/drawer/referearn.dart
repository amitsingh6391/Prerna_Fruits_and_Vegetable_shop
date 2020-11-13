import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:e_commerce/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
class refer extends StatefulWidget {
  @override
  _referState createState() => _referState();
}

class _referState extends State<refer> {
  Future<void> share() async {
    await FlutterShare.share (
        title: "Prerna",
        text: "app link",
        linkUrl:'',
        chooserTitle: "Share Prerna"
    );
  }
  bool result =false;
  @override
  void initState() {
    super.initState();
  }
  final txt =" BF737GHLTR32";
  TextEditingController _textEditingController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: x,
        title: Text("Invite Friends"),
      ),
      body: SingleChildScrollView(
        child: Container(margin: EdgeInsets.only(top: 60),
          child: Column(
            children: [
              Card(
                child: Container(alignment: Alignment.center,width: 300,margin: EdgeInsets.only(left: 10,right: 10),
                  height: 50,child: Row(
                    children: [
                      Icon(Icons.account_balance_wallet,color: x,),
                      Container(width: 250,margin: EdgeInsets.only(left: 10),
                          child: Text("Refer a friend & earn Rs.50 + Rs.50 also you can earn more money on every successful order",maxLines: 100,)),
                    ],
                  ),
                ),
              ),
              Container(
                child: Icon(Icons.wallet_giftcard_rounded,color: x,size: 130,),
              ),
              Container(margin: EdgeInsets.only(top: 10,bottom: 10),
                alignment: Alignment.center,
              child: Text("Refer & Earn",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),),
              Container(
                alignment: Alignment.center,
                child: Text("Your referal code",style: TextStyle(color: Colors.grey,fontSize: 17),),),
              Container(height: 30,width: 130,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: x,width: 1),
                  borderRadius: BorderRadius.circular(30)
                ),
                margin: EdgeInsets.all(8),
                child: Text(txt),
              ),
              Container(alignment: Alignment.center,
                child: Builder(
                  builder: (context) {
                    return Center(
                      child: Column(
                        children: <Widget>[
                          FlatButton(
                            child: Text('Tap to Copy',style: TextStyle(color: x),),
                            onPressed: () {
                              ClipboardManager.copyToClipBoard(txt).then((result) {
                                final snackBar = SnackBar(
                                  content: Text('Copied to Clipboard'),
                                  action: SnackBarAction(
                                    label: 'Undo',
                                    onPressed: () {},
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                              });
                            },
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(margin: EdgeInsets.only(top: 20),
                child: ButtonTheme(
                    minWidth: 200.0,
                    height: 40.0,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: x)
                      ),
                      child: Container(width: 150,
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [Icon(Icons.share),
                            Text('REFER NOW',
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ],
                        ),
                      ),
                      color: x,
                      onPressed: () {
                        share();
                      },
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
