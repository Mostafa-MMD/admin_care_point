import 'package:flutter/material.dart';
import 'package:graduation/models/model_provider.dart';
import 'package:provider/provider.dart';
import '../../../components/appBar/reusableAppBar.dart';

class AdminInformationScreen extends StatelessWidget {
  static String adminInformationScreenRoute = 'admin information screen';

  const AdminInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<ModelProvider>(context).getUserData();
    return Consumer<ModelProvider>(
      builder: (context, classInstance, child) {
        return Scaffold(
          appBar: ReusableAppBar(
            leadingFunction: () {
              Navigator.pop(context);
            },
            title: 'Admin Information',
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  if (userData != null)
                    Column(
                      children: [
                        AdminWidget(
                          icon: Icons.person,
                          requiredInformation: 'admin name',
                          userInformation: '${userData['name']}',
                        ),
                        AdminWidget(
                          icon: Icons.account_box,
                          requiredInformation: 'admin ID',
                          userInformation: '${userData['user_id']}',
                        ),
                        AdminWidget(
                          icon: Icons.email,
                          requiredInformation: 'Email',
                          userInformation: '${userData['email']}',
                        ),
                        AdminWidget(
                          icon: Icons.phone,
                          requiredInformation: 'Phone number',
                          userInformation: '${userData['phone_number']}',
                        ),
                        AdminWidget(
                          icon: Icons.location_on,
                          requiredInformation: 'Address',
                          userInformation: '${userData['address']}',
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AdminWidget extends StatelessWidget {
  final IconData icon;
  final String requiredInformation;
  final String userInformation;

  const AdminWidget({
    super.key,
    required this.icon,
    required this.requiredInformation,
    required this.userInformation,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 36.0,
            color: Colors.black,
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  requiredInformation,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  userInformation,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
