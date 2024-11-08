import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void customPushReplacement(BuildContext context , String path) {
  GoRouter.of(context).pushReplacement(path);
}
