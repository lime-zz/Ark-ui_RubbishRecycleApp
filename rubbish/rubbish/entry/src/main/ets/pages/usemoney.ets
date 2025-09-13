
import { router } from '@kit.ArkUI';
interface IncomeItem {
  type: string;
  amount: string;
  date: string;
  place:string
  way:string
}

@Entry
@Component
struct Usemoney {
  @State message: string = 'Hello World';
  @State currentIndex: number = 0;


  @Builder
  myTabsBar(title: string, index: number) {
    Column({ space: 5 }) {
      Text(title)
        .fontColor(Color.White)
        .fontSize(this.currentIndex == index ? '20' : '16')
        .fontWeight(this.currentIndex == index ? FontWeight.Bold : FontWeight.Normal)
    }
    .padding(10)
  }

  build() {
    // 整个页面只有一个根节点
    Column() {
      // 顶部标题栏
      Row() {
        Image($r('app.media.return'))
          .width(24)
          .height(24)
          .onClick(() => {
            router.back()
          })
          .margin({ left: 12, top: 30 })

        Text('我的资产')
          .fontSize(25)
          .fontColor('#FFFFFF')
          .fontWeight(FontWeight.Bold)
          .margin({ left: 8, top: 30 })

        Blank()
      }
      .width('100%')
      .height(85)
      .padding({ left: 20, right: 20 })
      .backgroundColor('#2BCDDD')
      .justifyContent(FlexAlign.SpaceBetween)

      // Tab栏容器
      Row() {
        // 商城按钮 - 只显示文字
        Column() {
          this.myTabsBar('全部', 0)
        }
        .onClick(() => {
          this.currentIndex = 0;
        })
        .layoutWeight(1)

        // 添加按钮 - 只显示文字
        Column() {
          this.myTabsBar('收入', 1)
        }
        .onClick(() => {
          this.currentIndex = 1;
        })
        .layoutWeight(1)

        // 消息按钮 - 只显示文字
        Column() {
          this.myTabsBar('支出', 2)
        }
        .onClick(() => {
          this.currentIndex = 2;
        })
        .layoutWeight(1)

      }
      .width('100%')
      .backgroundColor('#2BCDDD')
        // 内容区域
        Column() {
          if (this.currentIndex === 0) {
            if (this.currentIndex === 0) {
              this.allView()
            }
          } else if (this.currentIndex === 1) {
            if (this.currentIndex === 1) {
              this.incomeView()
            }
          } else if (this.currentIndex === 2) {
            if (this.currentIndex === 2) {
              this.outcomeView()
            }
          }
        }
        .width('100%')
        .layoutWeight(1)
        .backgroundColor('#FFFFFF')
        .borderRadius(12)

    }
  }
  // 收入 tab 内容
  @Builder
  allView() {
    Column({ space: 10 }) {
      ForEach([
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '支', place:'创意卫浴五件套 欧式高档漱口杯',way:'商城兑换', date: '2025-07-01',amount: '-25.0币' },
        { type: '现', place:'人民广场自助回收机',way:'手机提现', date: '2025-07-01',amount: '-100.0币' },
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '支', place:'创意卫浴五件套 欧式高档漱口杯',way:'商城兑换', date: '2025-07-01',amount: '-25.0币' },
        { type: '现', place:'人民广场自助回收机',way:'手机提现', date: '2025-07-01',amount: '-100.0币' },
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '支', place:'创意卫浴五件套 欧式高档漱口杯',way:'商城兑换', date: '2025-07-01',amount: '-25.0币' },
        { type: '现', place:'人民广场自助回收机',way:'手机提现', date: '2025-07-01',amount: '-100.0币' }

      ], (item: IncomeItem, index:number) => {
        Row() {
          Text(item.type)
            .width(32)
            .height(32)
            .textAlign(TextAlign.Center)
            .fontSize(14)
            .fontColor(Color.White)
            .backgroundColor(
              item.type === '收' ? '#2BCDDD' :
                item.type === '支' ? '#FF6B6B' :
                  item.type === '现' ? '#FFD93D' :
                    '#CCCCCC'
            )

            .borderRadius(16)
            .margin({ left:18 ,right: 18,top:20,bottom:20 })


          Column({space:4}) {
            Text(item.place)
              .fontSize(13)
            Text(item.way)
              .fontSize(13)
            Text(item.date)
              .fontColor('#CFCCCC' )
              .fontSize(13)
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

          Column(){
            Text(item.amount)
              .fontColor(
                item.type === '收' ? '#2BCDDD' :
                  item.type === '支' ? '#FF6B6B' :
                    item.type === '现' ? '#FFD93D' :
                      '#CCCCCC'
              )
              .fontWeight(12)
              .margin({right:5})
          }
        }
        .margin({left:10,top:4,right:10,bottom:5})
        .backgroundColor('#F7F7F7')
        .borderRadius(8)


      })
    }
    .margin({ top: 20 })
  }


  // 收入 tab 内容
  @Builder
  incomeView() {
    Column({ space: 10 }) {
      ForEach([
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },
        { type: '收', place:'人民广场自助回收机',way:'自助回收', date: '2025-07-01',amount: '+400.0币' },

      ], (item: IncomeItem, index:number) => {
        Row() {
          Text(item.type)
            .width(32)
            .height(32)
            .textAlign(TextAlign.Center)
            .fontSize(14)
            .fontColor(Color.White)
            .backgroundColor(
              item.type === '收' ? '#2BCDDD' :
                item.type === '支' ? '#FF6B6B' :
                  item.type === '现' ? '#FFD93D' :
                    '#CCCCCC'
            )

            .borderRadius(16)
            .margin({ left:18 ,right: 18,top:20,bottom:20 })


          Column({space:4}) {
            Text(item.place)
              .fontSize(13)
            Text(item.way)
              .fontSize(13)
            Text(item.date)
              .fontColor('#CFCCCC' )
              .fontSize(13)
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

          Column(){
            Text(item.amount)
              .fontColor(
                item.type === '收' ? '#2BCDDD' :
                  item.type === '支' ? '#FF6B6B' :
                    item.type === '现' ? '#FFD93D' :
                      '#CCCCCC'
              )
              .fontWeight(12)
              .margin({right:5})
          }
        }
        .margin({left:10,top:4,right:10,bottom:5})
        .backgroundColor('#F7F7F7')
        .borderRadius(8)


      })
    }
    .margin({ top: 20 })
  }



  // 收入 tab 内容
  @Builder
  outcomeView() {
    Column({ space: 10 }) {
      ForEach([
        { type: '支', place:'创意卫浴五件套 欧式高档漱口杯',way:'商城兑换', date: '2025-07-01',amount: '-25.0币' },
        { type: '现', place:'人民广场自助回收机',way:'手机提现', date: '2025-07-01',amount: '-100.0币' },
        { type: '支', place:'创意卫浴五件套 欧式高档漱口杯',way:'商城兑换', date: '2025-07-01',amount: '-25.0币' },
        { type: '现', place:'人民广场自助回收机',way:'手机提现', date: '2025-07-01',amount: '-100.0币' },
        { type: '支', place:'创意卫浴五件套 欧式高档漱口杯',way:'商城兑换', date: '2025-07-01',amount: '-25.0币' },
        { type: '现', place:'人民广场自助回收机',way:'手机提现', date: '2025-07-01',amount: '-100.0币' } ,
        { type: '支', place:'创意卫浴五件套 欧式高档漱口杯',way:'商城兑换', date: '2025-07-01',amount: '-25.0币' },
        { type: '现', place:'人民广场自助回收机',way:'手机提现', date: '2025-07-01',amount: '-100.0币' },
        { type: '支', place:'创意卫浴五件套 欧式高档漱口杯',way:'商城兑换', date: '2025-07-01',amount: '-25.0币' },
        { type: '现', place:'人民广场自助回收机',way:'手机提现', date: '2025-07-01',amount: '-100.0币' },
        { type: '支', place:'创意卫浴五件套 欧式高档漱口杯',way:'商城兑换', date: '2025-07-01',amount: '-25.0币' },
        { type: '现', place:'人民广场自助回收机',way:'手机提现', date: '2025-07-01',amount: '-100.0币' }

      ], (item: IncomeItem, index:number) => {
        Row() {
          Text(item.type)
            .width(32)
            .height(32)
            .textAlign(TextAlign.Center)
            .fontSize(14)
            .fontColor(Color.White)
            .backgroundColor(
              item.type === '收' ? '#2BCDDD' :
                item.type === '支' ? '#FF6B6B' :
                  item.type === '现' ? '#FFD93D' :
                    '#CCCCCC'
            )

            .borderRadius(16)
            .margin({ left:18 ,right: 18,top:20,bottom:20 })


          Column({space:4}) {
            Text(item.place)
              .fontSize(13)
            Text(item.way)
              .fontSize(13)
            Text(item.date)
              .fontColor('#CFCCCC' )
              .fontSize(13)
          }
          .layoutWeight(1)
          .alignItems(HorizontalAlign.Start)

          Column(){
            Text(item.amount)
              .fontColor(
                item.type === '收' ? '#2BCDDD' :
                  item.type === '支' ? '#FF6B6B' :
                    item.type === '现' ? '#FFD93D' :
                      '#CCCCCC'
              )
              .fontWeight(12)
              .margin({right:5})
          }
        }
        .margin({left:10,top:4,right:10,bottom:5})
        .backgroundColor('#F7F7F7')
        .borderRadius(8)


      })
    }
    .margin({ top: 20 })
  }
}