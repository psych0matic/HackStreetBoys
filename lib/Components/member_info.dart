import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insurview360/Api/member_api.dart';
import 'package:insurview360/Models/member.dart';

class MemberInfo extends StatefulWidget {
  const MemberInfo({super.key});

  @override
  State<MemberInfo> createState() => _MemberInfoState();
}

class _MemberInfoState extends State<MemberInfo> {
  final conMemberId = TextEditingController();
  final conFirstName = TextEditingController();
  final conLastName = TextEditingController();
  final conEmail = TextEditingController();
  final conPhone = TextEditingController();
  final conEmployer = TextEditingController();
  final conStatus = TextEditingController();
  final conTestId = TextEditingController();
  List<Member> members = [];
  Member? member;

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
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    title: Text(
                      "Member Information",
                      style: GoogleFonts.lato(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                FilledButton(
                  child: Text("Get random"),
                  onPressed: () async {
                    members = await MemberApi().fetchMembers();

                    if (members.isNotEmpty) {
                      setState(() {
                        Member member = (members..shuffle()).first;
                        conMemberId.text = member.memberId;
                        conFirstName.text = member.firstName;
                        conLastName.text = member.lastName;
                        conEmail.text = member.email;
                        conPhone.text = member.phoneNumber;
                        conEmployer.text = member.employer ?? '';
                        conStatus.text = member.employmentStatus ?? '';
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
                  child: Text("Get by Member ID"),
                  onPressed: () async {
                    member = await MemberApi().fetchMember(conTestId.text);

                    if (member != null) {
                      setState(() {
                        Member mem = member!;
                        conMemberId.text = mem.memberId;
                        conFirstName.text = mem.firstName;
                        conLastName.text = mem.lastName;
                        conEmail.text = mem.email;
                        conPhone.text = mem.phoneNumber;
                        conEmployer.text = mem.employer ?? '';
                        conStatus.text = mem.employmentStatus ?? '';
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
                      labelText: 'Member ID',
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
                SizedBox(width: 10),
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conEmployer,
                    decoration: InputDecoration(
                      labelText: 'Employer',
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
                    controller: conStatus,
                    decoration: InputDecoration(
                      labelText: 'Employement Status',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          5.0,
                        ), // Adjust the radius as needed
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
