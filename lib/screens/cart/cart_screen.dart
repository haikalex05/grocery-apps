import 'package:flutter/material.dart';
import 'package:grocery/common_widgets/app_button.dart';
import 'package:grocery/helpers/column_with_seprator.dart';
import 'package:grocery/models/grocery_item.dart';
import 'package:grocery/widgets/chart_item_widget.dart';

import 'checkout_bottom_sheet.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Text(
                "My Cart",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: getChildrenWithSeperator(
                  addToLastChild: false,
                  widgets: demoItems.map((e) {
                    return Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 25,
                      ),
                      width: double.maxFinite,
                      child: ChartItemWidget(
                        item: e,
                      ),
                    );
                  }).toList(),
                  seperator: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 25,
                    ),
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ),
              ),
              Divider(
                thickness: 1,
              ),
              getCheckoutButton(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget getCheckoutButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: AppButton(
        label: "Go To Check Out",
        fontWeight: FontWeight.w600,
        padding: EdgeInsets.symmetric(vertical: 30),
        trailingWidget: getButtonPriceWidget(),
        onPressed: () {
          showBottomSheet(context);
        },
      ),
    );
  }

  Widget getButtonPriceWidget() {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Color(0xff489E67),
        borderRadius: BorderRadius.circular(4),
      ),
      child: RichText(
        text: TextSpan(
          text: '\$',
          style: TextStyle(
            color: Colors.white, // Ubah warna karakter dolar menjadi putih
            fontWeight: FontWeight.w600,
            fontSize: 16, // Sesuaikan ukuran teks sesuai kebutuhan
          ),
          children: <TextSpan>[
            TextSpan(
              text: '12.96',
              style: TextStyle(
                color: Colors.white, // Ubah warna angka menjadi putih
                fontWeight: FontWeight.w600,
                fontSize: 16, // Sesuaikan ukuran teks sesuai kebutuhan
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (BuildContext bc) {
          return CheckoutBottomSheet();
        });
  }
}
