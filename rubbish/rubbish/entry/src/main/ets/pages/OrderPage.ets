import { router } from '@kit.ArkUI'

@Entry
@Component
struct OrderPage {
  @State selectedTime: string = '选择上门时间'

  build() {
    Column({ space: 10 }) {
      // 标题栏
      Row() {
        Image($r('app.media.return'))
          .width(24).height(24)
          .onClick(() => {
            router.back()
          })

        Text('门店预约')
          .fontSize(20)
          .fontColor('#FFFFFF')
          .fontWeight(FontWeight.Bold)
          .margin({ left: 12 })
      }
      .width('100%')
      .height(60)
      .padding({ left: 16, right: 16 })
      .backgroundColor('#2BCDDD')
      .justifyContent(FlexAlign.Start)


      // 页面背景
      Column({ space: 10 }) {
        // 门店详情卡片
        Column() {
          Row() {
            Text('门店详情')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .padding({ left: 8, right: 16 ,bottom:10})
          .justifyContent(FlexAlign.Start)

          Row() {
            // 门店图片
            Image($r('app.media.shop1'))
              .width(80)
              .height(80)
              .borderRadius(8)

            // 文字信息区域
            Column({ space: 6 }) {
              // 店名 + 距离 + 时间
              Row({ space: 6 }) {
                Text('OMINI来福士广场店')
                  .fontWeight(FontWeight.Medium)
                Text('| 0.8km | 10分钟')
                  .fontSize(12)
                  .fontColor('#666666')
              }

              // 地址
              Text('上海市来福士广场1层32号')
                .fontSize(12)
                .fontColor('#666666')

              // 标签
              Row({ space: 8 }) {
                Text('新店')
                  .fontSize(10)
                  .padding({ left: 6, right: 6, top: 2, bottom: 2 })
                  .backgroundColor('#FF5E81')
                  .borderRadius(4)
                  .fontColor(Color.White)

                Text('营业中')
                  .fontSize(10)
                  .padding({ left: 6, right: 6, top: 2, bottom: 2 })
                  .backgroundColor('#FF5E81')
                  .borderRadius(4)
                  .fontColor(Color.White)
              }
            }
            .margin({ left: 12 })
          }
        }
        .padding(16)
        .backgroundColor(Color.White)
        .borderRadius(12)

        // 订单详情表单
        Column({ space: 12 }) {
          Row() {
            Text('订单详情')
              .fontSize(16)
              .fontWeight(FontWeight.Bold)
          }
          .width('100%')
          .padding({ left: 8, right: 16 ,bottom:10})
          .justifyContent(FlexAlign.Start)

          this.formItem('详细地址:', '小区、门牌号')
          this.formItem('联系人:', '请输入真实姓名')
          this.formItem('联系电话:', '请输入11位手机号码')
          this.formItem('上门时间:', '选择上门时间')
          this.formItem('回收内容（非必填）:', '如纸箱、塑料瓶等')
          this.formItem('预计重量（非必填）:', '')
          this.formItem('备注（非必填）:', '')
        }
        .padding(16)
        .backgroundColor(Color.White)
        .borderRadius(12)
      }
      .padding(16)
      .backgroundColor('#ECFDFA')
      .layoutWeight(1)

      // 底部操作栏
      Row({ space: 16 }) {
        // 电话按钮
        Image($r('app.media.pinkphone'))
          .width(40).height(40)
          .borderRadius(20)
          .onClick(() => {
            // 拨打电话逻辑
          })

        // 聊天按钮
        // Button('立即预约')
        //   .width('100%')
        //   .backgroundColor('#2BCDDD')
        //   .fontColor(Color.White)
        //   .height(40)
        //   .borderRadius(8)
        //   .onClick(() => {
        //     // 提交表单逻辑
        //   })

        // 立即预约按钮
        Button('立即预约')
          .width('100%')
          .backgroundColor('#2BCDDD')
          .fontColor(Color.White)
          .height(40)
          .borderRadius(8)
          .onClick(() => router.pushUrl({ url: 'pages/pickover' }));
      }
      .padding({ left: 16, right: 16, top: 12, bottom: 24 })
      .backgroundColor(Color.White)
    }
    .height('100%')
  }

  // 表单项构建函数
  @Builder
  private formItem(label: string, placeholder: string) {
    Row() {
      // 标签文字
      Text(label)
        .fontSize(14)
        .fontColor('#333')
        .width(80)
        .alignSelf(ItemAlign.Center)

      // 输入框
      TextInput({ placeholder: placeholder })
        .backgroundColor('#F2F2F2')
        .borderRadius(6)
        .padding(10)
        .layoutWeight(1)  //占满剩余空间
    }
    .width('100%')
  }



}
