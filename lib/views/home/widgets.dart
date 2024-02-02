import 'package:myanmar_proverbs/constant.dart';
import 'package:myanmar_proverbs/views/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//!TAbleRow
TableRow buildRow(List<String> cells, List<VoidCallback?> onPressedFunctions) =>
    TableRow(
      children: List.generate(cells.length, (index) {
        final cell = cells[index];
        const style = TextStyle(fontSize: 16);
        return Padding(
          padding: const EdgeInsets.all(6.0),
          child: Center(
            child: TextButton(
              onPressed: onPressedFunctions[index],
              child: Text(
                cell,
                style: style,
              ),
            ),
          ),
        );
      }),
    );

//!Drawer
class CustomDrawer extends GetView<HomeScreenController> {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: customBlack),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset('assets/images/Logoimage2.jpg'),
              )),
          const ListTile(
            title: Text(
              "Features",
              style: TextStyle(color: Colors.grey),
            ),
            onTap: null,
          ),
          customListTile(
            "မူလ",
            null,
            Icons.home_outlined,
            () {
              controller.gotoBack();
            },
          ),
          customListTile(
            "အကြိုက်ဆုံးသော စကားပုံများ",
            null,
            Icons.favorite_border_outlined,
            () {
              controller.gotoFavotire();
            },
          ),
          customListTile(
            "စကားပုံများ ရှာရန်",
            null,
            Icons.search,
            () {
              controller.gotoSearch();
            },
          ),
          customListTile(
            "ဘာသာစကား",
            "ယူနီကုတ်",
            Icons.language_outlined,
            null,
          ),
          customListTile(
            "ဗားရှင်း",
            "၁.၀.၀",
            Icons.warning_amber_sharp,
            null,
          ),
        ],
      ),
    );
  }

//ListTile
  Widget customListTile(
    String text1,
    String? text2,
    IconData icon,
    Function? onTap,
  ) {
    return Card(
      elevation: 1.0,
      child: ListTile(
        title: Text(
          text1,
          style: const TextStyle(fontSize: 16.0),
        ),
        subtitle: text2 != null
            ? Text(text2, style: const TextStyle(fontSize: 12.0))
            : null,
        leading: Icon(icon),
        onTap: onTap as void Function()?,
      ),
    );
  }
}
