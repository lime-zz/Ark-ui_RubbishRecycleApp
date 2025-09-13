import router from '@ohos.router'

@Entry
@Component
struct MapDetailPage {
  @State offsetY: number = 0

  build() {
    Stack() {
      // 地图背景图
      Image($r('app.media.img_8'))
        .width('100%')
        .height('100%')
        .objectFit(ImageFit.Cover)

      // 返回按钮
      Image($r('app.media.back'))
        .width(32).height(32)
        .position({ x: 16, y: 40 })
        .onClick(() => router.back())

      // 蓝色定位点
      Image($r('app.media.bluedot'))
        .width(30).height(30)
        .position({ x: 95, y: 310 })

      // 终点图标
      Image($r('app.media.recycledot'))
        .width(36).height(36)
        .position({ x: 305, y: 150 })

      // 路线轨迹图
      Image($r('app.media.rout_path'))
        .width(230)
        .height(150)
        .position({ x: 100, y: 180 })



      // 底部弹窗卡片
      Column() {
        Row() {
          // 左侧图片
          Image($r('app.media.img_9'))
            .width(80).height(60)
            .borderRadius(8)
            .margin({ right: 12 })

          // 右侧内容区域
          Column({ space: 4 }) {
            // 标题行
            Row({ space: 4 }) {
              Image($r('app.media.recycle_box')) // 图标
                .width(16).height(16)

              Text('OMINI人民广场自助投放点')
                .fontSize(16)
                .fontWeight(FontWeight.Bold)
            }

            // 地址
            Text('上海市人民广场北侧')
              .fontSize(14)
              .fontColor('#666666')

            // 距离 + 剩余容量
            Row({ space: 10 }) {
              Text('剩余').fontSize(14)
              Text('400m')
                .fontSize(14)
                .fontColor(Color.Red)
                .fontWeight(FontWeight.Bold)

              Text('剩余空间').fontSize(14)
              Text('4m³/64m³')
                .fontSize(14)
                .fontColor(Color.Red)
                .fontWeight(FontWeight.Bold)
            }
          }
        }
      }
      .padding(12)
      .backgroundColor(Color.White)
      .borderRadius(16)
      .shadow({ radius: 8, color: 'rgba(0,0,0,0.15)', offsetX: 0, offsetY: 4 })
      .position({ x: 16, y: 600 }) // 模拟底部卡片定位（可以按设备高度调整）
    }
    .width('100%')
    .height('100%')
  }
}
