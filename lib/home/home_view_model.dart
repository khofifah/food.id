import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import './home.dart';

abstract class HomeViewModel extends State<Home> {
  List listTopBanner = [];
  List listSmallBanner = [];
  bool isLoading = true;
  TextEditingController controller = TextEditingController();

  getBanner() async {
    try {
      var response = await Dio().get(
        'https://food.mockable.io/v1/banner',
      );
      List listBanner = response.data['data'];
      listBanner.forEach((e) {
        if (!mounted) return;
        setState(() {
          if (e['variant']['name'] == 'Top') listTopBanner.add(e);
          if (e['variant']['name'] == 'Small') listSmallBanner.add(e);
          isLoading = false;
        });
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    getBanner();
    super.initState();
  }
}
