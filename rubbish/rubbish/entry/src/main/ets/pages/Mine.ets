import { router } from '@kit.ArkUI';

@Entry
@Component
export struct Wode {
  @State message: string = 'Hello World';

  build() {
    // 使用 Column 而不是 Scroll 以更好地控制背景颜色
    Column() {
      // 第一部分：蓝色背景部分（全屏）
      Column() {
        // 头像部分
        Row({ space: 10 }) {
          Image($r('app.media.touxiang'))
            .width(80)
            .height(80)
            .borderRadius(12)

          Column() {
            Text('OMINI.BASS')
              .fontSize(20)
              .fontColor(Color.White)
            Text('18887688688')
              .fontSize(15)
              .fontColor(Color.White)
          }
          .margin({ left: 10, right: 20 })

          // 消息和设置
          Row() {
            Image($r('app.media.xiaoxiling'))
              .width(30)
              .height(30)
              .onClick(() => router.pushUrl({ url: 'pages/xiaoxi' }))

            Image($r('app.media.shezhi'))
              .width(30)
              .height(30)
              .margin({ left: 10 })
              .onClick(() => router.replaceUrl({ url: 'pages/Setting' }))
          }
          .width(100)
          .margin({right:5})
        }
        .width('100%')
        .padding(15)
        .margin({top:25})
        .backgroundColor('transparent')

        // 资产部分
        Row() {
          Column() {
            Text('总资产(币)')
              .fontSize(20)
              .fontColor(Color.White)
            Text('5000')
              .fontSize(24)
              .fontColor(Color.White)
          }
          .margin({ left: 50 })

          Column({ space: 5 }) {
            Button('提现')
              .fontColor('#000000')
              .backgroundColor('#FFFFFF')
              .height(35)
              .onClick(() => router.pushUrl({ url: 'pages/tixian' }))

            Button('收支明细')
              .fontColor('#000000')
              .backgroundColor('#FFFFFF')
              .height(35)
              .onClick(() => router.pushUrl({ url: 'pages/usemoney' }))
          }
          .margin({ right: 20 })
        }
        .width('100%')
        .margin({ top: 20 })
        .justifyContent(FlexAlign.SpaceBetween)

      }
      .backgroundColor('#2BCDDD') // 设置第一部分为蓝色
      .height('28%') // 调整高度根据需要


      // 第二部分：白色背景部分（带圆角顶部）
      Column() {
        // 回收订单标题（包含在白色背景中）
        Row() {
          Text('回收订单')
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
            .fontColor(Color.Black)
        }
        .width('100%')
        .padding({ left: 20, right: 20 })
        .margin({ top: 20 })

        // 回收订单按钮
        Row({ space: 15 }) {
          // 待接单
          Column({ space: 5 }) {
            Image($r('app.media.daijiedan1'))
              .width(34)
              .height(40)
            Button('待接单')
              .backgroundColor('#FFD7E0')
              .fontColor('#FF5E80')
              .height(35)
              .onClick(() => router.pushUrl({ url: 'pages/Recycle2' }))
          }

          // 已接单
          Column({ space: 5 }) {
            Image($r('app.media.yijiedan1'))
              .width(34)
              .height(40)
            Button('已接单')
              .backgroundColor('#FFD7E0')
              .fontColor('#FF5E80')
              .height(35)
              .onClick(() => router.pushUrl({ url: 'pages/Recycle2' }))
          }

          // 收货中
          Column({ space: 5 }) {
            Image($r('app.media.shouhuozhong1'))
              .width(34)
              .height(40)
            Button('收货中')
              .backgroundColor('#FFD7E0')
              .fontColor('#FF5E80')
              .height(35)
              .onClick(() => router.pushUrl({ url: 'pages/Recycle2' }))
          }

          // 已完成
          Column({ space: 5 }) {
            Image($r('app.media.yiwancheng2'))
              .width(34)
              .height(40)
            Button('已完成')
              .backgroundColor('#FFD7E0')
              .fontColor('#FF5E80')
              .height(35)
              .onClick(() => router.pushUrl({ url: 'pages/Recycle2' }))
          }
        }
        .width('95%')
        .padding(10)
        .margin({ top: 10 })

        // 兑换订单标题
        Row() {
          Text('兑换订单')
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
            .fontColor(Color.Black)
        }
        .width('100%')
        .padding({ left: 20, right: 20 })
        .margin({ top: 30 })

        // 兑换订单按钮
        Row({ space: 19 }) {
          // 待支付
          Column({ space: 5 }) {
            Image($r('app.media.daizhifu1'))
              .width(34)
              .height(40)
            Button('待支付')
              .backgroundColor('#FFD7E0')
              .fontColor('#FF5E80')
              .height(35)
          }

          // 待取货
          Column({ space: 5 }) {
            Image($r('app.media.daiquhuo1'))
              .width(34)
              .height(40)
            Button('待取货')
              .backgroundColor('#FFD7E0')
              .fontColor('#FF5E80')
              .height(35)
          }

          // 配送中
          Column({ space: 5 }) {
            Image($r('app.media.peisongzhong1'))
              .width(34)
              .height(40)
            Button('配送中')
              .backgroundColor('#FFD7E0')
              .fontColor('#FF5E80')
              .height(35)
          }

          // 已完成
          Column({ space: 5 }) {
            Image($r('app.media.yiwancheng2'))
              .width(34)
              .height(40)
            Button('已完成')
              .backgroundColor('#FFD7E0')
              .fontColor('#FF5E80')
              .height(35)
          }

          .margin({right:5})
        }
        .width('100%')
        .padding(10)
        .margin({ top: 10 })

        // 常用功能标题
        Row() {
          Text('常用功能')
            .fontWeight(FontWeight.Bold)
            .fontSize(20)
            .fontColor(Color.Black)
        }
        .width('100%')
        .padding({ left: 20, right: 20 })
        .margin({ top: 30 })

        // 常用功能按钮
        Row({ space: 15 }) {
          // 我的收藏
          Column({ space: 5 }) {
            Image($r('app.media.choucang1'))
              .width(40)
              .height(40)
            Button('我的收藏')
              .backgroundColor('#FFD7E0')
              .fontColor('#FF5E80')
              .height(35)
              .onClick(() => router.pushUrl({ url: 'pages/Shoucang' }))
          }

          // 足迹
          Column({ space: 5 }) {
            Image($r('app.media.zuji1'))
              .width(40)
              .height(40)
            Button('足迹')
              .backgroundColor('#FFD7E0')
              .fontColor('#FF5E80')
              .height(35)
              .onClick(() => router.pushUrl({ url: 'pages/wodezuji' }))
          }

          // 我的贡献
          Column({ space: 5 }) {
            Image($r('app.media.gongxizn1'))
              .width(40)
              .height(40)
            Button('我的贡献')
              .backgroundColor('#FFD7E0')
              .fontColor('#FF5E80')
              .height(35)
              .onClick(() => router.pushUrl({ url: 'pages/Contributions' }))
          }
        }
        .width('80%')
        .padding(10)
        .margin({ top: 10 })
        .justifyContent(FlexAlign.Start)
      }
      .backgroundColor(Color.White)
      .borderRadius({ topLeft: 30, topRight: 30 }) // 添加圆角
      .layoutWeight(1) // 占据剩余空间
    }
    .backgroundColor('#FFFFFF')
    .height('100%')
    .width('100%')
  }
}