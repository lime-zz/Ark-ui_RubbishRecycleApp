import router from '@ohos.router';

@Entry
@Component
struct Zhifu {
  build() {
    Column({ space: 12 }) {
      // 顶部标题栏
      Row({ space: 8 }) {
        Image($r('app.media.fanhui')) // 使用资源引用方式
          .width(24)
          .height(24)
          .onClick(() => {
            router.back(); // 使用鸿蒙路由返回
          });
        Text('支付成功')
          .fontSize(20)
          .fontColor('#ffffff')
          .fontWeight(FontWeight.Bold);

      }
      .padding({ top: 40, left: 16 })
      .width('100%');

      // 订单详情卡片
      Column({ space: 8 }) {
        Row({ space: 12 }) {
          Image($r('app.media.shangping')) // 使用资源引用方式
            .width(80)
            .height(80)
            .objectFit(ImageFit.Cover);
          Column({ space: 4 }) {
            Text('创意卫浴五件套 欧式高档卫生间洗漱...')
              .fontSize(14)
            Row({ space: 4 }) {
              Text('250币')
                .fontSize(12)
                .fontColor('#999999');
              Text('200币')
                .fontSize(12)
                .fontColor('#999999')

            };
            Text('X2')
              .fontSize(12)
              .fontColor('#999999');
            Text('400币')
              .fontSize(14)
              .fontWeight(FontWeight.Bold)
              .fontColor('#FF0000');
          };
        }
        .backgroundColor('#ffffff')
        .borderRadius(20)
        .width('100%')
        .padding(20);

        Divider();

        // 配送详情
        Column({ space: 15 }) {
          Text('配送详情')
            .fontSize(16)
            .width('100%')
            .fontWeight(FontWeight.Bold);
          Text('配送物流：OMINI物流')
            .fontSize(14)
            .width('100%')
          Text('送货时间：预计8月7日（两天后）送达')
            .fontSize(14)
          .width('100%')

        }
        .padding(12);

        Divider();

        // 收货人详情
        Column({ space: 15 }) {
          Text('收货人详情')
            .fontSize(16)
            .width('100%')
            .fontWeight(FontWeight.Bold);
          Text('取货人：OMINI.BASS')
            .width('100%')
            .fontSize(14);
          Text('联系电话：18801525595')
            .width('100%')
            .fontSize(14);
          Text('备注：需要包装盒，谢谢！')
            .width('100%')
            .fontSize(14);
        }
        .padding(20);
      }
      .borderRadius(12)
      .margin({ left: 16, right: 16 })

      // 返回首页按钮
      Button('返回首页')
        .width('80%')
        .height(35)
        .fontSize(16)
        .fontWeight(FontWeight.Bolder)
        .backgroundColor('#5aead7')
        .fontColor('#FFFFFF')
        .borderRadius(20)
        .margin({ top: 550 })
        .onClick(() => router.pushUrl({ url: 'pages/Index' }));
    }
    .backgroundColor('#2bcddd')
    .width('100%')
    .height('15%');
  }
}