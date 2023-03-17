import 'package:flutter/material.dart';

 routeScreen({
  required BuildContext context,
  required Widget screen
})
{
  return Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => screen));
}

backScreen({
  required BuildContext context
})
{
  return Navigator.pop(context);
}

Future pushAndRemove(BuildContext context,Widget screen)async
{
  return await Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context)=>screen,
      ),
          (route) => false);
}