import 'package:flutter/material.dart';
import 'package:step_tracker_app/app/toast/app_toast.dart';
import 'package:step_tracker_app/main.dart';

mixin MainMixin on State<MyApp> {
  @override
  void initState() {
    super.initState();
    AppToast.init(context);
  }
}
