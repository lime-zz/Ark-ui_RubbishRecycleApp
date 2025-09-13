import { router } from '@kit.ArkUI';
@Entry
@Component
export  struct Cuowufankui {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Stack({alignContent:Alignment.TopEnd}) {
        Column() {
          Column({ space: 15 }) {
            Text('< 错误反馈')
              .fontSize(23)
              .fontColor('#ffffff')
              .fontWeight(FontWeight.Bold)
              .margin({ top: 35 })
              .width('98%')
            Image($r("app.media.tou"))
              .width(200)
          }
          .padding(15)
          .backgroundColor('#2bcddd')
          .width('100%')
          .borderRadius(30)

          Column({ space: 30 }) {
            Row({ space: 20 }) {
              Text('识别结果')
                .fontWeight(FontWeight.Bold)
              Text('珍珠奶茶')
                .fontColor('#908790')
            }
            .width('100%')

            Row() {
              Text('垃圾名称')
                .fontWeight(FontWeight.Bold)

              TextInput({ placeholder: '点击输入垃圾名称' })
                .width('100%')
                .fontColor('#908790')
                .type(InputType.Normal)
                .backgroundColor('#ffffff')
            }

            Row() {
              Text('垃圾类型')
                .fontWeight(FontWeight.Bold)

              TextInput({ placeholder: '点击输入垃圾类型' })
                .width('100%')
                .fontColor('#908790')
                .type(InputType.Normal)
                .backgroundColor('#ffffff')
            }


          }
          .width('90%')
          .margin({ top: 80 })

        }
        .backgroundColor('#ffffff')
        .width('100%')
        .height('20%')
        .borderRadius(30)

        Row() {
          Image($r("app.media.naicha"))
            .width(120)
            .height(120)
            .borderRadius(25)
            .margin({ top: 60 })
        }
        .padding(40)
      }
      Button('提交反馈')
        .margin({ top: 450 })
        .width(300)
        .fontColor('#ffffff')
        .backgroundColor('#2bcddd')
  }
  }
}