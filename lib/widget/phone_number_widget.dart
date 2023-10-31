// ignore: unused_import
// ignore_for_file: use_key_in_widget_constructors, annotate_overrides, empty_catches, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meida_app/styles/theme.dart';
import 'package:meida_app/views/balance_view.dart';
import 'package:meida_app/widget/app_text.util.dart';
import 'package:meida_app/widget/texts.dart';


class PhoneNumberWidget extends StatefulWidget {
  const  PhoneNumberWidget(
      {Key? key, this.onChanged, this.title, this.subtitle});
 final void Function(String)? onChanged;
  final String? title, subtitle;



  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  @override
 final List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, -1, 0, -1];

String pin = '';
   Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        children: [
          MonsarratText(
            widget.title ?? "ENTER AMOUNT",height: 0.833
          ),
          const SizedBox(height: 20,),
          RichText(
    //$
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '',
             
              children: [
                TextSpan(
                  text:AppCurrencySymbol.naira,
                  style: GoogleFonts.montserrat(
                    fontSize: 38,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700
                  ),
                ),
                  TextSpan(
                  text:"${AppTextUtil.formatAmount(pin == "" ? '0' : pin)}",
                  style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    height: 51.1 / 40,
                    fontWeight: FontWeight.w800,
                    fontSize: 40,
                    color: pin != ""
                        ? const Color(0xffB6BFFF)
                        : const Color(0xffB6BFFF),
                  ),
                ),
    //.0
                if (pin == '')
                  TextSpan(
                    text: '',
                    style: TextStyle(
                      height: 51 / 40,
                      fontWeight: FontWeight.w800,
                      fontSize: 40,
                      color: pin != ''
                          ? const Color(0xffB6BFFF)
                          : const Color(0xFFD1D2D2),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 8,),
          if (widget.subtitle != null)
            Text(
              widget.subtitle!,
              style: const TextStyle(
                  fontSize: 12, color: Color(0xFF1B1C1E)),
            ),
          const SizedBox(height: 15,),
                    const  Padding(
                       padding:  EdgeInsets.symmetric(horizontal:100.0),
                       child:  Divider(),
                     ),
          const SizedBox(height: 15,),
         const  MonsarratText('To',weight: FontWeight.w400,height: 0.857,),
          const SizedBox(height: 20,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          Image.asset("assets/images/profileImage.png"),
    const SizedBox(width: 20,),
             MonsarratText('Jane Doe',weight: FontWeight.w400,height:0.8,color: AppColors.mainTextblack,)
    
          ],),
    const SizedBox(height: 50,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal:40.0),
             child: SizedBox(
              height: 400,
              width: double.maxFinite,
              child: GridView.builder(
                padding: const EdgeInsets.symmetric(
                  horizontal: 5,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.25,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 8,
                ),
                itemCount: numbers.length,
                itemBuilder: (BuildContext context, int index) {
                  int number = numbers[index];
           
                  if (index == 9) {
                    return InkWell(
                             splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
                      onTap: () {
                        displayInput('.');
                      },
                      child:  Card(
                          shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),),
                        elevation: 0,
                        color:const  Color(0xffF5F6FA),
                        child: Center(
                          child:  Text(
                            ".",
                            style:GoogleFonts.montserrat(
                    fontSize: 38,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700
                  ),
                          ),
                        ),
                      ),
                    );
                  }
                  return InkWell(
               
                      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
                    enableFeedback: false,
                    borderRadius: BorderRadius.circular(10),
                    onTap: () {
                      if (index == 11) {
                        try {
                          deleteCallback();
                        } catch (e) {
                        }
                      } else {
                        displayInput(number);
                      }
                    },
                    child: Card(
                        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),),
                      elevation: 0,
                                            color: index == 11 ?AppColors.primaryColor:Color(0xffF5F6FA),
                    
                      child: index == 11
                          ?  Icon(Icons.arrow_forward,
                              size: 24, color: Colors.white)
                          : Center(
                            child: Text(
                                number.toString(),
                                style: GoogleFonts.montserrat(
                    fontSize: 25,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w700
                                  ),
                              ),
                          ),
                      // alignment: Alignment.center,
                      // decoration:
                      //     BoxDecoration(borderRadius: BorderRadius.circular(10)),
                    ),
                  );
                },
              ),
                   ),
           ),
        ],
      ),
    );
  }





  void deleteCallback() {
    // setState(() {
    // pin = pin.replaceRange(pin.length - 1, pin.length, '');
    // });
    // widget.onChanged != null ? widget.onChanged!(pin) : null;
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const BalanceScreen()));
  }

  void displayInput(number) {
    setState(() {
      pin = '$pin$number';
    });
    widget.onChanged != null ? widget.onChanged!(pin) : null;
  }
}




 abstract class AppCurrencySymbol {
  static const String naira = '\u20A6';
}
