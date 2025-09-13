import {router} from '@kit.ArkUI'
@Entry
@Component
struct Gerenxinxixiugai {
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
                router.pushUrl({ url: 'pages/Setting' })
              })
            Text('关于')
              .fontSize(25)
              .fontColor('#FFFFFF')
          }

        }
        .width('100%')
        .height(56) // 导航栏高度
        .padding({ left: 16,top:40 }) // 左侧内边距
        .justifyContent(FlexAlign.Start) // 子组件左对齐
        .alignItems(VerticalAlign.Center); // 垂直居中
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
         Text('关于OMINI')
           .fontSize(20)

          Text('OMINI，成立于2018年10月份的某一个工作日，在研究了许多的大佬的Axure作品后终于按捺不住自己躁动的双手，于是，就这么入了Axure原型制作的坑。')
            .fontSize(15)
            .fontColor('#CCCCCC')
            .margin(20)
          Text('OMINI，成立于2018年10月份的某一个工作日，在研究了许多的大佬的Axure作品后终于按捺不住自己躁动的双手，于是，就这么入了Axure原型制作的坑。')
            .fontSize(15)
            .fontColor('#CCCCCC')
            .margin(20)
          Text('OMINI，成立于2018年10月份的某一个工作日，在研究了许多的大佬的Axure作品后终于按捺不住自己躁动的双手，于是，就这么入了Axure原型制作的坑。')
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