import router from "@ohos.router";

@Entry
@Component
export struct SimpleCalendarPage {
  build() {
    Column() {
      // 标题栏
      Row() {
        Text('<  ')
          .fontColor('#ffffff')
          .margin({left:10})
          .fontSize(40)
        Text('2025年8月')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .width('100%')
          .fontColor('#ffffff')
          .padding(10);
      }
      .height('20%')
      .borderRadius(40)
      .backgroundColor('#2BCDDD');

      // 日历区域（字体居中，大小不变）
      Column({space:20}) {
        // 星期标题行（确保居中）
        Row() {
          Text('一').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#2BCDDD');
          Text('二').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#2BCDDD');
          Text('三').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#2BCDDD');
          Text('四').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#2BCDDD');
          Text('五').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#2BCDDD');
          Text('六').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#2BCDDD');
          Text('日').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#2BCDDD');
        }
        .padding(5);

        // 第一行日期（确保居中）
        Row() {
          Text('27').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#C0C0C0').padding(8);
          Text('28').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#C0C0C0').padding(8);
          Text('29').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#C0C0C0').padding(8);
          Text('30').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#C0C0C0').padding(8);
          Text('1').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
          Text('2').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
          Text('3').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
        }

        // 第二行日期（确保居中）
        Row() {
          Text('4').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
          Text('5').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
          Text('6').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
          Text('7').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
          Text('8').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
          Text('9').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
          Text('10').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
        }

        // 第三行日期（15日选中，确保居中）
        Row() {
          Text('11').width('14.28%').textAlign(TextAlign.Center).fontColor('#999999').fontSize(18).padding(8);
          Text('12').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
          Text('13').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
          Text('14').width('14.28%').textAlign(TextAlign.Center).fontSize(18).fontColor('#999999').padding(8);
          Text('15')
            .width('14.28%')
            .textAlign(TextAlign.Center)
            .fontSize(18)
            .padding(8)
            .backgroundColor('#2BCDDD')
            .fontColor('#FFFFFF')
            .borderRadius(16);
          Text('16').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('17').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
        }

        // 第四行日期（确保居中）
        Row() {
          Text('18').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('19').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('20').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('21').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('22').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('23').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('24').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
        }

        // 第五行日期（确保居中）
        Row() {
          Text('25').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('26').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('27').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('28').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('29').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('30').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
          Text('31').width('14.28%').textAlign(TextAlign.Center).fontSize(18).padding(8);
        }
      }
      // 保持原大小和位置
      .margin({ left: '10%', right: '10%', top: -50, bottom: 16 })
      .backgroundColor('#FFFFFF')
      .shadow({ radius: 10, color: '#CCCCCC', dx: 0, dy: 4 } as ShadowOptions)
      .borderRadius(8)
      .height('40%')
      .width('90%')
      .padding(8);


      // 今日投放卡片（标题靠左居中）
      Column() {
        Row() {
          Text('')
            .width(4)
            .height(16)
            .backgroundColor('#FF5E5E')
            .borderRadius(2)
            .margin({ right: 4 });
          Text('今日投放')
            .fontSize(16)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Start); // 靠左对齐
        }
        .margin({ left: 16, bottom: 8 })
       .width('100%')

        Row() {
          Text('7:30-8:30')
            .fontSize(17)
            .width(100)
            .fontColor('#999999')
            .margin({ left: 20 });
          Text('湿垃圾')
            .fontColor('#999999')
            .fontSize(17);
        }
        .margin({ bottom: 8 });

        Row() {
          Text('19:00-20:00')
            .fontSize(17)
            .width(100)
            .margin({ left: 20 });
          Text('干垃圾')
            .fontSize(17);
        }
      }
      .width('90%')
      .margin({ left: '5%', right: '5%', bottom: 16 })
      .padding(16)
      .backgroundColor('#FFFFFF')
      .border({ width: 1, color: '#ECECEC' })
      .borderRadius(8);

      // 明日投放卡片（标题靠左居中）
      Column() {
        Row() {
          Text('')
            .width(4)
            .height(16)
            .backgroundColor('#40C9FF')
            .borderRadius(2)
            .margin({ right: 4 });
          Text('明日投放')
            .fontSize(17)
            .fontWeight(FontWeight.Bold)
            .textAlign(TextAlign.Start); // 靠左对齐
        }
        .margin({ left: 16, bottom: 8 })
        .width('100%')

        Row() {
          Text('7:30-8:30')
            .fontSize(17)
            .width(100)
            .margin({ left: 20 });
          Text('湿垃圾')
            .fontSize(17);
        }
        .margin({ bottom: 8 });

        Row() {
          Text('19:00-20:00')
            .fontSize(17)
            .width(100)
            .margin({ left: 20 });
          Text('干垃圾')
            .fontSize(17);
        }
      }
      .width('90%')
      .margin({ left: '5%', right: '5%' })
      .padding(16)
      .backgroundColor('#FFFFFF')
      .border({ width: 1, color: '#ECECEC' })
      .borderRadius(8);
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#FFFFFF');
  }
}
