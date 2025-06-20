import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insurview360/Api/dependent_api.dart';
import 'package:insurview360/Api/member_api.dart';
import 'package:insurview360/Models/member.dart';
import 'package:insurview360/Models/dependent.dart';

class DependentInfo extends StatefulWidget {
  const DependentInfo({super.key});

  @override
  State<DependentInfo> createState() => _DependentInfoState();
}

class _DependentInfoState extends State<DependentInfo> {
  final conDependentId = TextEditingController();
  final conMemberId = TextEditingController();
  final conFirstName = TextEditingController();
  final conLastName = TextEditingController();
  final conRelation = TextEditingController();
  final conTestId = TextEditingController();

  Dependent? dependent;

  List<Dependent> dependents = [];

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: ListTile(
                    leading: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.yellowAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    title: Text(
                      "Dependent Information",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),

                FilledButton(
                  child: Text("Get one"),
                  onPressed: () async {
                    dependents = await DependentApi().fetchDependents();

                    if (dependents.isNotEmpty) {
                      setState(() {
                        Dependent dependent = (dependents..shuffle()).first;
                        conMemberId.text = dependent.memberId;
                        conFirstName.text = dependent.firstName;
                        conLastName.text = dependent.lastName;
                        conRelation.text = dependent.relation;
                        conDependentId.text = dependent.dependentId;
                      });
                    }
                  },
                ),

                SizedBox(width: 10),
                SizedBox(
                  width: 80,
                  child: TextField(
                    controller: conTestId,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                      labelText: 'ID',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                // Get by ID Button
                FilledButton(
                  child: Text("Get by Dependent ID"),
                  onPressed: () async {
                    dependent = await DependentApi().fetchDependent(
                      conTestId.text,
                    );

                    if (dependent != null) {
                      setState(() {
                        Dependent d = dependent!;
                        conMemberId.text = d.memberId;
                        conFirstName.text = d.firstName;
                        conLastName.text = d.lastName;
                        conRelation.text = d.relation;
                        conDependentId.text = d.dependentId;
                      });
                    }
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conMemberId,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                      labelText: 'Customer ID',
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conFirstName,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conLastName,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conDependentId,
                    decoration: InputDecoration(
                      labelText: 'Dependent ID',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conRelation,
                    decoration: InputDecoration(
                      labelText: 'Relation',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
