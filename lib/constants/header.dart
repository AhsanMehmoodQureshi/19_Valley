

import 'package:flutter/material.dart';

class Header{

  static  header(BuildContext context,var screenSize){
    return Positioned(
        top: 0,
        left: 0,
        right: 0,
        child: PreferredSize(
          preferredSize: Size(screenSize.width, 1000),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Text('19 Valley',style: Theme.of(context).textTheme.headlineLarge,),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(width: screenSize.width / 20),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, '/');
                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Home',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color:  Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width / 20),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context, '/about_us', (route) => false);

                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'About Us',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),
                      SizedBox(width: screenSize.width / 20),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamedAndRemoveUntil(context, '/contact_us', (route) => false);

                        },
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Contact Us',
                              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: Colors.white,
                              ),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}