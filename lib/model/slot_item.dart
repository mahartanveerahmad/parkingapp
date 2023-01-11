import 'package:flutter/material.dart';
import 'package:parkingapp/model/slots.dart';

class SlotItem extends StatelessWidget {
  final Slot slot;
  const SlotItem({super.key, required this.slot});

  @override
  Widget build(BuildContext context) {
    final checkfortext = slot.status == false ? "Free" : null;
    final checkforcolor = slot.status == false ? Colors.green : Colors.red;
    final slotname = slot.name;

    Widget checkforwidget = slot.status == false
        ? const Center(
            child: Text(
              "Slot Free",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 20,
              ),
            ),
          )
        : const Icon(
            Icons.car_repair,
            size: 100,
            color: Colors.red,
          );

    return checkforwidget;

/*

Thisis a sample for container return start



 
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        alignment: Alignment.center,
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          color: checkforcolor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          '$slotname$checkfortext',
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );



Thisis a sample for container return end 



 */

    // return ListTile(
    //   title: Text(slot.name),
    //   tileColor: slot.status == false ? Colors.red : Colors.green,
    //   leading: Text(slot.status == false ? "Booked" : "Free"),
    // );
  }
}
