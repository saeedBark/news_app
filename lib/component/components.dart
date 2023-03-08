// import 'dart:js';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/modules/news_app/web_view/web_view_screen.dart';
import 'package:news_app/shared/cubit/cubit.dart';

Widget defaultButton({
  Color color = Colors.blue,
  double width = double.infinity,
  double raduis = 0,
  bool isUpperCase = true,
  required Function fanction,
  required String text,
}) {
  return Container(
    height: 40,
    width: width,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(raduis),
      color: color,
    ),
    child: MaterialButton(
      onPressed: () {
        fanction();
      },
      child: Text(
        isUpperCase ? text.toUpperCase() : text,
        style: const TextStyle(color: Colors.white),
      ),
    ),
  );
}

Widget defaultFormFile({
  required TextEditingController controller,
  Function? onsubmit,
  required Function validator,
  required String lable,
  required IconData prefix,
  Function? onTap,
  TextInputType? type,
  IconData? suffix,
  bool enable = true,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: type,
      onFieldSubmitted: (s) {
        onsubmit!(s);
      },
      validator: (s) {
        validator(s);
      },
      enabled: enable,
      decoration: InputDecoration(
        labelText: lable,
        prefixIcon: Icon(prefix),
        suffixIcon: suffix != null ? Icon(suffix) : null,
        border: const OutlineInputBorder(),
      ),
    );



Widget builderArchveItem(article, context) => InkWell(
      onTap: () {
        navigatorTo(
          context,
          WebViewScreen(article['url']),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Container(
              width: 120.0,
              height: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage('${article['urlToImage']}'),
                    fit: BoxFit.cover),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                height: 120,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        '${article['title']}',
                        style: Theme.of(context).textTheme.bodyText1,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '${article['publishedAt']}',
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
Widget MyDiver() => Padding(
      padding: const EdgeInsetsDirectional.only(start: 20.0),
      child: Container(
        width: double.infinity,
        height: 1,
        color: Colors.grey,
      ),
    );

Widget articleBuilder(list, context, {issearch = false}) => ConditionalBuilder(
      condition: list.length > 0,
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            builderArchveItem(list[index], context),
        separatorBuilder: (context, index) => MyDiver(),
        itemCount: 10,
      ),
      fallback: (context) =>
          issearch ? Container() : const Center(child: CircularProgressIndicator()),
    );

void navigatorTo(context, Widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => Widget,
    ));

void navigatorAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Widget,
      ),
      (Route<dynamic> route) => false,
    );
