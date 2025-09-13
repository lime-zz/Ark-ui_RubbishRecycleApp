import {router} from '@kit.ArkUI'
@Entry
@Component
export struct Settingzerenshengming {
  @State message: string = 'Hello World';

  build() {
    Column(){
      //导航栏
      //设置背景
      Column({space:9}) {
        //导航
        Row({space:130}){
          //导航
          Row(){
            Image($r('app.media.return'))
              .width(25)
              .height(25)
              .margin({ right: 8 ,top:6})
              .onClick(() => {
                router.replaceUrl({ url: 'pages/Setting' });
              })
            Text('责任声明')
              .fontSize(25)
              .fontColor('#FFFFFF')
          }


        }
        .width('100%')
        .height(56) // 导航栏高度
        .padding({ left: 16,top:40 }) // 左侧内边距
        .justifyContent(FlexAlign.Start) // 子组件左对齐

      }
      .backgroundColor('#2BCDDC')
      .width('100%')
      .height('10%')

      //白色背景部分

      Column({space:10}){
        Column({space:20}){
          Column(){

          }
          .height(20)
         Row(){
           Text('责任声明')
             .fontSize(20)
         }

         .justifyContent(FlexAlign.Start)

          Text('此原型为OMINI.BASS（商铺链接：https://www.axureshop.com/shop/6824）原创设计，原型设计中所使用的的资源来自于网络搜索，如有侵权请联系本人删除')
            .fontSize(15)
            .fontColor('#CCCCCC')
            .margin(20)
          Text('部分资源来源:')
            .fontSize(18)
            .fontColor('#CCCCCC')
            .margin({left:10})
          Text('插画资源：unDraw（https://undraw.co）\n' +
            '\n' +
            '图标资源：iconfont（https://www.iconfont.cn）\n' +
            '\n' +
            '图片资源：Pexels（https://www.pexels.com）\n' +
            '\n')
            .fontSize(15)
            .fontColor('#CCCCCC')
            .margin(20)

        }
        .margin(20)
        .width('88%')
        .height('90%')
        .backgroundColor('#ffffff')


      }
      .backgroundColor('#EBFCF9')
      .width('100%')
      .height('90%')
      .borderRadius(10)
    }
    .height('100%')
    .width('100%')
  }
}