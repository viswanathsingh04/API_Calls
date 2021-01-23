import 'package:api_check/models/userdata.dart';
import 'package:api_check/providers/UserProviders.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Provider_Call extends StatefulWidget {
  @override
  _Provider_CallState createState() => _Provider_CallState();
}

class _Provider_CallState extends State<Provider_Call> {
  int page = 1;

  @override
  void initState() {
    super.initState();
    final dat = Provider.of<Userproviders>(context, listen: false);
    dat.getapidata(page);
  }

  @override
  Widget build(BuildContext context) {
    final dat = Provider.of<Userproviders>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Title(
              color: Colors.blue,
              child: Text(
                "Provider API Call",
                style: TextStyle(fontSize: 18.0),
              )),
        ),
        body: Container(
          child: dat.loading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.separated(
                  itemCount: dat.userData.data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      color: Colors.black,
                    );
                  },
                  itemBuilder: (BuildContext context, int index) {
                    Datum datum = dat.userData.data[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.blueAccent,
                          backgroundImage: NetworkImage(datum.avatar),
                          radius: 30,
                        ),
                        title: Text(
                          datum.firstName,
                          style: TextStyle(fontSize: 18),
                        ),
                        subtitle: Text(
                          datum.email,
                          style: TextStyle(fontSize: 18),
                        ),
                        trailing: Text(
                          datum.id.toString(),
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    );
                  },
                ),
        ));
  }
}
