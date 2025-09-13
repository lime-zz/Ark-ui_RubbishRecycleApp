
@Entry
@Component
struct OrderTrackingPage {
  @State showCancelDialog: boolean = false; // 取消订单弹窗控制

  build() {
    Stack() {
      // 地图背景层
      Column() {
        Image($r('app.media.map')) // 替换为实际地图背景图资源
          .width('100%')
          .height('100%')
          .objectFit(ImageFit.Cover)
      }
      .width('100%')
      .height('100%')

      // 主内容层 - 整体垂直排列
      Column() {
        // 信息卡片区域
        Column() {
          // 顶部距离与基础信息
          Row() {
            Column() {
              Text('距离 342 米')
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')
                .margin({ bottom: 8 })

              Text('已用时00:12:650')
                .fontSize(16)
                .fontColor('#666666')
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.Start)

            Column() {
              Text('赵师傅')
                .fontSize(20)
                .fontWeight(FontWeight.Bold)
                .fontColor('#333333')
                .margin({ bottom: 8 })

              Text('13255486659')
                .fontSize(16)
                .fontColor('#666666')
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.End)
          }
          .width('100%')
          .padding({ bottom: 16 })

          // 分隔线
          Divider()
            .strokeWidth(1)
            .color('#EEEEEE')
            .margin({ bottom: 16 })

          // 服务标签与完成单数
          Row() {
            // 左侧标签
            Row() {
              Text('诚信')
                .fontSize(14)
                .padding({ top: 4, bottom: 4, left: 10, right: 10 })
                .backgroundColor('#E6F7FF')
                .borderRadius(16)
                .fontColor('#1890FF')
                .margin({ right: 8 })

              Text('服务好')
                .fontSize(14)
                .padding({ top: 4, bottom: 4, left: 10, right: 10 })
                .backgroundColor('#E6F7FF')
                .borderRadius(16)
                .fontColor('#1890FF')
            }
            .layoutWeight(1)
            //   .alignItems(HorizontalAlign.Start)

            // 右侧完成单数与评分
            Column() {
              Text('已完成 3256 单')
                .fontSize(14)
                .fontColor('#999999')
                .margin({ bottom: 4 })

              Row() {
                Text('4.8')
                  .fontSize(14)
                  .fontColor('#FA8C16')
                  .margin({ right: 4 })

                Image($r('app.media.yellowstar')) // 替换为实际星级图标
                  .width(16)
                  .height(16)
              }
            }
            .layoutWeight(1)
            .alignItems(HorizontalAlign.End)
          }
          .width('100%')
          .padding({ bottom: 16 })

          // 状态提示文本

        }
        .width('90%')
        .padding(20)
        .backgroundColor(Color.White)
        .borderRadius(16)
        .margin({ top: 550 })
        .shadow({ radius: 12, color: '#10000000', offsetX: 0, offsetY: 4 })
        Column()
        {
          Text('回收小哥正在赶来的路上，请保持电话畅通哦~')
            .fontSize(16)
            .fontColor('#999999')
            .textAlign(TextAlign.Center)
            .width('100%')
        }
        .width('90%')
        .height('5%')
        .borderRadius(10)
        .backgroundColor('#ffffff')
        .margin({top:10})
        // 底部操作栏
        Row({space:20}) {
          // 电话按钮
          Column() {
            Image($r('app.media.pinkphone')) // 替换为实际电话图标
              .width(24)
              .height(24)
            // .margin({ bottom: 4 })

            Text('电话')
              .fontSize(12)
              .fontColor('#333333')
          }
          //  .layoutWeight(1)
          .padding(4)
          .width(70)
          .height('100%')
          //   .alignItems(HorizontalAlign.Center)
          .onClick(() => {
            // 可扩展拨打电话逻辑
          })

          // 消息按钮
          Column() {
            Image($r('app.media.xiaoxi')) // 替换为实际消息图标
              .width(24)
              .height(24)
            //     .margin({ bottom: 4 })

            Text('消息')
              .fontSize(12)
              .fontColor('#333333')
          }
          //  .layoutWeight(1)
          //  .alignItems(HorizontalAlign.Center)
          .padding({top:10})
          .height('100%')
          .width(70)
          .onClick(() => {
            // 可扩展消息逻辑
          })

          // 取消订单按钮
          Button('取消订单')
            .width(210)
            .height('100%')

            .fontSize(16)
            .fontColor('#FFFFFF')
            .backgroundColor('#2BCDDD')
            //  .layoutWeight(1)
            .onClick(() => {
              this.showCancelDialog = true;
            })
        }
        .width('100%')
        .height('10%')
        .layoutWeight(1)
        .margin({ top: 10 })
        .backgroundColor('#FFFFFF')
        .shadow({ radius: 12, color: '#10000000', offsetX: 0, offsetY: 4 })
      }
      .width('100%')
      .height('100%')
      .alignItems(HorizontalAlign.Center)

      // 取消订单弹窗层
      if (this.showCancelDialog) {
        Stack() {
          // 半透明遮罩
          Rect()
            .width('100%')
            .height('100%')
            .fill(Color.Black)
            .opacity(0.5)
            .onClick(() => {
              this.showCancelDialog = false;
            })

          // 弹窗内容
          Column() {
            Text('确定取消订单吗？')
              .fontSize(18)
              .fontWeight(FontWeight.Bold)
              .fontColor('#333333')
              .margin({ bottom: 20 })

            Row() {
              Button('再想想')
                .width(100)
                .height(36)
                .fontSize(16)
                .fontColor('#333333')
                .backgroundColor('#F5F5F5')
                .borderRadius(18)
                .margin({ right: 20 })
                .onClick(() => {
                  this.showCancelDialog = false;
                })

              Button('确定取消')
                .width(100)
                .height(36)
                .fontSize(16)
                .fontColor('#FFFFFF')
                .backgroundColor('#FF4D4F')
                .borderRadius(18)
                .onClick(() => {
                  this.showCancelDialog = false;
                  // router.back(); // 取消后返回上一页
                })
            }
          }
          .width('80%')
          .height(160)
          .backgroundColor('#FFFFFF')
          .borderRadius(16)
          .alignItems(HorizontalAlign.Center)
          .justifyContent(FlexAlign.Center)
          .position({ x: '10%', y: '40%' })
        }
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F5F5F5')
  }
}