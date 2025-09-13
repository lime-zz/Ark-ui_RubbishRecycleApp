// 修正导入：移除错误的 AppStorageV2 导入
import { router } from '@kit.ArkUI';


@Entry
@Component
export struct Wode {
  @State message: string = 'Hello World';
  @State account: string = '';

  aboutToAppear() {
    // 修正：使用 AppStorage 全局对象读取数据
    this.account = AppStorage.Get('currentUser') ?? '未登录'; // 正确的读取方法
  }

  build() {
    Column() {
      // 蓝色背景区域（保持不变）
      Column() {

        Row({ space: 10 }) {
          Image($r('app.media.img_18'))
            .width(30)
            .height(30)
            .zIndex(1) // 确保图标在最上层
            .margin({ right: 10 })
            .onClick(() => router.pushUrl({ url: 'pages/index' }));
          Image($r('app.media.naicha'))
            .width(50)
            .height(50)
            .borderRadius(25)

          Column() {
            Text(this.account)
              .fontSize(20)
              .fontColor(Color.White)
              .fontWeight(FontWeight.Bold);
            Text('18887688688')
              .fontSize(15)
              .fontColor(Color.White);
          }
          .margin({ left: 10, right: 20 });

          Row() {
            Image($r('app.media.nicebell'))
              .width(40)
              .height(40)
              .onClick(() => router.pushUrl({ url: 'pages/xiaoxi' }));

            Image($r('app.media.whitepinkset'))
              .width(30)
              .height(30)
              .margin({ left: 10 })
              .onClick(() => router.replaceUrl({ url: 'pages/Setting' }));
          }
        }
        .width('100%')
        .padding(15)
        .margin({ top: 20 })
        .backgroundColor('transparent');

        Row() {
          Column() {
            Text('总资产')
              .fontSize(20)
              .fontColor(Color.White);
            Text('5000')
              .fontSize(24)
              .fontColor(Color.White);
          }
          .margin({ left: 50 });

          Column({ space: 5 }) {
            Button('提现')
              .fontColor('#000000')
              .backgroundColor('#FFFFFF')
              .height(35)
              .onClick(() => router.pushUrl({ url: 'pages/tixian' }));

            Button('收支明细')
              .fontColor('#000000')
              .backgroundColor('#FFFFFF')
              .height(35)
              .onClick(() => router.pushUrl({ url: 'pages/usemoney' }));
          }
          .margin({ right: 20 });
        }
        .width('100%')
        .margin({ top: 20 })
        .justifyContent(FlexAlign.SpaceBetween);
      }
      .backgroundColor('#2BCDDC')
      .height('28%');

      // 白色背景区域（保持不变）
      Column() {
        Row() {
          Image($r('app.media.img_38'))
            .width(24)
            .height(24)
            .margin({ left: 3, right: 3})
          Text('回收订单')
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
            .fontColor(Color.Black);
        }
        .width('100%')
        .padding({ left:8, right: 20 })
        .margin({ top: 20 });

        Row({ space: 15 }) {
          this.renderOrderButton($r('app.media.daijiedan1'), '待接单', 'pages/Recycle2');
          this.renderOrderButton($r('app.media.yijiedan1'), '已接单', 'pages/Recycle2');
          this.renderOrderButton($r('app.media.shouhuozhong1'), '收货中', 'pages/Recycle2');
          this.renderOrderButton($r('app.media.yiwancheng2'), '已完成', 'pages/Recycle2');
        }
        .width('95%')
        .padding(10)
        .margin({ top: 10 });

        Row() {
          Image($r('app.media.img_38'))
            .width(24)
            .height(24)
            .margin({ left: 3, right: 3})
          Text('兑换订单')
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
            .fontColor(Color.Black);
        }
        .width('100%')
        .padding({ left: 8, right: 20 })
        .margin({ top: 30 });

        Row({ space: 15 }) {
          this.renderOrderButton($r('app.media.daizhifu1'), '待支付', '');
          this.renderOrderButton($r('app.media.daiquhuo1'), '待取货', '');
          this.renderOrderButton($r('app.media.peisongzhong1'), '配送中', '');
          this.renderOrderButton($r('app.media.yiwancheng2'), '已完成', '');
        }
        .width('95%')
        .padding(10)
        .margin({ top: 10 });


        Row() {
          Image($r('app.media.img_38'))
            .width(24)
            .height(24)
            .margin({ left: 3, right: 3})
          Text('常用功能')
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
            .fontColor(Color.Black);
        }
        .width('100%')
        .padding({ left: 8, right: 20 })
        .margin({ top: 30 });

        Row({ space: 15 }) {
          this.renderOrderButton($r('app.media.choucang1'), '我的收藏', 'pages/Shoucang');
          this.renderOrderButton($r('app.media.zuji1'), '足迹', 'pages/wodezuji');
          this.renderOrderButton($r('app.media.gongxizn1'), '我的贡献', 'pages/Contributions');
        }
        .width('95%')
        .padding(10)
        .margin({ top: 10 })
        .justifyContent(FlexAlign.SpaceAround);
      }
      .backgroundColor(Color.White)
      .borderRadius({ topLeft: 30, topRight: 30 })
      .layoutWeight(1);
    }
    .backgroundColor('#FFFFFF')
    .height('100%')
    .width('100%');
  }

  @Builder
  renderOrderButton(icon: Resource, text: string, url: string) {
    Column({ space: 5 }) {
      Image(icon)
        .width(34)
        .height(40);

      Button(text)
        .backgroundColor('#FFD7E0')
        .fontColor('#FF5E80')
        .height(35)
        .borderRadius(8)
        .onClick(() => {
          // 判断是否为兑换订单的四个按钮
          const exchangeOrderTexts = ['待支付', '待取货', '配送中', '已完成'];
          if (exchangeOrderTexts.includes(text)) {
            // 兑换订单按钮：跳转到 pages/usemoney
            router.pushUrl({ url: 'pages/duihuandingdan' });
          } else if (url) {
            // 其他按钮：按原有逻辑跳转
            router.pushUrl({ url });
          }
        });
    }
  }
}