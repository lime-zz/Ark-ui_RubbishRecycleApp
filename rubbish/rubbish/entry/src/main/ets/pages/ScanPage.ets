import router from '@ohos.router'

@Entry
@Component
export struct ScanPage {
  @State offsetY: number = 0
  @State isResultMode :boolean= false
  private animationDir: number = 1  // 控制移动方向

  aboutToAppear() {
    // 每 50ms 调整一次背景图位置，实现上下浮动
    setInterval(() => {
      if (this.offsetY >= 5) this.animationDir = -1
      if (this.offsetY <= -5) this.animationDir = 1
      this.offsetY += this.animationDir * 0.5
    }, 50)
  }

  build() {
    Stack() {
      // 背景图浮动效果
      Image($r('app.media.milk'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)
        .translate({ y: this.offsetY })

      Column() {
        Blank()
          .height(103)
          .backgroundColor('#80000000') // 上遮罩

        Row() {
          Blank()
            .width(64)
            .backgroundColor('#80000000') // 左遮罩

          Blank()
            .width(263)
            .height(398) // 中间扫描框透明

          Blank()
            .width(66)
            .backgroundColor('#80000000') // 右遮罩
        }

        // Blank()
        //   .height(4)
        //   .backgroundColor('#80000000') // 下遮罩
      }
      .width('100%')
      .height('100%')

      // 扫描框 + 提示文字
      Column() {
        this.ScanFrame()

        Column() {
          Text('将需要识别的物品置于扫描框中')
            .fontSize(18)
            .fontColor('#ffffff')
            .padding({ top: 20, bottom: 20 })  // 给文字上下内边距（等效原来的 margin 效果）
        }
        .width('100%')
        .backgroundColor('#80000000')  // 整个文字区域的背景半透明
        .alignItems(HorizontalAlign.Center)  // 文字居中

        Blank()
          .height(123)
          .backgroundColor('#80000000') // 下遮罩

      }
      .alignItems(HorizontalAlign.Center)
      .width('100%')

      // 左上角返回按钮
      Image($r('app.media.backwhite'))
        .width(40)
        .height(40)
        .borderRadius(16)
        .margin({ top: 20, left: 20 })
        .position({ x: 20, y: 20 })
        .onClick(() => {
          router.back()
        })

      //拍照按钮和白色背景
      Column() {
        Blank().layoutWeight(1)  // 上方空白部分
        // 拍照按钮
        // 拍照按钮
        if (!this.isResultMode) {
          Image($r('app.media.camera'))
            .width(64)
            .height(64)
            .margin({ bottom: 120 })
            .backgroundColor('#1ec6d7')
            .borderRadius(32)
            .onClick(() => {
              this.isResultMode = true
            })
        } else {
          // 使用 Row 容器包裹两个按钮，并添加间距
          Row({ space: 30 }) {
            // 重拍按钮
            Button('重拍')
              .width(80)
              .height(64)
              .fontSize(16)
              .fontColor(Color.White)
              .margin({ bottom: 120 })
              .backgroundColor('#f06292')
              .borderRadius(32)
              .onClick(() => {
                this.isResultMode = false  // 返回拍摄界面
              })

            // 上传按钮
            Button('上传')
              .width(80)
              .height(64)
              .fontSize(16)
              .fontColor(Color.White)
              .margin({ bottom: 120 })
              .backgroundColor('#ffca28')
              .borderRadius(32)
              .onClick(() => {
                router.push({ url: 'pages/Scanresult' })
              })
          }
          .justifyContent(FlexAlign.Center) // 居中显示
          .width('100%') // 占据整个宽度
        }


      }
      .height('30%')  // 底部白色区域高度
      .width('100%')
      .backgroundColor('#ffffff')  // 白色背景
      .borderRadius({ topLeft: 70, topRight: 70})
      .position({ y: '100%' })
      .translate({ y: -150 })  // 向上移动底部区域高度
      .zIndex(3)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#000000')

  }

  //扫描的白框
  @Builder
  private ScanFrame() {
    Column() {
      Blank()
        .width(265)
        .height(400)
        .borderRadius(50)
        .border({ width: 3, color: '#ffffff' })
        .borderRadius(6)


    }
  }
}