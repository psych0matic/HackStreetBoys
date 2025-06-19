import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insurview360/Api/advisor_api.dart';
import 'package:insurview360/Models/advisor.dart';

class AdvisorInfo extends StatefulWidget {
  const AdvisorInfo({super.key});

  @override
  State<AdvisorInfo> createState() => _AdvisorInfoState();
}

class _AdvisorInfoState extends State<AdvisorInfo> {
  final conAgentId = TextEditingController();
  final conFirstName = TextEditingController();
  final conLastName = TextEditingController();
  final conEmail = TextEditingController();
  final conPhone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.purpleAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              title: Text(
                "Advisor Information",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              trailing: FilledButton(
                child: Text("Save"),
                onPressed: () async {
                  Advisor advisor = Advisor(
                    advisorId: conAgentId.text,
                    firstName: conFirstName.text,
                    lastName: conLastName.text,
                    email: conEmail.text,
                    phoneNumber: conPhone.text,
                  );

                  await AdvisorApi().updateAdvisor(advisor);
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conAgentId,
                    decoration: InputDecoration(
                      labelText: 'Agent ID',
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
                    controller: conEmail,
                    decoration: InputDecoration(
                      labelText: 'Email',
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
                    controller: conPhone,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
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
