import 'package:flutter/material.dart';
import 'package:open_dart/models/corporation.dart';
import 'package:open_dart/models/corporation_detail.dart';
import 'package:open_dart/widgets/corporation_chip.dart';

class CorporationDetailScreen extends StatelessWidget {
  final CorporationDetail corporationDetail;

  CorporationDetailScreen(this.corporationDetail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text('기업상세'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    corporationDetail.corpName,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  CorpClassChip(
                    corpClass: CorpClass.Y,
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                corporationDetail.corpNameEng,
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(),
              DetailItemWidget('CEO', corporationDetail.ceoNm),
              DetailItemWidget('종목코드', corporationDetail.stockCode),
              DetailItemWidget('법인등록번호', corporationDetail.jurirNo),
              DetailItemWidget('사업자등록번호', corporationDetail.bizrNo),
              DetailItemWidget('전화번호', corporationDetail.phnNo),
              DetailItemWidget('팩스번호', corporationDetail.faxNo),
              DetailItemWidget('설립일', corporationDetail.estDt),
              DetailItemWidget('결산월', corporationDetail.accMt),
              DetailItemWidget('홈페이지', corporationDetail.hmUrl, 1),
              DetailItemWidget('IR홈페이지', '', 1),
              Divider(),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.location_on),
                  SizedBox(
                    width: 8,
                  ),
                  Text(corporationDetail.adres),
                ],
              )
            ],
          ),
        ));
  }
}

class DetailItemWidget extends StatelessWidget {
  final String title;
  final String text;
  final int maxLines;

  DetailItemWidget(this.title, this.text, [this.maxLines]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Text(
                title,
                style: TextStyle(color: Colors.grey),
              )),
          Expanded(
              flex: 2,
              child: maxLines == null
                  ? Text(text)
                  : Text(
                      text,
                      maxLines: maxLines,
                    ))
        ],
      ),
    );
  }
}
