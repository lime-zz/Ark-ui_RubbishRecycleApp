import router from "@ohos.router";

@Entry
@Component
struct Homefenlei {
  @State message: string = 'Hello World';
  @State currentIndex: number = 0;
  private controller: TabsController = new TabsController()


  // 自定义导航页签的样式
  @Builder
  TabBuilder(title: string, targetIndex: number) {
    Column({ space: 10 }) {
      Row() {
        // 标签图片
        Image(this.currentIndex === targetIndex ? $r('app.media.img_38') : $r('app.media.img_88'))
          .width(10)
          .height(40)
        //.margin({left:0, right: 10 })
        Text(title)
          .fontSize(this.currentIndex === targetIndex? 22 : 20) // 根据currentIndex动态改变字体大小
          .fontColor(this.currentIndex === targetIndex ? '#FF5E81' : '#8a8a8a')
        // .fontSize(20)
      }
      .width('100%')
      //.height(50)
      .margin({top:10})
      .onClick(() => {
        this.currentIndex = targetIndex
        this.controller.changeIndex(this.currentIndex)
      })
     // Blank();
    }
    .height('50%')



  }

  build() {
    Column() {
      Row() {
        Image($r("app.media.backwhite"))
          .width(24)
          .height(24)
          .zIndex(1) // 确保图标在最上层
          .margin({ right: 10 })
          .onClick(() => {
            router.back();
          })
        Text('分类')
          .fontSize(30)
          .fontWeight(600)
          .fontColor($r('sys.color.white'))
      }
      .padding({
        top: 5,
        right: 10,
        bottom: 10,
        left: 10
      })
      .width('100%')
      .height('15%')
      .backgroundColor('#2BD7DD')
      .justifyContent(FlexAlign.Start);

      Tabs({
        barPosition: BarPosition.Start,
        controller: this.controller
      }) {
        TabContent() {
          Scroll(){
           Column() {
             // 内容项
             Column() {
               Row() {
                 Image($r('app.media.img_88'))
                   .width(24)
                   .height(24)
                   .margin({left:0,right:5})

                 Text('可回收垃圾')
                   .fontSize(20)
                   .fontWeight(600)
                   .width('100%')
                 //.padding(8)
               }
               .margin({ top: 15})
               .justifyContent(FlexAlign.Start)
               .width('100%')
               Text('可回收物就是可以再生循环的垃圾。本身或' +
                 '材质可再利用的纸类、硬纸板、玻璃、塑料、金属、塑' +
                 '料包装，与这些材质有关的' +
                 '如：报纸、杂志、广告单及其它干净的纸类' +
                 '等皆可回收。')
                 .fontSize(15)
                 .fontWeight(60)
                 //.fontWeight(FontWeight.Bold) // 使用 FontWeight 枚举值
                 .margin({ top: 15, bottom: 15 }) // 添加上下外边距，使文本与其他元素之间有适当间距
                 .padding({ left: 10, right: 10 }) // 添加左右内边距，使文本在容器内有适当间距


             }
             .width('90%')
             .backgroundColor('#FFFFFF')
             .margin({top:10,left:10,right:10,bottom:10})
             .borderRadius(12)

             Column(){
               Row() {
                 Image($r('app.media.img_88'))
                   .width(24)
                   .height(24)
                   .margin({left:0,right:5})

                 Text('废纸')
                   .fontSize(20)
                   .fontWeight(600)
                 //.padding(8)

               }.justifyContent(FlexAlign.Start)
               .width('100%') // 确保Row组件占据100%宽度
               .margin({ top: 15,bottom:15})

               Column({space:30}) {
                 Text('报纸')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('杂志')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('图书')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('各种包装纸')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('办公用纸')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('纸盒')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
               }
               .margin({bottom:20})
             }
             .justifyContent(FlexAlign.Start)
             .width('90%')
             //.height('50%')
             .backgroundColor('#FFFFFF')
             .borderRadius(12)
             .margin({bottom:10})

             Column(){
               Row() {
                 Image($r('app.media.img_88'))
                   .width(24)
                   .height(24)
                   .margin({left:0,right:5})

                 Text('塑料')
                   .fontSize(20)
                   .fontWeight(600)

               }.justifyContent(FlexAlign.Start)
               .width('100%') // 确保Row组件占据100%宽度
               .margin({ top: 15,bottom:15})

               Column({space:20}) {
                 Text('塑料袋')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('塑料包装物')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('次性塑料餐盒')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
               }
               .margin({bottom:20})
             }
             .justifyContent(FlexAlign.Start)
             .width('90%')
             //.height('50%')
             .backgroundColor('#FFFFFF')
             .borderRadius(12)
             .margin({bottom:10})

             Column(){
               Row() {
                 Image($r('app.media.img_88'))
                   .width(24)
                   .height(24)
                   .margin({left:0,right:5})

                 Text('玻璃')
                   .fontSize(20)
                   .fontWeight(600)

               }.justifyContent(FlexAlign.Start)
               .width('100%') // 确保Row组件占据100%宽度
               .margin({ top: 15,bottom:15})

               Column({space:20}) {
                 Text('玻璃容器')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('无色玻璃')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('绿色玻璃')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('棕色玻璃')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
               }
               .margin({bottom:20})
             }
             .justifyContent(FlexAlign.Start)
             .width('90%')
            // .height('50%')
             .backgroundColor('#FFFFFF')
             .borderRadius(12)
             .margin({bottom:10})

             Column(){
               Row() {
                 Image($r('app.media.img_88'))
                   .width(24)
                   .height(24)
                   .margin({left:0,right:5})

                 Text('废纸')
                   .fontSize(20)
                   .fontWeight(600)
                 //.padding(8)

               }.justifyContent(FlexAlign.Start)
               .width('100%') // 确保Row组件占据100%宽度
               .margin({ top: 15,bottom:15})

               Column({space:30}) {
                 Text('报纸')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('杂志')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('图书')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('各种包装纸')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('办公用纸')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('纸盒')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
               }
               .margin({bottom:20})
             }
             .justifyContent(FlexAlign.Start)
             .width('90%')
             //.height('50%')
             .backgroundColor('#FFFFFF')
             .borderRadius(12)
             .margin({bottom:10})

             Column(){
               Row() {
                 Image($r('app.media.img_88'))
                   .width(24)
                   .height(24)
                   .margin({left:0,right:5})

                 Text('塑料')
                   .fontSize(20)
                   .fontWeight(600)

               }.justifyContent(FlexAlign.Start)
               .width('100%') // 确保Row组件占据100%宽度
               .margin({ top: 15,bottom:15})

               Column({space:30}) {
                 Text('塑料袋')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('塑料包装物')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('次性塑料餐盒')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
               }
               .margin({bottom:20})
             }
             .justifyContent(FlexAlign.Start)
             .width('90%')
            // .height('50%')
             .backgroundColor('#FFFFFF')
             .borderRadius(12)
             .margin({bottom:10})

             Column(){
               Row() {
                 Image($r('app.media.img_88'))
                   .width(24)
                   .height(24)
                   .margin({left:0,right:5})

                 Text('玻璃')
                   .fontSize(20)
                   .fontWeight(600)

               }.justifyContent(FlexAlign.Start)
               .width('100%') // 确保Row组件占据100%宽度
               .margin({ top: 15,bottom:15})

               Column({space:30}) {
                 Text('玻璃容器')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('无色玻璃')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('绿色玻璃')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
                 Text('棕色玻璃')
                   .fontSize(20)
                   .fontWeight(30)
                   .margin({left:20})
                   .width('100%')
                   .textAlign(TextAlign.Start)
               }
               .margin({bottom:20})
             }
             .justifyContent(FlexAlign.Start)
             .width('90%')
            // .height('50%')
             .backgroundColor('#FFFFFF')
             .borderRadius(12)
             .margin({bottom:10})



           }//.size({ width: '100%', height: '100%' })
          }
          .scrollBar(BarState.Off)
        }.tabBar(this.TabBuilder('可回收物', 0))

        TabContent() {
          Column() {
            // 标题栏
            Column() {
              Row() {
                Image($r('app.media.img_38'))
                  .width(24)
                  .height(24)
                  .margin({ left: 3, right: 5 })

                Text('湿垃圾')
                  .fontSize(20)
                  .fontWeight(600)
                  .width('100%')
                //.padding(8)
              }
              .margin({ top: 15})
              .justifyContent(FlexAlign.Start)
              .width('100%')
              Text('包括剩菜剩饭、骨头、菜根菜叶、果皮等食' +
                '品类废物。经生物技术就地处理堆肥，每吨' +
                '可生产0.6~0.7吨有机肥料。')
                .fontSize(15)
                .fontWeight(60)
                //.fontWeight(FontWeight.Bold) // 使用 FontWeight 枚举值
                .margin({ top: 15, bottom: 15 }) // 添加上下外边距，使文本与其他元素之间有适当间距
                .padding({ left: 10, right: 10 }) // 添加左右内边距，使文本在容器内有适当间距


            }
            .width('90%')
            .backgroundColor('#FFFFFF')
            .margin({top:10,left:10,right:10,bottom:10})
            .borderRadius(12)

            Scroll() {
              Column() {
              Column({ space: 30 }) {
                Text('剩菜剩饭')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('面包')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('蛋糕饼干')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('果核')
                  .fontSize(20)
                 // .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('动物内脏')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('鸡肉')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('干果仁')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('剩菜剩饭')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('面包')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('蛋糕饼干')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('果核')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('动物内脏')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('鸡肉')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('干果仁')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('剩菜剩饭')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('面包')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('蛋糕饼干')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('果核')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('动物内脏')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('鸡肉')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
                Text('干果仁')
                  .fontSize(20)
                  .fontWeight(30)
                  .margin({ left: 20 })
                  .width('100%')
                  .textAlign(TextAlign.Start)
              }
              .margin({top:20, bottom: 20 })
            }.justifyContent(FlexAlign.Start)
              .width('90%')
              // .height('50%')
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin({bottom:10})


            }.scrollBar(BarState.Off)
            .borderRadius(12)

          }//.size({ width: '100%', height: '100%' })

        }.tabBar(this.TabBuilder('湿垃圾', 1))

        TabContent() {
          Column() {
            // 标题栏
            Column() {
              Row() {
                Image($r('app.media.img_38'))
                  .width(24)
                  .height(24)
                  .margin({ left: 3, right: 5 })

                Text('干垃圾')
                  .fontSize(20)
                  .fontWeight(600)
                  .width('100%')
                //.padding(8)
              }
              .margin({ top: 15})
              .justifyContent(FlexAlign.Start)
              .width('100%')
              Text('干垃圾即其它垃圾，指除可回收物、有害垃' +
                '圾、厨余垃圾（湿垃圾）以外的其它生活废弃物。')
                .fontSize(15)
                .fontWeight(60)
                //.fontWeight(FontWeight.Bold) // 使用 FontWeight 枚举值
                .margin({ top: 15, bottom: 15 }) // 添加上下外边距，使文本与其他元素之间有适当间距
                .padding({ left: 10, right: 10 }) // 添加左右内边距，使文本在容器内有适当间距


            }
            .width('90%')
            .backgroundColor('#FFFFFF')
            .margin({top:10,left:10,right:10,bottom:10})
            .borderRadius(12)

            Scroll() {
              Column() {
                Column({ space: 30 }) {
                  Text('餐巾纸')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('卫生间用纸')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('尿不湿')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('猫砂')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('狗尿垫')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('污损纸张')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('餐巾纸')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('卫生间用纸')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('尿不湿')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('猫砂')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('狗尿垫')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('污损纸张')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('餐巾纸')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('卫生间用纸')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('尿不湿')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('猫砂')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('狗尿垫')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('污损纸张')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('餐巾纸')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('卫生间用纸')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('尿不湿')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('猫砂')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('狗尿垫')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('污损纸张')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({ left: 20 })
                    .width('100%')
                    .textAlign(TextAlign.Start)
                }
                .margin({top:20, bottom: 20 })
              }.justifyContent(FlexAlign.Start)
              .width('90%')
              // .height('50%')
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin({bottom:10})


            }.scrollBar(BarState.Off)
            .borderRadius(12)

          }//.size({ width: '100%', height: '100%' })

        }.tabBar(this.TabBuilder('干垃圾', 2))

        TabContent() {
          Scroll(){
            Column() {
              // 内容项
              Column() {
                Row() {
                  Image($r('app.media.img_38'))
                    .width(24)
                    .height(24)
                    .margin({ left: 3, right: 5 })

                  Text('有害垃圾')
                    .fontSize(20)
                    .fontWeight(600)
                    .width('100%')
                  //.padding(8)
                }
                .margin({ top: 15})
                .justifyContent(FlexAlign.Start)
                .width('100%')
                Text('有害垃圾指废电池、废灯管、废药品、废油' +
                  '漆及其容器等对人体健康或者自然环境造成' +
                  '直接或者潜在危害的生活废弃物。')
                  .fontSize(15)
                  .fontWeight(60)
                  //.fontWeight(FontWeight.Bold) // 使用 FontWeight 枚举值
                  .margin({ top: 15, bottom: 15 }) // 添加上下外边距，使文本与其他元素之间有适当间距
                  .padding({ left: 10, right: 10 }) // 添加左右内边距，使文本在容器内有适当间距

              }
              .width('90%')
              .backgroundColor('#FFFFFF')
              .margin({top:10,left:10,right:10,bottom:10})
              .borderRadius(12)

              Column(){
                Row() {
                  Image($r('app.media.img_88'))
                    .width(24)
                    .height(24)
                    .margin({left:0,right:5})

                  Text('电池')
                    .fontSize(20)
                    .fontWeight(600)
                  //.padding(8)

                }.justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度
                .margin({ top: 15,bottom:15})

                Column({space:30}) {
                  Text('充电电池')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('镉镍电池')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('铅酸电池')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('蓄电池')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('纽扣电池')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                }
                .margin({bottom:20})
              }
              .justifyContent(FlexAlign.Start)
              .width('90%')
              //.height('50%')
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin({bottom:10})

              Column(){
                Row() {
                  Image($r('app.media.img_88'))
                    .width(24)
                    .height(24)
                    .margin({left:0,right:5})

                  Text('灯管')
                    .fontSize(20)
                    .fontWeight(600)

                }.justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度
                .margin({ top: 15,bottom:15})

                Column({space:30}) {
                  Text('荧光（日光）灯管')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('卤素灯')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                }
                .margin({bottom:20})
              }
              .justifyContent(FlexAlign.Start)
              .width('90%')
              //.height('50%')
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin({bottom:10})

              Column(){
                Row() {
                  Image($r('app.media.img_88'))
                    .width(24)
                    .height(24)
                    .margin({left:0,right:5})

                  Text('废药品')
                    .fontSize(20)
                    .fontWeight(600)

                }.justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度
                .margin({ top: 15,bottom:15})

                Column({space:30}) {
                  Text('过期药物')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('药物胶囊')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('药片')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('药品内包装')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                }
                .margin({bottom:20})
              }
              .justifyContent(FlexAlign.Start)
              .width('90%')
              // .height('50%')
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin({bottom:10})

              Column(){
                Row() {
                  Image($r('app.media.img_88'))
                    .width(24)
                    .height(24)
                    .margin({left:0,right:5})

                  Text('电池')
                    .fontSize(20)
                    .fontWeight(600)
                  //.padding(8)

                }.justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度
                .margin({ top: 15,bottom:15})

                Column({space:30}) {
                  Text('充电电池')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('镉镍电池')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('铅酸电池')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('蓄电池')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('纽扣电池')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                }
                .margin({bottom:20})
              }
              .justifyContent(FlexAlign.Start)
              .width('90%')
              //.height('50%')
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin({bottom:10})

              Column(){
                Row() {
                  Image($r('app.media.img_88'))
                    .width(24)
                    .height(24)
                    .margin({left:0,right:5})

                  Text('灯管')
                    .fontSize(20)
                    .fontWeight(600)

                }.justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度
                .margin({ top: 15,bottom:15})

                Column({space:30}) {
                  Text('荧光（日光）灯管')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('卤素灯')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                }
                .margin({bottom:20})
              }
              .justifyContent(FlexAlign.Start)
              .width('90%')
              //.height('50%')
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin({bottom:10})

              Column(){
                Row() {
                  Image($r('app.media.img_88'))
                    .width(24)
                    .height(24)
                    .margin({left:0,right:5})

                  Text('废药品')
                    .fontSize(20)
                    .fontWeight(600)

                }.justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度
                .margin({ top: 15,bottom:15})

                Column({space:30}) {
                  Text('过期药物')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('药物胶囊')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('药片')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                  Text('药品内包装')
                    .fontSize(20)
                    .fontWeight(30)
                    .margin({left:20})
                    .width('100%')
                    .textAlign(TextAlign.Start)
                }
                .margin({bottom:20})
              }
              .justifyContent(FlexAlign.Start)
              .width('90%')
              // .height('50%')
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin({bottom:10})



            }//.size({ width: '100%', height: '100%' })
          }
          .scrollBar(BarState.Off)

        }.tabBar(this.TabBuilder('有害垃圾', 3))


      }
      .scrollable(false) // 禁止滑动切换
      .vertical(true)
      .barWidth(100)
      .layoutWeight(1)
      .barBackgroundColor('#FFFFFF')
      .borderRadius(15)


    }
    .width('100%')
    .height('100%')
    .backgroundColor('#EAE9E5')
  }
}