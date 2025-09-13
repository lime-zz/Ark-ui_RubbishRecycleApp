import { router } from '@kit.ArkUI';
@Entry
@Component
struct Start {
  @State message: string = 'Hello World';
  @State count: number = 6
  private taskId: number = 0

  aboutToAppear(): void {
    this.taskId = setInterval(() => {
      this.count--
      if (this.count == 0) {
        clearInterval(this.taskId)
        router.replaceUrl({ url: 'pages/Home' })
      }
    }, 1000)
  }

  //swiper:SwipwerControlIer =new SwiperController()

  build() {
    Column() {
      Stack({ alignContent: Alignment.TopEnd }) {
        Swiper() {
          Image($r('app.media.starta'))
          Image($r('app.media.startb'))
        }

        .width('100%')
        .height('100%')

        Row() {
          Text('跳过  ' + this.count)
            .padding(10)
            .borderRadius(25)
            .fontColor('#0bbbc7')
            .backgroundColor('#9fe9f2')
            .margin({top:35 })
            .onClick(() => {
              clearInterval(this.taskId)
              router.replaceUrl({ url: 'pages/Home' })
            })
        }
        .width('22%')
      }
    }
    .height('100%')
    .width('100%')
  }
}