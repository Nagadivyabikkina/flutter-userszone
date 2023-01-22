// import 'package:flutter/material.dart';
// import 'package:userdatabase/features/core/utils/extensions.dart';
//
// class RadioButtonWidget extends StatefulWidget {
//   const RadioButtonWidget(
//       {required this.title,
//       required this.btnValue,
//       required this.selectedValueCallBack,
//       this.preSelectedValue,
//       Key? key})
//       : super(key: key);
//   final int btnValue;
//   final String title;
//   final dynamic preSelectedValue;
//   final Function(dynamic) selectedValueCallBack;
//   @override
//   State<RadioButtonWidget> createState() => _RadioButtonWidgetState();
// }
//
// class _RadioButtonWidgetState extends State<RadioButtonWidget> {
//   List gender = ["male", "female", "other"];
//   dynamic selectedValue;
//   String? _radioVal;
//   @override
//   void initState() {
//     super.initState();
//     // selectedValue = widget.preSelectedValue;
//     if (selectedValue != null) {
//       _radioVal = gender[selectedValue];
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.start,
//       children: <Widget>[
//         Radio(
//           key: widget.key,
//           activeColor: context.color.secondary1,
//           value: gender[widget.btnValue],
//           groupValue: _radioVal,
//           onChanged: (dynamic value) =>
//               radioButtonChanges(value), //   // setState(() {
//           //   selectedValue = value;
//           //   _radioVal =
//           //       // });
//           //       widget.selectedValueCallBack.call(selectedValue);
//           // },
//         ),
//         Text(widget.title)
//       ],
//     );
//   }
//
//   void radioButtonChanges(String value) {
//     setState(() {
//       _radioVal = value;
//       switch (value) {
//         case 'male':
//           _radioVal = value;
//           widget.selectedValueCallBack.call(_radioVal);
//           break;
//         case 'female':
//           _radioVal = value;
//           widget.selectedValueCallBack.call(selectedValue);
//           break;
//         case 'other':
//           _radioVal = value;
//           widget.selectedValueCallBack.call(_radioVal);
//           break;
//         default:
//           _radioVal = null;
//       }
//       debugPrint(_radioVal); //Debug the choice in console
//     });
//   }
// }
