import 'package:cairo_daily_news/components/my_list_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Settings extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var sizes = MediaQuery.of(context).size;
    bool _switchValue = true;
    bool _switchValueFalse = false;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 14.0, vertical: 8),
                  child: Center(
                    child: Text(
                      'الاعدادات',
                      style: TextStyle(
                        fontSize: 30,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4 , horizontal: 16),
                        child: Container(
                          width: sizes.width,
                          height: sizes.height / 4,
                          child: Column(

                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('حسابك غير مسجل لدينا \n رجاء قم بتسجيل دخولك الان' , textAlign: TextAlign.center, style: TextStyle(fontSize: 16),),
                              SizedBox(height: 20),
                              MaterialButton(
                                padding:
                                EdgeInsets.symmetric(vertical: 4 , horizontal: 20),
                                onPressed: (){},
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1.3,
                                    ),
                                    color: Colors.transparent,
                                  ),
                                  child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(14),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'Continue with Google',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.black87,
                                                fontWeight: FontWeight.bold
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            Image.asset(
                                              'assets/icons/google.png',
                                              width: 24,
                                              height: 24,
                                            ),
                                          ],
                                        ),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      MyListTile(
                          'الوضع الليلي',
                        CupertinoSwitch(
                          activeColor: Color(0xffFB933F),
                          value: _switchValue,
                          onChanged: (value) {
                            //
                          },
                        ),
                      ),
                      MyListTile(
                        'ارسال الاشعارات',
                        CupertinoSwitch(
                          activeColor: Color(0xffFB933F),
                          value: _switchValueFalse,
                          onChanged: (value) {
                            //
                          },
                        ),
                      ),
                      SizedBox(height: 20,),
                      MyListTile('تعديل حسابي', Icon(Icons.arrow_forward_ios)),
                      MyListTile('لغة التطبيق', Icon(Icons.arrow_forward_ios)),
                      MyListTile('تغيير كلمة المرور', Icon(Icons.arrow_forward_ios)),
                      SizedBox(height: 20,),
                      MyListTile(
                        'وضع الخصوصيه',
                        CupertinoSwitch(
                          activeColor: Color(0xffFB933F),
                          value: _switchValue,
                          onChanged: (value) {
                            //
                          },
                        ),
                      ),
                      MyListTile('تعديل الخصوصيه', Icon(Icons.arrow_forward_ios)),
                      SizedBox(height: 20,),
                      MyListTile('تقييم التطبيق', Icon(Icons.arrow_forward_ios)),
                      MyListTile('الشكاوي او الاقتراحات', Icon(Icons.arrow_forward_ios)),
                      MyListTile('تسجيل الخروج', Icon(Icons.arrow_forward_ios)),
                      SizedBox(height: 20,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
