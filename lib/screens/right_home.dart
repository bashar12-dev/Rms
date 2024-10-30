import 'package:cached_network_image/cached_network_image.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:talabat_pos/screens/checkout.dart';
import 'package:talabat_pos/services/item_service.dart';
import 'package:talabat_pos/services/order_service.dart';
import 'package:talabat_pos/utils/spaces.dart';
import 'package:talabat_pos/utils/styles.dart';

import '../utils/color.dart';

class RightHome extends StatefulWidget {
  const RightHome({super.key});

  @override
  State<RightHome> createState() => _RightHomeState();
}

class _RightHomeState extends State<RightHome> {
  @override
  Widget build(BuildContext context) {
    final orderService = Provider.of<OrderService>(
      context,
    );
    /* return Consumer<orderService>(
        //future: context.read<CategoryService>().getCategories(),
        builder: (context, snapshot, _) { */

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ClayContainer(
        color: AppColors.backGroundCategoryColor,
        spread: 1,
        borderRadius: 16,
        // height: MediaQuery.of(context).size.height * 0.9,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Cart "
                    "${orderService.getOrder.items == null ? 0 : orderService.getOrder.items!.length}",
                    style: StylesApp.titleDescStyle,
                  ),
                  const Text(
                    "Clear All ",
                    style: StylesApp.normalStyle,
                  ),
                ],
              ),
            ),

            orderService.getOrder.items == null
                ? SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width,
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height * 0.45,
                    width: MediaQuery.of(context).size.width,
                    child: ListView.builder(
                      itemCount: orderService.getOrder.items!.length,
                      itemBuilder: (context, index) {
                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: [
                              _buildCachedNetworkImage(""),
                              SpacesApp.spaceW_10,
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          orderService
                                              .getOrder.items![index].name
                                              .toString(),
                                          style: StylesApp.itemNameStyle,
                                        ),
                                        IconButton(
                                            onPressed: () {
                                              orderService.deleteItem(index);
                                            },
                                            icon: Icon(
                                              Icons.delete,
                                              color: AppColors.scondaryColor,
                                              size: 20,
                                            ))
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        softWrap: false,
                                        "Lorem Ipsum is simply dummy text printing and Lorem Ipsum printing  Lorem Ipsum ",
                                        maxLines: 4,
                                        overflow: TextOverflow.ellipsis,
                                        style: StylesApp.normalStyle.copyWith(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 14,
                                            color: Colors.black54),
                                      ),
                                    ),
                                    SpacesApp.spaceH_5,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                                onTap: () {},
                                                child: Container(
                                                    decoration: BoxDecoration(
                                                      color: AppColors
                                                          .primaryColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                    ),
                                                    child: const Icon(
                                                        color: Colors.white,
                                                        Icons.remove))),
                                            SpacesApp.spaceW_10,
                                            Text(
                                              "1",
                                              style: StylesApp.itemNameStyle,
                                            ),
                                            SpacesApp.spaceW_10,
                                            InkWell(
                                              onTap: () {},
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColors.primaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: const Icon(
                                                      color: Colors.white,
                                                      Icons.add)),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          " ${orderService.getOrder.items![index].price.toString()}\$",
                                          style: StylesApp.itemNameStyle
                                              .copyWith(
                                                  fontSize: 20,
                                                  color: Colors.black87,
                                                  fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ]),
                          ),
                        );

                        // return ListTile(
                        //   leading:
                        //   title: Column(
                        //     mainAxisAlignment: MainAxisAlignment.start,
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: [
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Text(
                        //             orderService.getOrder.items![index].name
                        //                 .toString(),
                        //             style: StylesApp.itemNameStyle,
                        //           ),
                        //           IconButton(
                        //               onPressed: () {
                        //                 orderService.deleteItem(index);
                        //               },
                        //               icon: Icon(
                        //                 Icons.delete,
                        //                 color: AppColors.scondaryColor,
                        //                 size: 20,
                        //               ))
                        //         ],
                        //       ),
                        //       Text(
                        //         "Lorem Ipsum is simply dummy text printing and Lorem Ipsum printing  Lorem Ipsum ",
                        //         maxLines: 4,
                        //         overflow: TextOverflow.ellipsis,
                        //         textAlign: TextAlign.start,
                        //         style: StylesApp.normalStyle.copyWith(
                        //             fontSize: 14, color: Colors.black54),
                        //       ),
                        //       SpacesApp.spaceH_5,
                        //       Row(
                        //         mainAxisAlignment:
                        //             MainAxisAlignment.spaceBetween,
                        //         children: [
                        //           Row(
                        //             mainAxisAlignment: MainAxisAlignment.start,
                        //             children: [
                        //               InkWell(
                        //                   onTap: () {},
                        //                   child: Container(
                        //                       decoration: BoxDecoration(
                        //                         color: AppColors.primaryColor,
                        //                         borderRadius:
                        //                             BorderRadius.circular(5),
                        //                       ),
                        //                       child: const Icon(
                        //                           color: Colors.white,
                        //                           Icons.remove))),
                        //               SpacesApp.spaceW_10,
                        //               Text(
                        //                 "1",
                        //                 style: StylesApp.itemNameStyle,
                        //               ),
                        //               SpacesApp.spaceW_10,
                        //               InkWell(
                        //                 onTap: () {},
                        //                 child: Container(
                        //                     decoration: BoxDecoration(
                        //                       color: AppColors.primaryColor,
                        //                       borderRadius:
                        //                           BorderRadius.circular(5),
                        //                     ),
                        //                     child: const Icon(
                        //                         color: Colors.white,
                        //                         Icons.add)),
                        //               ),
                        //             ],
                        //           ),
                        //           Text(
                        //             orderService.getOrder.items![index].price
                        //                 .toString(),
                        //             style: StylesApp.itemNameStyle,
                        //           ),
                        //         ],
                        //       ),
                        //       SpacesApp.spaceH_20,
                        //     ],
                        //   ),
                        // );
                      },
                    ),
                  ),
            SpacesApp.spaceH_10,

            ///calc
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "SubTotal",
                          style: StylesApp.calcStyle,
                        ),
                        Text(
                          orderService.getOrder.subTotal == null
                              ? "0.0"
                              : orderService.getOrder.subTotal.toString(),
                          style: StylesApp.calcStyle,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Discount",
                          style: StylesApp.calcStyle,
                        ),
                        Text(
                          "0.0",
                          style: StylesApp.calcStyle,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "VAT",
                          style: StylesApp.calcStyle,
                        ),
                        Text(
                          "0.0",
                          style: StylesApp.calcStyle,
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    thickness: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total",
                          style: StylesApp.totalStyle,
                        ),
                        Text(
                          orderService.getOrder.total == null
                              ? "0.0"
                              : orderService.getOrder.total.toString(),
                          style: StylesApp.totalStyle,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SpacesApp.spaceH_20,
            //bun Payment

            FilledButton(
              style: FilledButton.styleFrom(
                fixedSize: Size(MediaQuery.of(context).size.width * 0.2,
                    MediaQuery.of(context).size.height * 0.07),
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              onPressed: () {
                if (orderService.getOrder.items!.isNotEmpty) {
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return const Checkout();
                      });
                }
              },
              child: const Text("Checkout"),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCachedNetworkImage(String baseUrl) {
    baseUrl =
        "https://mdev.yemensoft.net:473/OnyxRestaurantCasherService/images/GROUP_PIC/005.png";
    /*http://mdev.yemensoft.net:8087/OnyxRestaurantCasherService/images/GROUP_PIC/016.png */

    /*return CustomeImage(
      url: imageUrl,
      borderRadius: BorderRadius.circular(8),
    );*/
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: CachedNetworkImage(
        width: 100,
        height: 100,
        imageUrl: baseUrl,
        // placeholder: (context, url) => const Center(
        //   child: CircularProgressIndicator(),
        // ),
        progressIndicatorBuilder: (context, url, progress) =>
            Shimmer.fromColors(
                baseColor: AppColors.baseColor(),
                highlightColor: Colors.white,
                child: Container(
                  color: AppColors.background,
                )),
        errorWidget: (context, url, error) => Icon(
          Icons.food_bank,
          color: AppColors.scondaryColor,
        ),
        imageBuilder: (context, imageProvider) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: imageProvider,
                fit: BoxFit.contain,
              ),
            ),
          );
        },
      ),
    );
  }
}
