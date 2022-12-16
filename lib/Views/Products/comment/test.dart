import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pasell/Views/Products/comment/comment.dart';

class TestMe extends StatefulWidget {
  @override
  _TestMeState createState() => _TestMeState();
}

class _TestMeState extends State<TestMe> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController commentController = TextEditingController();
  List filedata = [
    {
      'name': 'david',
      'pic':
          'https://images.unsplash.com/photo-1504593811423-6dd665756598?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fHBlcnNvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60',
      'message': 'condition',
      'date': '2023-01-05 11:00:00'
    },
    {
      'name': 'parash aryal',
      'pic':
          'https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'message': 'Very cool',
      'date': '2023-01-10 12:10:00'
    },
    {
      'name': 'Dipisha thapa',
      'pic':
          'https://images.unsplash.com/photo-1554151228-14d9def656e4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'message': 'nice product',
      'date': '2023-01-01 1:10:00'
    },
    {
      'name': 'rohit sha',
      'pic':
          'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60',
      'message': 'Very cool',
      'date': '2022-12-05 12:10:00'
    },
  ];

  Widget commentChild(data) {
    // backgroundColor = Color();
    return ListView(
      children: [
        for (var i = 0; i < data.length; i++)
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 8.0, 2.0, 0.0),
            child: ListTile(
              leading: GestureDetector(
                onTap: () async {
                  // Display the image in large form.
                  print("Comment Clicked");
                },
                child: Container(
                  height: 50.0,
                  width: 50.0,
                  decoration: new BoxDecoration(
                      color: Color.fromARGB(255, 244, 246, 247),
                      borderRadius: new BorderRadius.all(Radius.circular(50))),
                  // child: Icon(Icons.person, size: 45, color: Colors.black45),
                  child: CircleAvatar(
                    radius: 50,

                    backgroundColor: Colors.amber,
                    backgroundImage: CommentBox.commentImageParser(
                        imageURLorPath: data[i]["pic"]),
                    // backgroundImage: NetworkImage(
                    //     'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),

                    // backgroundImage: CommentBox.commentImageParser(
                    //     imageURLorPath: data[i]['pic'])),
                  ),
                ),
              ),
              title: Text(
                data[i]['name'],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(data[i]['message']),
              trailing: Text(data[i]['date'], style: TextStyle(fontSize: 10)),
            ),
          )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // Future<bool> addComment() async {
    //   Map<String, dynamic> blogdata = {'commentText': commentController.text};
    //   try {
    //     final response = await http.post(Uri.parse(baseurl + 'comment'),
    //         body: blogdata, headers: {'Authorization': 'Bearer $token'});
    //     var data = jsonDecode(response.body) as Map;
    //     print(data);
    //     return data['success'];
    //   } catch (e) {
    //     print(e);
    //   }
    //   return false;
    // }

    return Scaffold(
      body: Container(
        child: CommentBox(
            userImage: NetworkImage(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif'),

            // userImage: CommentBox.commentImageParser(
            // imageURLorPath: "Assets/images/aa.png"),
            child: commentChild(filedata),
            labelText: 'Write a comment...',
            errorText: 'Comment cannot be blank',
            withBorder: false,
            sendButtonMethod: () {
              if (formKey.currentState.validate()) {
                print(commentController.text);
                setState(() {
                  var value = {
                    'name': 'New User',
                    'pic':
                        'https://lh3.googleusercontent.com/a-/AOh14GjRHcaendrf6gU5fPIVd8GIl1OgblrMMvGUoCBj4g=s400',
                    'message': commentController.text,
                    'date': '2021-01-01 12:00:00'
                  };
                  filedata.insert(0, value);
                });
                commentController.clear();
                FocusScope.of(context).unfocus();
              } else {
                print("Not validated");
              }
            },
            formKey: formKey,
            commentController: commentController,
            // backgroundColor: Color.fromARGB(255, 10, 9, 9),
            textColor: Colors.black,
            sendWidget: Icon(Icons.send_sharp, size: 30, color: Colors.black)),
      ),
    );
  }
}
