import promptAction from '@ohos.promptAction';
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Zhenzhunaicha {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Stack({alignContent:Alignment.TopEnd}) {
        Column() {
          Column({ space: 15 }) {
            Row(){
              Text('< 珍珠奶茶')
                .fontSize(23)
                .fontColor('#ffffff')
                .fontWeight(FontWeight.Bold)
                .margin({ top: 35 })
                .width('98%')


            }
            .width('96%')
            .justifyContent(FlexAlign.SpaceBetween)

            Image($r("app.media.tou"))
              .width(200)
          }
          .padding(15)
          .backgroundColor('#2bcddd')
          .width('100%')
          .borderRadius(30)


          Column({ space: 25 }) {
            Row(){
              Image($r("app.media.shu"))
                .width(22)
              Text('珍珠')
                .fontWeight(FontWeight.Bold)
                .width('100%')
            }
            Text('湿垃圾')
              .fontColor('#908790')
              .width('90%')

            Row(){
              Image($r("app.media.shu"))
                .width(22)
              Text('塑料杯')
                .width('100%')
                .fontWeight(FontWeight.Bold)
            }

            Text( '干垃圾' )
              .width('90%')
              .fontColor('#908790')
              .backgroundColor('#ffffff')
            Row(){
              Image($r("app.media.shu"))
                .width(22)
              Text('吸管')
                .width('100%')
                .fontWeight(FontWeight.Bold)
            }

            Text('干垃圾' )
              .width('90%')
              .fontColor('#908790')
              .backgroundColor('#ffffff')
            Row(){
              Image($r("app.media.shu"))
                .width(22)
              Text('指导意见')
                .width('100%')
                .fontWeight(FontWeight.Bold)
            }

            Text('1.先将剩余奶茶倒入下水口' +
              '   2.将珍珠、水果等残渣倒入湿垃圾' +
              '   3.将杯子、吸管丢入干垃圾' )
              .width('90%')
              .fontColor('#908790')
              .backgroundColor('#ffffff')

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
        .padding(30)
      }
      Button('识别有误')
        .margin({ top: 490 })
        .width(300)
        .fontColor('#ffffff')
        .backgroundColor('#2bcddd')
        .onClick(() => router.pushUrl({ url: 'pages/cuowufankui' }));
    }
  }
}
