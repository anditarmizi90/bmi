import 'package:bmi/constants/const.dart';
import 'package:bmi/helpers/bmi_calculator.dart';
import 'package:bmi/view/bmi_result_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BmiDataScreen extends StatefulWidget {
  const BmiDataScreen({Key? key}) : super(key: key);

  @override
  State<BmiDataScreen> createState() => _BmiDataScreenState();
}

class _BmiDataScreenState extends State<BmiDataScreen> {
  int height = 100;
  int weight = 50;
  int age = 20;
  String? gender;

  List<Widget> generateList(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(
        Text(
          "$i",
          style: labelTexstyle!.copyWith(
            fontSize: 20,
          ),
        ),
      );
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xff0a0e21),
      appBar: AppBar(
        elevation: 0,
        title: Center(
          child: Text(
            "BMI Calculator",
            style: GoogleFonts.acme(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          final bmiCalculator = BmiCalculator(height: height, weight: weight);
          bmiCalculator.calculateBmi();
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: ((context) {
                return BmiResultScreen(
                  bmi: bmiCalculator.bmi!,
                );
              }),
            ),
          );
        },
        child: Container(
          height: 60,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: const Color(0xff517DF6),
          ),
          child: Center(
            child: Text(
              "Hitung BMI",
              style: GoogleFonts.alike(),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "male";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor: (gender == "male")
                          ? const Color(0xff517DF6)
                          : Colors.white,
                      child: Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: GenderIconText(
                                icon: Icons.male,
                                title: 'Male',
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "male")
                                  ? const Color(0xff517DF6)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      gender = "female";
                      setState(() {});
                    },
                    child: BmiCard(
                      borderColor: (gender == "female")
                          ? const Color(0xff517DF6)
                          : Colors.white,
                      child: Stack(
                        children: [
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 20.0),
                              child: GenderIconText(
                                title: 'Female',
                                icon: Icons.female,
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Icon(
                              Icons.check_circle,
                              color: (gender == "female")
                                  ? const Color(0xff517DF6)
                                  : Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Column(
              children: [
                Text(
                  "HEIGHT",
                  style: labelTexstyle!.copyWith(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: BmiCard(
                        child: Slider(
                          value: height.toDouble(),
                          min: 80,
                          max: 200,
                          thumbColor: const Color.fromARGB(255, 247, 7, 7),
                          activeColor: Colors.purpleAccent,
                          onChanged: (value) {
                            height = value.toInt();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                    BmiCard(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 15.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "$height",
                              style: labelTexstyle,
                            ),
                            Text(
                              " cm",
                              style: labelTexstyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WEIGHT",
                        style: labelTexstyle,
                      ),
                      BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: CupertinoPicker(
                                scrollController: FixedExtentScrollController(
                                    initialItem: 30),
                                itemExtent: 25,
                                magnification: 2,
                                useMagnifier: true,
                                onSelectedItemChanged: (val) {
                                  weight = val + 20;
                                },
                                children: generateList(20, 220),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "AGE",
                        style: labelTexstyle,
                      ),
                      BmiCard(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.2,
                              child: CupertinoPicker(
                                scrollController:
                                    FixedExtentScrollController(initialItem: 5),
                                itemExtent: 25,
                                magnification: 2,
                                useMagnifier: true,
                                onSelectedItemChanged: (val) {
                                  weight = val + 20;
                                },
                                children: generateList(15, 90),
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
          ],
        ),
      ),
    );
  }
}

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = Colors.white,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            offset: const Offset(-2, 2),
            blurRadius: 20,
            color: Colors.black.withOpacity(0.2),
          )
        ],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: borderColor!,
        ),
      ),
      margin: const EdgeInsets.all(15),
      child: child,
    );
  }
}

class GenderIconText extends StatelessWidget {
  const GenderIconText({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80,
          color: primaryColor,
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          title,
          style: labelTexstyle,
        ),
      ],
    );
  }
}
