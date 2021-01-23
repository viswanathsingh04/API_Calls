import 'package:api_check/models/userdata.dart';
import 'package:api_check/services/apiservices.dart';
import 'package:flutter/material.dart';

class general_call extends StatefulWidget {
  @override
  _general_callState createState() => _general_callState();
}

class _general_callState extends State<general_call> {
  ApiServices _apiServices;
  Future getapidata;
  int page = 1;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _apiServices = new ApiServices();
    print(page.toString());
    getapidata = _apiServices.getuserdata(page);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page = ++page;
        print(page.toString());
        getapidata = _apiServices.getuserdata(page);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Title(
            color: Colors.blue,
            child: Text(
              "General API Call",
              style: TextStyle(fontSize: 18.0),
            )),
      ),
      body: Container(
        child: FutureBuilder<UserData>(
          future: getapidata,
          builder: (BuildContext context, AsyncSnapshot<UserData> snapshot) {
            if (snapshot.hasData) {
              List<Datum> udata = snapshot.data.data;
              return ListView.separated(
                controller: _scrollController,
                itemCount: udata.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        backgroundImage: NetworkImage(udata[index].avatar),
                        radius: 30,
                      ),
                      title: Text(
                        udata[index].firstName,
                        style: TextStyle(fontSize: 18),
                      ),
                      subtitle: Text(
                        udata[index].email,
                        style: TextStyle(fontSize: 18),
                      ),
                      trailing: Text(
                        udata[index].id.toString(),
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(
                  height: 4.0,
                  color: Colors.black,
                ),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error,
                  style: TextStyle(fontSize: 22),
                ),
              );
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
