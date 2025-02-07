import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:test_app/widgets/listTile.dart';

import '../generated/assets.dart';
import '../main.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF7F7F7),
      appBar: AppBar(
        title: Text(
          "Профиль",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage(Assets.imagesAvatar),
                ),
                title: Text(
                  "Kevin Lanceplaine",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                ),
                subtitle: Text(
                  "+998 99 123 45 57",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                      color: Color(0xff8E8E93)),
                ),
                trailing: IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset(Assets.iconsEditIcon)),
              ),
            ),
            SizedBox(
              height: 16,
            ),
            MyListTile(
              icon: SvgPicture.asset(Assets.iconsWalletIcon),
              title: "Кошелек",
              action: Text(
                "${f.format(23133).replaceAll(",", " ")} сум",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
              ),
              title_color: Colors.black, tile_color: Colors.white,
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16), color: Colors.white),
              child: Column(
                children: [
                  MyListTile(
                    icon: SvgPicture.asset(Assets.iconsSettingsIcon),
                    title: "Настройки",
                    action: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Color(0xff8E8E93),
                        )),
                    title_color: Colors.black, tile_color: Colors.white,
                  ),
                  MyListTile(
                    icon: SvgPicture.asset(Assets.iconsCommentIcon),
                    title: "Служба поддержки",
                    action: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Color(0xff8E8E93),
                        )),
                    title_color: Colors.black, tile_color: Colors.white,
                  ),
                  MyListTile(
                    icon: SvgPicture.asset(Assets.iconsFileIcon),
                    title: "Условия использования",
                    action: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Color(0xff8E8E93),
                        )),
                    title_color: Colors.black, tile_color: Colors.white,
                  ),
                  MyListTile(
                    icon: SvgPicture.asset(Assets.iconsInfoIcon),
                    title: "О нас",
                    action: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: Color(0xff8E8E93),
                        )),
                    title_color: Colors.black, tile_color: Colors.white,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MyListTile(
              icon: SvgPicture.asset(Assets.iconsExitIcon),
              title: "Выйти из аккаунта",
              action: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Color(0xff8E8E93),
                  )),
              title_color: Color(0xffF2271C), tile_color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
