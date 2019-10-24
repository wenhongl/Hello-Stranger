import 'package:flutter/material.dart';
import 'package:xiaohou/home_page.dart';
import 'package:xiaohou/main.dart';
import 'custome_router.dart';

class HomeScreen extends StatefulWidget {
  @override
  State createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  TextEditingController _nameController;
  TextEditingController _pwController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _pwController = TextEditingController();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 80.0),
            Center(
              child: Text('Hello Stranger',
                style: TextStyle(
                  fontSize: 32.0,
                  color: Color(0xFFFF7043),
                ),
              ),
            ),
            const SizedBox(height: 80.0,),
            _buildTextField(_nameController, false,"name"),
            _buildTextField(_pwController, true,"password"),
            const SizedBox(height: 40.0),
            ButtonBar(
              children: <Widget>[
                RaisedButton(
                  onPressed: ()  => 
                    Navigator.of(context).push(CustomRoute(RandomWords())
                  ),
                  child: Text('login'),
                  color: Colors.white,
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, bool obscureText,String labelText) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        borderRadius: BorderRadius.circular(10.0),
        child: TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
//              filled: true,
              labelText: labelText,
//              fillColor: Colors.white
          ),
        ),
      ),
    );
  }
}
