
import 'package:flutter/material.dart';

BoxDecoration decoration({
  Color color=Colors.greenAccent
})
{
  return BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(20)),
    color: color,
  );
}