
import { router } from '@kit.ArkUI';

@Entry
@Component

struct Start1 {
  @State message: string = 'Hello World';
  @State currentIndex: number = 0
  @State count: number = 5
  private taskID: number = 0
  swiper: SwiperController = new SwiperController()

  aboutToApper(): void {
    this.taskID = setInterval(() => {
      if (this.currentIndex == 0) {
        //1.取消定时器
        clearInterval(this.taskID)
        //2.跳转页面
        // router.pushUrl({url:'page/Index'})//会保留原有页面
        router.replaceUrl({ url: 'page/Index' }) //会清除原有页面
      }

    }, 1000)
  }

  build() {
  }
}
/*
 build() {
    Stack(alignCotent:Alignment.TopStart){
      Swiper(this.swiper){
       // Image($r('app.media.'))
        //Image($r('app.media.'))
        //Image($r('app.media.'))
      }
      .autoPlay(true)
      .width('100%')
      .height('100%')
      .loop(false)
      .duration(500)//
      .interval(1000)//周期时间

    }


    Row() {
      Text('跳过  3')
        .padding(20)
        .borderRadius(15)
        .fontColor('#ffffff')
        .backgroundColor('#ffffff')
        .margin({top:30})
        .onClick(())


    }
    .width('100%')
    .justifyContent( FlexAlign.End)
  }
}
 */
