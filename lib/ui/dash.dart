// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:parkingapp/model/slot_item.dart';
import 'package:parkingapp/model/slots.dart';
// import 'package:parkingapp/model/slot_item.dart';
// import 'package:parkingapp/ui/dashboardScreen.dart';

const primaryColor = Color(0xff682466);

class DashFinal extends StatefulWidget {
  const DashFinal({super.key});

  @override
  State<DashFinal> createState() => _DashFinalState();
}

class _DashFinalState extends State<DashFinal> {
// thsi si a sample code

  Widget _buildList(QuerySnapshot<Object?>? snapshot) {
    if (snapshot!.docs.isEmpty) {
      return const Center(child: Text("No Tasks Yet!"));
    } else {
      return ListView.builder(
        itemCount: snapshot.docs.length,
        itemBuilder: (context, index) {
          final doc = snapshot.docs[index];
          Slot slot = Slot.fromSnapshot(doc);

          return SlotItem(slot: slot);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            const Positioned(
              left: 30,
              top: 40,
              child: Text(
                "Slot 1",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            const Positioned(
              left: 260,
              top: 40,
              child: Text(
                "Slot 2",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
            Positioned(
              left: 120,
              top: 40,
              child: Container(
                height: 600,
                // margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                color: Colors.white,
                width: 1,
              ),
            ),
            Positioned(
              left: 250,
              top: 40,
              child: Container(
                height: 600,
                // margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 120),
                color: Colors.white,
                width: 1,
              ),
            ),
            Positioned(
              top: 250,
              left: 15,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: primaryColor,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("slot1")
                        .snapshots(),
                    builder: ((context, snapshot) {
                      if (!snapshot.hasData) {
                        return const LinearProgressIndicator();
                      }
                      return Expanded(child: _buildList(snapshot.data));
                    })),
                // child: const Icon(
                //   Icons.car_repair,
                //   size: 100,
                //   color: Colors.yellow,
                // ),
              ),
            ),
            Positioned(
              top: 250,
              left: 260,
              child: Container(
                alignment: Alignment.center,
                width: 100,
                height: 100,
                color: primaryColor,
                child: StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("slot2")
                        .snapshots(),
                    builder: ((context, snapshot) {
                      if (!snapshot.hasData) {
                        return const LinearProgressIndicator();
                      }
                      return Expanded(child: _buildList(snapshot.data));
                    })),
                // child: const Text(
                //   "Slot Free",
                //   style: TextStyle(
                //     color: Colors.yellow,
                //     fontSize: 20,
                //   ),
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
