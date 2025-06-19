import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:insurview360/Api/customer_api.dart';
import 'package:insurview360/Models/customer.dart';

class CustomerInfo extends StatefulWidget {
  const CustomerInfo({super.key});

  @override
  State<CustomerInfo> createState() => _CustomerInfoState();
}

class _CustomerInfoState extends State<CustomerInfo> {
  final conCustomerId = TextEditingController();
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
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              title: Text(
                "Customer Information",
                style: GoogleFonts.lato(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              trailing: FilledButton(
                child: Text("Save"),
                onPressed: () async {
                  Customer customer = Customer(
                    customerId: conCustomerId.text,
                    firstName: conFirstName.text,
                    lastName: conLastName.text,
                    email: conEmail.text,
                    phoneNumber: conPhone.text,
                  );

                  await CustomerApi().updateCustomer(customer);
                },
              ),
            ),
            SizedBox(height: 20),
            Row(
              children: [
                SizedBox(
                  width: 250,
                  child: TextField(
                    controller: conCustomerId,
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
