// SearchResultPage.ets
import router from '@ohos.router';
@Entry
@Component
struct MilkTeaPage {
  @State searchText: string = ''

  build() {
    Column() {
      // 顶部搜索栏
      Row() {
        Image($r('app.media.return'))
          .width(24)
          .height(24)
          .margin({ left: 12 })

        Search({ placeholder: '搜索',value: this.searchText })
          .onChange((value: string) => {
            this.searchText = value
          })
          .layoutWeight(1)
          .margin({ left: 8, right: 8 })
          .backgroundColor('#FEFEFE')

        Button('搜索')
          .fontSize(16)
          .margin({ right: 12 })

      }
      .width('100%')
      .height('10%')
      .backgroundColor('#2BCCDC')
      .alignItems(VerticalAlign.Center)


      // 主体内容
      Scroll() {
        Column({space:20}) {
          // 垃圾分类板块
          Text('垃圾分类')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ top: 16, left: 20, bottom: 8 })
            .width('100%')

          List() {
            ListItem() {
              Row() {
                Image($r('app.media.imgtu4'))
                  .width(60)
                  .height(60)
                  .borderRadius(8)
                  .margin({ right: 12 })

                Text('奶茶')
                  .fontSize(16)
                  .fontColor('#ff69b4')
              }
              .padding(12)
            }

            ListItem() {
              Row() {
                Image($r('app.media.imgtu4'))
                  .width(60)
                  .height(60)
                  .borderRadius(8)
                  .margin({ right: 12 })

                Text('珍珠奶茶')
                  .fontSize(16)
                  .fontColor('#ff69b4')
              }
              .padding(12)
            }

            ListItem() {
              Row() {
                Image($r('app.media.imgtu4'))
                  .width(60)
                  .height(60)
                  .borderRadius(8)
                  .margin({ right: 12 })

                Text('奶茶三兄弟')
                  .fontSize(16)
                  .fontColor('#ff69b4')
              }
              .padding(12)
            }
          }
          .width('100%')
          .divider({ strokeWidth: 1, color: '#f0f0f0' })
          .margin({ bottom: 16 })

          // 可兑换商品板块
          Text('可兑换商品')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 15, bottom: 8 })
            .width('100%')

          List() {
            ListItem() {
              Row() {
                Image($r('app.media.imgtu4'))
                  .width(60)
                  .height(60)
                  .borderRadius(8)
                  .margin({ right: 12 })

                Text('奶茶粉')
                  .fontSize(16)
                  .fontColor('#ff69b4')
              }
              .padding(12)
            }

            ListItem() {
              Row() {
                Image($r('app.media.imgtu4'))
                  .width(60)
                  .height(60)
                  .borderRadius(8)
                  .margin({ right: 12 })

                Text('奶茶杯')
                  .fontSize(16)
                  .fontColor('#ff69b4')
              }
              .padding(12)
            }
          }
          .width('100%')
          .divider({ strokeWidth: 1, color: '#f0f0f0' })
          .margin({ bottom: 16 })

          // 讨论板块
          Text('讨论')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 16, bottom: 8 })


          Text('奶茶究竟应该怎么扔?')
            .fontSize(16)
            .margin({ left: 16, bottom: 16 })
          Text('奶茶究竟应该怎么扔?')
            .fontSize(16)
            .margin({ left: 16, bottom: 16 })
          Text('奶茶究竟应该怎么扔?')
            .fontSize(16)
            .margin({ left: 16, bottom: 16 })
        }
      }
      .layoutWeight(1)
      .backgroundColor('#ffffff')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffffff')
  }
}