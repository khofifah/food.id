import 'package:flutter/material.dart';

Widget circleLoading() {
  return Center(
    child: CircularProgressIndicator(
      strokeWidth: 100,
      valueColor: const AlwaysStoppedAnimation<Color>(
        Colors.green,
      ),
    ),
  );
}

Widget customText(
  String text, {
  Color color,
  bool isBold = false,
  double fontSize,
  TextAlign align,
}) {
  return Text(
    text,
    style: TextStyle(
      color: color ?? Colors.black,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontSize: fontSize ?? 14,
    ),
    textAlign: align ?? TextAlign.start,
  );
}

Widget topCard(TextEditingController controller) {
  return Container(
    padding: EdgeInsets.all(20),
    color: Colors.green,
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  Icons.tag_faces_rounded,
                  color: Colors.white,
                ),
                SizedBox(width: 10),
                customText(
                  'FOOD.ID',
                  color: Colors.white,
                  isBold: true,
                  fontSize: 24,
                ),
              ],
            ),
            Icon(
              Icons.chat_outlined,
              color: Colors.white,
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              color: Colors.white,
            ),
            SizedBox(width: 10),
            customText(
              'Dikirim ke',
              color: Colors.white,
              fontSize: 16,
            ),
          ],
        ),
        SizedBox(height: 30),
        customField(controller),
        SizedBox(height: 20),
      ],
    ),
  );
}

Widget customField(TextEditingController controller) {
  return TextField(
    controller: controller,
    decoration: InputDecoration(
      hintText: 'Mau belanja makanan apa?',
      prefixIcon: Icon(
        Icons.search,
        color: Colors.grey,
      ),
      fillColor: Colors.white,
      filled: true,
      isDense: false,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide.none,
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide.none,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide.none,
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        borderSide: BorderSide.none,
      ),
    ),
  );
}

Widget topBanner(Size size, List listTopBanner) {
  return SizedBox(
    width: size.width,
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: listTopBanner.map((e) {
          return Padding(
            padding: EdgeInsets.all(20),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              child: Image.network(
                e['media'],
                width: size.width - 40,
                fit: BoxFit.fitWidth,
              ),
            ),
          );
        }).toList(),
      ),
    ),
  );
}

Widget smallBanner(List listSmallBanner) {
  return GridView.count(
    crossAxisCount: 2,
    mainAxisSpacing: 20,
    crossAxisSpacing: 20,
    childAspectRatio: 3 / 1.5,
    shrinkWrap: true,
    children: listSmallBanner.map((e) {
      return Padding(
        padding: EdgeInsets.all(0),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          child: Image.network(
            e['media'],
            fit: BoxFit.cover,
          ),
        ),
      );
    }).toList(),
  );
}
