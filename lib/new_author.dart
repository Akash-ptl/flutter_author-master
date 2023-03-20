import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_author/home_page.dart';

class NewAuthor extends StatefulWidget {
  const NewAuthor({super.key});

  @override
  State<NewAuthor> createState() => _NewAuthorState();
}

class _NewAuthorState extends State<NewAuthor> {
  TextEditingController authorcontroller = TextEditingController();
  TextEditingController bookcontroller = TextEditingController();
  TextEditingController imagecontroller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Author'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: const Color(0xff282828),
      ),
      body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: authorcontroller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.white, width: 0.0),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.red, width: 0.0),
                      ),
                      hintText: 'Author Name',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: bookcontroller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.white, width: 0.0),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.red, width: 0.0),
                      ),
                      hintText: 'Book Name',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: imagecontroller,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.white, width: 0.0),
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                        borderSide: BorderSide(color: Colors.red, width: 0.0),
                      ),
                      hintText: 'Book Image URL',
                      hintStyle: TextStyle(
                          color: Colors.grey.shade500,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    FirebaseFirestore.instance.collection('Author').add({
                      'author': authorcontroller.text,
                      'book': bookcontroller.text,
                      'image': imagecontroller.text,
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MyHomePage(),
                        ));
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: h / 22,
                    width: w,
                    decoration: BoxDecoration(
                        color: const Color(0xff302F2F),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(15)),
                    child: const Text(
                      'Add',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          )),
      backgroundColor: const Color(0xff282828),
    );
  }
}
