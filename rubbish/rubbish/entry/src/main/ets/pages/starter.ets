/*
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Starter {
  @State message: string = 'Hello World';
  @State count:number=3

  aboutToApper():void{
    let id=setInterval(()=>{
      this.count--
      if(this.count==0){
       //1.取消定时器
        clearInterval(id)
        //2.跳转页面
       // router.pushUrl({url:'page/Index'})//会保留原有页面
        router.replaceUrl({url:'page/Index'})//会清除原有页面
      }
    },1000)
  }

  build() {
    Column() {
      Row(){
        Text('跳过  '+this.count)
          .padding(10)
          .borderRadius(15)
          .fontColor('#000000')
          .backgroundColor('#ffffff')
      }
      .width('100%')
      .justifyContent( FlexAlign.End)


    }
    .padding(10)
    .backgroundImage($r('app.media.start'))
    .backgroundImageSize(ImageSize.Cover)
    .width('100%')
    .height('100%')
  }
}
*/
import { router } from '@kit.ArkUI';

@Entry
@Component
struct Starter {
  @State message: string = 'Hello World';
  @State count:number = 3


  //当页面进来之后自动执行
  aboutToAppear(): void {
    //参数1：周期执行的函数  参数2：周期时长(单位毫秒)
    let id = setInterval(()=>{
      this.count--
      if(this.count == 0){
        //1、取消定时器
        clearInterval(id)
        //2、跳转到Index页面
        //router.pushUrl({url:'pages/Index'}) //会保留原有页面
        router.replaceUrl({url:'pages/Index'}) //会清除当前页面
      }
    },1000)
  }



  build() {
    Column() {
      Row(){
        Text('跳过   '+this.count)
          .padding(10)
          .borderRadius(25)
          .fontColor('#ffffff')
          .backgroundColor('#415162')
      }
      .width('100%')
      .justifyContent(FlexAlign.End)

    }
    .padding(10)
    .backgroundImage($r('app.media.start'))
    .backgroundImageSize(ImageSize.Cover)
    .height('100%')
    .width('100%')
  }
}
