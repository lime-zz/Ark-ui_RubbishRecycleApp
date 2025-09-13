import router from '@ohos.router';
@Entry
@Component
struct Contributions {
  @State message: string = 'Hello World';

  build() {
    Column(){
      Stack() {
        Column() {
          //我的贡献背景
          Column() {
       //导航
            Row({space:2}){
              Image($r('app.media.return'))
                .width(30)
                .height(30)
                .margin({ right: 8 ,top:20})
              Text('我的贡献')
                .fontSize(30)
                .fontColor('#FFFFFF')
            }
            .width('100%')
            .height(56) // 导航栏高度
            .padding({ left: 16,top:40 }) // 左侧内边距
            .justifyContent(FlexAlign.Start) // 子组件左对齐
            .alignItems(VerticalAlign.Center); // 垂直居中
          }
          .backgroundColor('#2BCDDC')
          .borderRadius(30)
          .width('100%')
          .height('20%')
          //白色背景
          Column(){

          }
          .backgroundColor('#EBFCF9')
          .width('100%')
          .height('80%')

        }
        //悬浮
        Column({space:30}) {
          //图标
          Image($r('app.media.Contrbution'))
            .width(100)
            .height(100)

            Row({space:60}){
              Row(){
                Image($r('app.media.danhanglan'))
                  .width(20)
                  .height(10)
                Text('垃圾回收次数')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.Start)
              .flexGrow(1) // 占满剩余空间，实现两侧分布

              Row({space:5}){
                Text('12')
                  .fontColor('#FF6666')
                  .fontSize(20)
                Text('次')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.End) // 右侧数值右对齐
            }
            Row({space:60}){
              Row(){
                Image($r('app.media.danhanglan'))
                  .width(20)
                  .height(10)
                Text('自助回收次数')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.Start)
              .flexGrow(1)
              Row({space:5}){
                Text('10')
                  .fontColor('#FF6666')
                  .fontSize(20)
                Text('次')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.End)
            }
            Row({space:54}){
              Row(){
                Image($r('app.media.danhanglan'))
                  .width(20)
                  .height(10)
                Text('总回收重量')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.Start)
              .flexGrow(1)
              Row({space:5}){
                Text('256')
                  .fontColor('#FF6666')
                  .fontSize(20)
                Text('千克')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.End)
            }
            Row({space:54}){
              Row(){
                Image($r('app.media.danhanglan'))
                  .width(20)
                  .height(10)
                Text('减少碳排放')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.Start)
              .flexGrow(1)
              Row({space:5}){
                Text('200')
                  .fontColor('#FF6666')
                  .fontSize(20)
                Text('千克')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.End)
            }
            Row({space:50}){
              Row(){
                Image($r('app.media.danhanglan'))
                  .width(20)
                  .height(10)
                Text('保护森林')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.Start)
              .flexGrow(1)
              Row({space:5}){
                Text('2345')
                  .fontColor('#FF6666')
                  .fontSize(20)
                Text('平方米')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.End)
            }
            Row({space:50}){
              Row(){
                Image($r('app.media.danhanglan'))
                  .width(20)
                  .height(10)
                Text('减少污染')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.Start)
              .flexGrow(1)
              Row({space:5}){
                Text('9876')
                  .fontColor('#FF6666')
                  .fontSize(20)
                Text('平方米')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.End)
            }
            Row({space:80}){
              Row(){
                Image($r('app.media.danhanglan'))

                  .width(20)
                  .height(10)
                Text('保护水资源')
                  .fontSize(20)

              }
              .justifyContent(FlexAlign.Start)
              .flexGrow(1)
              Row({space:5}){
                Text('678')
                  .fontColor('#FF6666')
                  .fontSize(20)
                Text('吨')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.End)
            }
            Row({space:37}){
              Row(){
                Image($r('app.media.danhanglan'))
                  .width(20)
                  .height(10)
                Text('我的贡献')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.Start)
              .flexGrow(1)
              Row({space:5}){
                Text('超过')

                  .fontSize(20)
                Text('85%')
                  .fontColor('#FF6666')
                  .fontSize(20)
                Text('的人')
                  .fontSize(20)
              }
              .justifyContent(FlexAlign.End)
            }

        }

        .backgroundColor('#ffffff')
        .width('90%')
        .borderRadius(30)
        .padding(10)

      }

    }
    .height('100%')
    .width('100%')
    .height('100%')
    .width('100%')
  }
}