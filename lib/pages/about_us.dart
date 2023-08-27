
import 'package:flutter/material.dart';
import 'package:nineteen_valley/constants/string_data.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';
import '../constants/footer.dart';
import '../constants/header.dart';
import '../constants/image_path.dart';

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  State<AboutUs> createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final List _isHovering = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return  SafeArea(child: Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  // height: screenSize.height * 0.45,
                  width: screenSize.width,
                  child: Image.asset(
                    ImagePath.aboutUs,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                  width: double.infinity,
                      color: darkBlue.withOpacity(0.6),
                    )),
                Header.header(context, screenSize),
                Positioned(child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('About Us'.toUpperCase(),textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineLarge,),
                      const SizedBox(height: 20,),
                      Text('19 Valley is the best opportunity for people looking for a perfect place to call their new home.',textAlign: TextAlign.center,style: Theme.of(context).textTheme.headlineSmall,),
                    ],
                  ),
                ))
              ],
            ),
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Text('19 Valley Islamabad',textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayLarge,),
                  const SizedBox(height: 15,),
                  Text('Introduction:'.toUpperCase(),textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayLarge,),
                  const SizedBox(height: 15,),
                  Text(AppString.intro,textAlign: TextAlign.center,style: Theme.of(context).textTheme.displaySmall,),
                  const SizedBox(height: 15,),
                  Text('Mission & Objective',textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayLarge,),
                  const SizedBox(height: 15,),
                  Text('Mission',textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayLarge,),
                  const SizedBox(height: 15,),
                  Text(AppString.mission,textAlign: TextAlign.center,style: Theme.of(context).textTheme.displaySmall,),
                  const SizedBox(height: 15,),
                  Text('Objective',textAlign: TextAlign.center,style: Theme.of(context).textTheme.displayLarge,),
                  const SizedBox(height: 15,),
                  Text(AppString.mission,textAlign: TextAlign.center,style: Theme.of(context).textTheme.displaySmall,),

                ],
              ),
            ),
            const SizedBox(height: 50,),
            /// FOOTER
            Footer.footer(context, screenSize)
          ],
        ),
      ),
    ));  }
}
