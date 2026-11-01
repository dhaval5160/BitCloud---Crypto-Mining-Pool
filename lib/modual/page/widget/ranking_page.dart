import 'package:cloud_mining_farm/ad_modual/int_man/Interstitial.dart';
import 'package:cloud_mining_farm/ad_modual/native/native_banner.dart';
import 'package:cloud_mining_farm/ad_modual/native/small_native.dart';
import 'package:cloud_mining_farm/modual/ctrl/home_ctrl.dart';
import 'package:cloud_mining_farm/theme/colors.dart';
import 'package:cloud_mining_farm/theme/textstyles.dart';
import 'package:cloud_mining_farm/utils/app_navigation/navigation.dart';
import 'package:cloud_mining_farm/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class RankingPage extends StatefulWidget {
  const RankingPage({super.key});

  @override
  State<RankingPage> createState() => _RankingPageState();
}

class _RankingPageState extends State<RankingPage> {
  final HomeCtrl homeCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        InterstitialAdManager().showInterstitialByBackCount();
        Navigation.pop();
      },
      child: Scaffold(
        backgroundColor: AppColor.background,
        appBar: buildCustomAppBar(context, title: 'rkh'.tr),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 10, bottom: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [const Color(0xFF323033), const Color(0xFF1F1D20)],
                  ),
                  border: Border.all(color: Colors.white.withValues(alpha: .05)),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.workspace_premium_rounded, color: Colors.amber, size: 18),

                        7.widthBox,

                        Text(
                          "Top Leaders",
                          style: textPoppins(context, fontSize: 14).copyWith(color: Colors.white, fontWeight: FontWeight.w600),
                        ),
                        Spacer(),

                        Text("Weekly Ranking", style: subTextPoppins(context, fontSize: 11).copyWith(color: Colors.white70)),
                      ],
                    ),

                    const SizedBox(height: 15),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        /// 2ND
                        if (homeCtrl.leaderBoardList.length > 1)
                          Expanded(
                            child: _premiumTopCard(
                              context,
                              data: homeCtrl.leaderBoardList[1],
                              rank: 2,
                              height: 90,
                              color: const Color(0xffC0C0C0),
                            ),
                          ),

                        const SizedBox(width: 15),

                        /// 1ST
                        if (homeCtrl.leaderBoardList.isNotEmpty)
                          Expanded(
                            child: _premiumTopCard(
                              context,
                              data: homeCtrl.leaderBoardList[0],
                              rank: 1,
                              height: 130,
                              color: const Color(0xffD4AF37),
                              isCenter: true,
                            ),
                          ),

                        const SizedBox(width: 15),

                        /// 3RD
                        if (homeCtrl.leaderBoardList.length > 2)
                          Expanded(
                            child: _premiumTopCard(
                              context,
                              data: homeCtrl.leaderBoardList[2],
                              rank: 3,
                              height: 60,
                              color: const Color(0xffCD7F32),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ).pOnly(right: 15, left: 15, top: 10, bottom: 5),

              NativeBanner(
                padding: const EdgeInsets.symmetric(vertical: 15),
                sPadding: const EdgeInsets.symmetric(vertical: 7.5),
              ).px(15),

              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 5),
                itemCount: homeCtrl.leaderBoardList.length > 3 ? homeCtrl.leaderBoardList.length - 3 : 0,
                itemBuilder: (context, index) {
                  final data = homeCtrl.leaderBoardList[index + 3];

                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [Colors.white.withValues(alpha: .03), Colors.white.withValues(alpha: .01)],
                      ),
                      border: Border.all(color: Colors.grey.withValues(alpha: .15)),
                      boxShadow: [BoxShadow(blurRadius: 10, offset: Offset(0, 4), color: Colors.black.withValues(alpha: .03))],
                    ),
                    child: Row(
                      children: [
                        /// RANK
                        Container(
                          height: 45,
                          width: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            gradient: LinearGradient(
                              colors: [Colors.orange.withValues(alpha: .15), Colors.orange.withValues(alpha: .05)],
                            ),
                          ),
                          child: Center(
                            child: Text(
                              "#${index + 4}",
                              style: textPoppins(context, fontSize: 12).copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        10.widthBox,

                        /// INFO
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                data.name ?? '',
                                style: textPoppins(context, fontSize: 13).copyWith(fontWeight: FontWeight.w600, height: 0),
                              ),
                              1.heightBox,
                              Text(
                                data.message ?? '',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: textRoboto(context, fontSize: 11).copyWith(height: 0),
                              ),
                            ],
                          ),
                        ),

                        /// BTC
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(
                              colors: [Colors.amber.withValues(alpha: .18), Colors.orange.withValues(alpha: .08)],
                            ),
                          ),
                          child: Text(data.btc ?? '', style: subTextPoppins(context, fontSize: 12)),
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return index != 0 && index % 10 == 0
                      ? SmallNative(padding: const EdgeInsets.symmetric(vertical: 14), sPadding: const EdgeInsets.symmetric(vertical: 7))
                      : const SizedBox(height: 14);
                },
              ),
            ],
          ),
        ),

        /*
        body: ListView.separated(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 20, top: 15),
          shrinkWrap: true,
          itemCount: homeCtrl.leaderBoardList.length,
          itemBuilder: (context, index) {
            final data = homeCtrl.leaderBoardList[index];
            return CardContainer(
              isPaddingZero: true,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.name ?? '', style: textPoppins(context, fontSize: 12)),
                        Row(
                          children: [
                            Text('${data.message}', style: textRoboto(context, fontSize: 12)),
                            10.widthBox,
                            Text(data.btc ?? '', style: subTextPoppins(context, fontSize: 12)),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      AppAsset.trophy,
                      scale: 20,
                      color: index == 0
                          ? Color(0xffD4AF37)
                          : index == 1
                          ? Color(0xffC0C0C0)
                          : index == 2
                          ? Color(0xffCD7F32)
                          : Colors.transparent,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return index == 2
                ? VerticalPadding(
                    child: ClipRRect(borderRadius: BorderRadius.circular(8), child: NativeBanner()),
                  )
                : SizedBox(height: 10);
          },
        ),
*/
      ),
    );
  }

  Widget _premiumTopCard(
    BuildContext context, {
    required dynamic data,
    required int rank,
    required double height,
    required Color color,
    bool isCenter = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        /// AVATAR
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: color, width: 2),
              ),
              child: CircleAvatar(
                radius: isCenter ? 28 : 22,
                backgroundColor: color.withValues(alpha: .15),
                child: Icon(Icons.person, size: isCenter ? 28 : 22, color: color),
              ),
            ),

            Positioned(
              top: 0,
              child: Icon(Icons.workspace_premium, color: color, size: isCenter ? 22 : 16),
            ),
          ],
        ),

        const SizedBox(height: 12),

        Text(
          data.name ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textPoppins(context, fontSize: isCenter ? 13 : 12).copyWith(color: Colors.white, fontWeight: FontWeight.w600),
        ),

        const SizedBox(height: 3),

        /// BTC
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.white.withValues(alpha: .08)),
          child: Text(data.btc ?? '', style: subTextPoppins(context, fontSize: 11).copyWith(color: Colors.white)),
        ),

        const SizedBox(height: 12),

        Container(
          height: height,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [color, color.withValues(alpha: .65)],
            ),
            boxShadow: [BoxShadow(blurRadius: 15, offset: Offset(0, 6), color: color.withValues(alpha: .35))],
          ),
          child: Center(
            child: Text(
              "$rank",
              style: textPoppins(
                context,
                fontSize: isCenter ? 34 : 28,
              ).copyWith(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}
