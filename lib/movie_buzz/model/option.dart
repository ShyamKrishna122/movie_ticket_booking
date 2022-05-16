import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../movie-quiz/question_controller.dart';

class Option extends StatelessWidget {
  const Option(this.option, this.index, this.press, this.ans);
  final int index, ans;
  final String option;
  final Function() press;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<QuestionController>(context);
    double kDefaultPadding = 10;

    final Color getRightColor = controller.isAnswered ? controller.selectedAns == index ? index == ans ? Colors.green : Colors.red : Colors.grey : Colors.grey;

    IconData getTheRightIcon = index != ans ? Icons.close : Icons.done;
    

    return InkWell(
      onTap: press,
      child: Container(
        margin: EdgeInsets.only(top: kDefaultPadding),
        padding: EdgeInsets.all(kDefaultPadding),
        // color : controller.isAnswered ? controller.selectedAns == index ? getRightColor : Colors.transparent : Colors.transparent,
        decoration: BoxDecoration(
          border: Border.all(color: getRightColor),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: const TextStyle(color: Colors.black87, fontSize: 17),
            ),
            Container(
              height: 26,
              width: 26,
              // color : controller.isAnswered ? controller.selectedAns == index ? getRightColor : Colors.white : Colors.white,
              decoration: BoxDecoration(
                color: controller.isAnswered ? controller.selectedAns == index ? getRightColor : Colors.transparent : Colors.transparent,
                borderRadius: BorderRadius.circular(50),
                border: Border.all(color: controller.isAnswered ? controller.selectedAns == index ? getRightColor : Colors.transparent : Colors.transparent,),
              ),
              child: controller.isAnswered ? controller.selectedAns == index ? Icon(getTheRightIcon, size: 25) : null : null,
            )
          ],
        ),
      ),
    );
  }
}
