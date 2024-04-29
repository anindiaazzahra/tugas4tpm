import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tugas4tpm/constant/colors.dart';
import 'package:tugas4tpm/provider/bil_prima_provider.dart';

class BilPrimaButton extends StatelessWidget {
  const BilPrimaButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => Provider.of<BilPrimaProvider>(context, listen: false).setValue("check"),
        child: Container(
          height: 64,
          width: 340,
          decoration: BoxDecoration(
              color: AppColors.secondaryColor,
              borderRadius: BorderRadius.circular(40)
          ),
          child: const Center(
              child: Text(
                "CHECK",
                style: TextStyle(
                  fontSize: 32,
                ),
              )
          ),
        ),
      ),
    );
  }
}
