import 'package:ai_assistant/helper/global.dart';
import 'package:ai_assistant/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ai_assistant/model/onboard.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final c = PageController();
    final list = [
      //onboarding2
      Onboar(
          title: 'Hãy hỏi tôi về mọi thứ',
          subtitle:
              'Tôi sẽ trở thành người bạn thân thiết & Bạn có thể hỏi tôi mọi thứ & Tôi sẽ giúp bạn',
          lottie: 'ai_ask_me_join'),
      //onboarding2
      Onboar(
          title: 'Trí tưởng tượng thành hiện thực',
          subtitle:
              'Hãy đưa suy nghĩ của bạn, Tôi sẽ tạo ra một số thứ tuyệt vời!!',
          lottie: 'ai_play'),
    ];
    return Scaffold(
      body: PageView.builder(
        controller: c,
        itemCount: list.length,
        itemBuilder: (ctx, ind) {
          final isLast = ind == list.length - 1;
          return Column(
            children: [
              //lottie
              Lottie.asset('assets/lottie/${list[ind].lottie}.json',
                  height: mq.height * .6, width: isLast ? mq.width * .7 : null),

              //title
              Text(
                list[ind].title,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    letterSpacing: .5),
              ),

              SizedBox(height: mq.height * .015),
              //subtitle
              SizedBox(
                width: mq.width * .7,
                child: Text(
                  list[ind].subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontSize: 13, letterSpacing: .5, color: Colors.black54),
                ),
              ),
              const Spacer(),

              //dots
              Wrap(
                spacing: 10,
                children: List.generate(
                    2,
                    (i) => Container(
                          width: i == ind ? 15 : 10,
                          height: 8,
                          decoration: BoxDecoration(
                              color: i == ind ? Colors.blue : Colors.grey,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(5))),
                        )),
              ),

              const Spacer(),

              //button
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      elevation: 0,
                      textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      minimumSize: Size(mq.width * .4, 50)),
                  onPressed: () {
                    if (isLast) {
                      Get.off(() => const HomeScreen());
                      // Navigator.of(context).pushReplacement(MaterialPageRoute(
                      //     builder: (_) => const HomeScreen()));
                    } else {
                      c.nextPage(
                          duration: const Duration(milliseconds: 1500),
                          curve: Curves.ease);
                    }
                  },
                  child: Text(isLast ? 'Finish' : 'Next')),
              const Spacer(flex: 2),
            ],
          );
        },
      ),
    );
  }
}
