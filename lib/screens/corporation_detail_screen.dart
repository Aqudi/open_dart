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
              DetailItemWidget(label: 'CEO', value: corporationDetail.ceoNm),
              DetailItemWidget(
                  label: '종목코드', value: corporationDetail.stockCode),
              DetailItemWidget(
                  label: '법인등록번호', value: corporationDetail.jurirNo),
              DetailItemWidget(
                  label: '사업자등록번호', value: corporationDetail.bizrNo),
              DetailItemWidget(label: '전화번호', value: corporationDetail.phnNo),
              DetailItemWidget(label: '팩스번호', value: corporationDetail.faxNo),
              DetailItemWidget(label: '설립일', value: corporationDetail.estDt),
              DetailItemWidget(label: '결산월', value: corporationDetail.accMt),
              DetailItemWidget(
                  label: '홈페이지', value: corporationDetail.hmUrl, maxLines: 1),
              DetailItemWidget(label: 'IR홈페이지', value: '', maxLines: 1),
              Divider(),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Icon(Icons.place),
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
  final String label;
  final String value;
  final int maxLines;

  DetailItemWidget({this.label, this.value, this.maxLines = 0});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
              flex: 1,
              child: Text(
                label,
                style: TextStyle(color: Colors.grey),
              )),
          Expanded(
              flex: 2,
              child: maxLines == 0
                  ? Text(value)
                  : Text(
                      label,
                      maxLines: maxLines,
                    ))
        ],
      ),
    );
  }
}
