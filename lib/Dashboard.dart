import 'package:flutter/material.dart';
import 'Database.dart';

class ViewRegisteredData extends StatefulWidget {
  @override
  _ViewRegisteredDataState createState() => _ViewRegisteredDataState();
}

class _ViewRegisteredDataState extends State<ViewRegisteredData> {
  List<Map<String, dynamic>> _registeredData = [];

  @override
  void initState() {
    super.initState();
    _fetchRegisteredData();
  }

  Future<void> _fetchRegisteredData() async {
    List<Map<String, dynamic>> data = await SQLiteDatabase.getAllData();
    setState(() {
      _registeredData = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registered Data'),
      ),
      body: _registeredData.isEmpty
          ? Center(
        child: Text('No data found'),
      )
          : ListView.builder(
        itemCount: _registeredData.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> item = _registeredData[index];
          return ListTile(
            title: Text('${item['firstName']} ${item['lastName']}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${item['email']} - ${item['city']}'),
                Text('${item['gender']}'),
              ],
            )
          );
        },
      ),
    );
  }
}
