import 'package:flutter/material.dart';


class PantallaTema1 extends StatelessWidget {
  const PantallaTema1({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      restorationScopeId: 'app',
      title: _title,
      home: MyStatefulWidget(restorationId: 'main'),
    );
  }
}

// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({super.key, this.restorationId});
//
//   final String? restorationId;
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// /// RestorationProperty objects can be used because of RestorationMixin.
// class _MyStatefulWidgetState extends State<MyStatefulWidget>
//     with RestorationMixin {
//   // In this example, the restoration ID for the mixin is passed in through
//   // the [StatefulWidget]'s constructor.
//   @override
//   String? get restorationId => widget.restorationId;
//
//   final RestorableDateTimeN _startDate = RestorableDateTimeN(DateTime(2020));
//   final RestorableDateTimeN _endDate =
//   RestorableDateTimeN(DateTime(2020, 1, 1));
//   late final RestorableRouteFuture<DateTimeRange?>
//   _restorableDateRangePickerRouteFuture =
//   RestorableRouteFuture<DateTimeRange?>(
//     onComplete: _selectDateRange,
//     onPresent: (NavigatorState navigator, Object? arguments) {
//       return navigator
//           .restorablePush(_dateRangePickerRoute, arguments: <String, dynamic>{
//         'initialStartDate': _startDate.value?.millisecondsSinceEpoch,
//         'initialEndDate': _endDate.value?.millisecondsSinceEpoch,
//       });
//     },
//   );
//
//   void _selectDateRange(DateTimeRange? newSelectedDate) {
//     if (newSelectedDate != null) {
//       setState(() {
//         _startDate.value = newSelectedDate.start;
//         _endDate.value = newSelectedDate.end;
//       });
//     }
//   }
//
//   @override
//   void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
//     registerForRestoration(_startDate, 'start_date');
//     registerForRestoration(_endDate, 'end_date');
//     registerForRestoration(
//         _restorableDateRangePickerRouteFuture, 'date_picker_route_future');
//   }
//
//   static Route<DateTimeRange?> _dateRangePickerRoute(
//       BuildContext context,
//       Object? arguments,
//       ) {
//     return DialogRoute<DateTimeRange?>(
//       context: context,
//       builder: (BuildContext context) {
//         return DateRangePickerDialog(
//           restorationId: 'date_picker_dialog',
//           initialDateRange:
//           _initialDateTimeRange(arguments! as Map<dynamic, dynamic>),
//           firstDate: DateTime(2020),
//           currentDate: DateTime(2020, 1, 1),
//           lastDate: DateTime(2022),
//         );
//       },
//     );
//   }
//
//   static DateTimeRange? _initialDateTimeRange(Map<dynamic, dynamic> arguments) {
//     if (arguments['initialStartDate'] != null &&
//         arguments['initialEndDate'] != null) {
//       return DateTimeRange(
//         start: DateTime.fromMillisecondsSinceEpoch(
//             arguments['initialStartDate'] as int),
//         end: DateTime.fromMillisecondsSinceEpoch(
//             arguments['initialEndDate'] as int),
//       );
//     }
//
//     return null;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: OutlinedButton(
//           onPressed: () {
//             _restorableDateRangePickerRouteFuture.present();
//           },
//           child: const Text('Open Date Range Picker'),
//         ),
//       ),
//     );
//   }
// }





class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// RestorationProperty objects can be used because of RestorationMixin.
class _MyStatefulWidgetState extends State<MyStatefulWidget>
    with RestorationMixin {
  // In this example, the restoration ID for the mixin is passed in through
  // the [StatefulWidget]'s constructor.
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
  RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
  RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  static Route<DateTime> _datePickerRoute(
      BuildContext context,
      Object? arguments,
      ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Selected: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            _restorableDatePickerRouteFuture.present();
          },
          child: const Text('Open Date Picker'),
        ),
      ),
    );
  }
}
