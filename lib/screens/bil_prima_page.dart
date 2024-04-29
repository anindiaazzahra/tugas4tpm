import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas4tpm/constant/colors.dart';
import 'package:tugas4tpm/provider/bil_prima_provider.dart';
import 'package:tugas4tpm/screens/widgets_data.dart';
import 'package:tugas4tpm/widgets/bil_prima_button.dart';
import 'package:tugas4tpm/widgets/textfield.dart';

import 'login_page.dart';

class BilPrimaPage extends StatelessWidget {
  const BilPrimaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.sizeOf(context).height;
    const padding = EdgeInsets.symmetric(horizontal: 25, vertical: 35);
    const decoration = BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30))
    );
    return Consumer<BilPrimaProvider>(
        builder: (context,provider,_) {
          return Scaffold(
            backgroundColor: Colors.black,
            appBar: AppBar(
              title: Text("Bilangan Prima"),
              backgroundColor: Colors.black,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(
                  Icons.logout,
                  ),
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                      );
                    }
                ),
              ],
            ),
            body: Column(
              children: [
                CustomTextField(
                  controller: provider.computationController,
                ),
                const Spacer(),
                Container(
                  height: screenHeight  * 0.6,
                  width: double.infinity,
                  padding: padding,
                  decoration: decoration,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Row(
                        children: [
                          BilPrimaButton(),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(3, (index) => buttonList[index + 1]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(3, (index) => buttonList[index + 4]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(3, (index) => buttonList[index + 7]),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: List.generate(3, (index) => buttonList[index + 10]),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}