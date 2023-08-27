
import 'package:flutter/material.dart';
import 'package:nineteen_valley/constants/string_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Footer{
  static footer(BuildContext context,var screenSize){
    return  LayoutBuilder(builder: (context,BoxConstraints constraints){
      if(constraints.maxWidth>500 && constraints.maxWidth<1000){
        return Container(
          padding: const EdgeInsets.all(50.0),
          color: Colors.black.withOpacity(0.9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Row(
              children: [
                Expanded(child: footer1stWidget(context)),
                const SizedBox(width: 15,),
                Expanded(child: footer2ndWidget(context)),
              ],
            ),
            const SizedBox(height: 15,),
            Row(
              children: [
                Expanded(child: footer3rdWidget(context)),
                const SizedBox(width: 15,),
                Expanded(child: footer4thWidget(context)),
              ],
            ),
          ],),
        );
      }
      else if(constraints.maxWidth<500){
        return Container(
          padding: const EdgeInsets.all(20.0),
          color: Colors.black.withOpacity(0.9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            footer1stWidget(context),
            const SizedBox(height: 15,),
            footer2ndWidget(context),
              const SizedBox(height: 15,),
              footer3rdWidget(context),
              const SizedBox(height: 15,),
              footer4thWidget(context)
          ],),
        );
      }
      else {
        return fot( context, screenSize);
      }
    });
  }
 static fot(BuildContext context,var screenSize){
    return Container(
      padding: const EdgeInsets.all(50.0),
      color: Colors.black.withOpacity(0.9),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2,
                  child: footer1stWidget(context)),
              SizedBox(width: screenSize.width / 15),
              Expanded(flex: 1,child: footer2ndWidget(context))
            ],
          )),
          SizedBox(width: screenSize.width / 20),
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 2,
                  child: footer3rdWidget(context)),
              SizedBox(width: screenSize.width / 15),
              Expanded(flex: 1,
                  child: footer4thWidget(context)),
            ],
          )),
        ],
      ),
    );
  }
  static footer1stWidget(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('19 Valley'.toUpperCase(),style: Theme.of(context).textTheme.headlineLarge,),
        const SizedBox(height: 30,),
        Text(AppString.footerMsg,style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Colors.white70
        ),)
      ],
    );
  }
  static footer2ndWidget(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text('Info',style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500),),
        const SizedBox(height: 30,),
        TextButton(onPressed: (){}, style: TextButton.styleFrom(
            foregroundColor: Colors.white70
        ),child: Text('Home',style: TextStyle(),)),
        const SizedBox(height: 15,),
        TextButton(onPressed: (){
          Navigator.pushNamed(context, '/about_us');
        }, style: TextButton.styleFrom(
            foregroundColor: Colors.white70
        ),child: Text('About Us',style: TextStyle(),)),
        const SizedBox(height: 15,),
        TextButton(onPressed: (){}, style: TextButton.styleFrom(
            foregroundColor: Colors.white70
        ),child: Text('Contact Us',style: TextStyle(),)),                        ],
    );
  }
  static footer3rdWidget(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Contact Detail',style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500),),
        const SizedBox(height: 30,),
        InkWell(
          onTap: (){},
          child:  Text('19valley@gmail.com',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              fontSize: 12.sp
          ),),
        ),
        SizedBox(height: 5,),
        Divider(color: Colors.white70,),
        SizedBox(height: 5,),
        Text('Address: PO Box 16122 Collins Street West Victoria 8007 Australia',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white70,
            fontSize: 12.sp
        ),),
        SizedBox(height: 5,),
        Divider(color: Colors.white70,),
        SizedBox(height: 5,),
        Text('+92 300 1234567',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            fontWeight: FontWeight.w400,
            color: Colors.white70,
            fontSize: 12.sp
        ),),
      ],
    );
  }
  static footer4thWidget(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Social',style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w500),),
        const SizedBox(height: 30,),
        InkWell(
          onTap: (){},
          child:  Text('Facebook',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              fontSize: 12.sp
          ),),
        ),
        const SizedBox(height: 5,),
        const Divider(color: Colors.white70,),
        const SizedBox(height: 5,),
        InkWell(
          onTap: (){},
          child:  Text('Twitter',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              fontSize: 12.sp
          ),),
        ),
        const SizedBox(height: 5,),
        const Divider(color: Colors.white70,),
        const SizedBox(height: 5,),
        InkWell(
          onTap: (){},
          child:  Text('Pinterest',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              fontSize: 12.sp
          ),),
        ),
        const SizedBox(height: 5,),
        const Divider(color: Colors.white70,),
        const SizedBox(height: 5,),
        InkWell(
          onTap: (){},
          child:  Text('Instagram',style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w400,
              color: Colors.white70,
              fontSize: 12.sp
          ),),
        ),
      ],
    );
  }
}