import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CommentBox extends StatelessWidget {
  Widget child;
  dynamic formKey;
  dynamic sendButtonMethod;
  dynamic commentController;
  ImageProvider userImage;
  String labelText;
  String errorText;
  Widget sendWidget;
  Color backgroundColor;
  Color textColor;
  bool withBorder;
  Widget header;
  FocusNode focusNode;
  CommentBox(
      {this.child,
      this.header,
      this.sendButtonMethod,
      this.formKey,
      this.commentController,
      this.sendWidget,
      this.userImage,
      this.labelText,
      this.focusNode,
      this.errorText,
      this.withBorder = true,
      this.backgroundColor,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(child: child),
          Divider(
            color: Colors.black,
            height: 10,
          ),
          header ?? SizedBox.shrink(),
          ListTile(
            tileColor: Color.fromARGB(255, 247, 243, 243),
            leading: Container(
              height: 40.0,
              width: 40.0,
              decoration: new BoxDecoration(
                  color: Color.fromARGB(255, 44, 120, 195),
                  borderRadius: new BorderRadius.all(Radius.circular(50))),
              child: CircleAvatar(radius: 50, backgroundImage: userImage),
            ),
            title: Form(
              key: formKey,
              child: TextFormField(
                maxLines: 4,
                minLines: 1,
                focusNode: focusNode,
                cursorColor: textColor,
                style: TextStyle(color: textColor),
                controller: commentController,
                decoration: InputDecoration(
                  enabledBorder: !withBorder
                      ? InputBorder.none
                      : UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: Color.fromARGB(255, 12, 11, 11)),
                        ),
                  focusedBorder: !withBorder
                      ? InputBorder.none
                      : UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                        ),
                  border: !withBorder
                      ? InputBorder.none
                      : UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.amber),
                        ),
                  labelText: labelText,
                  focusColor: textColor,
                  fillColor: textColor,
                  labelStyle: TextStyle(color: textColor),
                ),
                validator: (value) => value.isEmpty ? errorText : null,
              ),
            ),
            trailing: GestureDetector(
              onTap: sendButtonMethod,
              child: sendWidget,
            ),
          ),
        ],
      ),
    );
  }

  /// This method is used to parse the image from the URL or the path.
  /// `CommentBox.commentImageParser(imageURLorPath: 'url_or_path_to_image')`
  static ImageProvider commentImageParser({imageURLorPath}) {
    try {
      //check if imageURLorPath
      if (imageURLorPath is String) {
        if (imageURLorPath.startsWith('http')) {
          return NetworkImage(imageURLorPath);
        } else {
          return AssetImage(imageURLorPath);
        }
      } else {
        return imageURLorPath;
      }
    } catch (e) {
      //throw error
      throw Exception('Error parsing image: $e');
    }
  }
}
