import { router } from '@kit.ArkUI';
@Entry
@Component
struct Starter {
  @State message: string = 'Hello World';
  @State count:number = 3
  private taskId:number = 0

  aboutToAppear(): void {
    this.taskId = setInterval(()=>{
      this.count--
      if(this.count == 0){
        clearInterval(this.taskId)
        router.replaceUrl({url:'pages/start'})
      }
    },1000)
  }
  build() {
    Column(){

    }
    .width('100%')
    .backgroundImage($r('app.media.starter'))
    .backgroundImageSize(ImageSize.Cover)
    .height('100%')
    .width('100%')
  }
}