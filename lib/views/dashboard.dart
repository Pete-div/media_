import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meida_app/styles/theme.dart';
import 'package:meida_app/widget/phone_number_widget.dart';
import 'package:meida_app/widget/texts.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(children: [
           Container(
            width: double.infinity,
            height:150,
            decoration: BoxDecoration(
              boxShadow: const [
      BoxShadow(
        color: Color(0xff87F0FF),
        blurRadius: 4,
        offset: Offset(4, 8), // Shadow position
      ),
    ], 
              color: AppColors.primaryColor,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(70),bottomRight: Radius.circular(70)
            ),),
            child: SafeArea(
              child: Padding(
                padding:  const EdgeInsets.only(left:20.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 
                    GestureDetector(
                      onTap: (){
                    
                      },
                      child:SvgPicture.asset('assets/images/Left-Arrow 1.svg',color: Colors.white,)),
                    
                    const MonsarratText('Transfer',color: Colors.white,weight: FontWeight.w700,size:17,height: 22,)
                  ,Container(),
                  ]
                ),
              ),
            ),
          ),
         const SizedBox(height:70,),

 PhoneNumberWidget()
      ],),
    );
  }
}