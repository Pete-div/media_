import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:meida_app/styles/theme.dart';
import 'package:meida_app/widget/app_text.util.dart';
import 'package:meida_app/widget/phone_number_widget.dart';
import 'package:meida_app/widget/texts.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({super.key});

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
    PageController _controller = PageController(viewportFraction: 0.8);
    int currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    final List<String> topic =['House Balance',"School Balance","Hospital Balance"];
    final List<Color> color = [Color(0xffFFCF87),Color(0xffE09FFF),Color(0xff87F0FF),];
    return  Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            color: AppColors.primaryColor,
            borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(70),bottomRight: Radius.circular(70)
          ),),
          child: SafeArea(
            child: Padding(
              padding:  const EdgeInsets.only(left:20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height:40,),
                  GestureDetector(
                    onTap: (){
                      Navigator.of(context).pop();
                    },
                    child: SvgPicture.asset('assets/images/Left-Arrow 1.svg',color: Colors.white,)),
                  const SizedBox(height:20,),
                  const MonsarratText('You can check your \nbalances here,',color: Colors.white,weight: FontWeight.w700,size: 24,height: 30,)
                ]
              ),
            ),
          ),
        ),
                const SizedBox(height: 50,),

       SizedBox(
        height: 160,
         child: PageView.builder(
                  itemCount: topic.length,
                  
                  controller: _controller,
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: (int index) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                  itemBuilder: (_, index) {{
          
            return 
            Padding(
              padding: const EdgeInsets.only(right:80.0,left: 0),
              child: Card(
                elevation: 5,
                 shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),),
                child: Container(
                 
                  decoration: BoxDecoration(
                    gradient:currentIndex ==index? const  LinearGradient(
            colors: [
                const Color(0xffE100FF),
                 const Color(0xff40D3F2),
               Color(0xff2B47FC),
             
            
            ],
            begin: Alignment.topCenter,
            end:  Alignment.bottomCenter,
          stops: [
               0.2,
                0.6,
                0.2,
                
          ]
            ):null,
          
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white
                  ),
                  padding:const  EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MonsarratText(topic[index],weight: FontWeight.w700,size: 18,color: currentIndex ==index?Colors.white:AppColors.mainTextblack,),
                      const SizedBox(height: 50,),
                                    MonsarratText('${AppCurrencySymbol.naira}${AppTextUtil.formatAmount("45000")}',weight: FontWeight.w700,size: 24,color: currentIndex ==index?Colors.white:AppColors.mainTextblack,),
              
                    ],
                  ),
                ),
              ),
            );}}),
       ),
        const SizedBox(height:50,),
         Padding(
          padding:  EdgeInsets.only(left:20.0),
          child: MonsarratText('Recent Transaction',size:24,weight: FontWeight.w700,color: AppColors.mainTextblack,),
        ),
        const SizedBox(height: 25,),
      SingleChildScrollView(
        child: Column(children: [
          ...List.generate(color.length, (index) => 
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0,vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                 // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                  Container(
                    height: 48,
                    width: 48,
                    decoration:  BoxDecoration(shape: BoxShape.circle,color:color[index]),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SvgPicture.asset('assets/images/deactive.svg',fit: BoxFit.contain,),
                  ),
                  ),
                  const SizedBox(width: 10,),
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     MonsarratText('XYZ Supermarket',weight: FontWeight.w400,size: 18,color: AppColors.mainTextblack,),
                    const SizedBox(height: 5,),
                   const  MonsarratText('15 March 2021, 8:30 pm',color: Color(0xffBFBFBF),weight: FontWeight.w400,size: 12,),
          
                  ],)
                ],),
                Row(children: [
                MonsarratText('-${AppCurrencySymbol.naira}${AppTextUtil.formatAmount("45000")}',weight: FontWeight.w400,size: 14,color: AppColors.mainTextblack,),
          const SizedBox(width: 5,),
          const Icon(Icons.arrow_forward_ios_outlined,color: Color(0xffC7C7C7),size: 16,)
               ],)
              ],
            ),
          ),),
        ],),
      ),
    ]));
  }
}