import router from '@ohos.router'

interface Landmark {
  x: number, y: number
  name: string
  addr: string
  phone: string
  staff: string
  img: Resource
  type: 'recycle' | 'drop'
}

@Entry
@Component
export struct DaoHangPage {
  @State showRecyclePoints: boolean = false
  @State showDropPoints: boolean = false
  @State currentIndex: number = 1
  @State blinkingOpacity: number = 1
  @State showDialog: boolean = false
  @State selectedPoint: Landmark | null = null

  recyclePoints: Landmark[] = [
    { x:100, y:200, name:'OMINI回收站来福士广场店', addr:'上海市来福士广场1层32号',
      phone:'010‑6589253569', staff:'李先生', img:$r('app.media.shop1'), type:'recycle' },
    { x:30, y:30, name:'世纪公园回收点', addr:'上海市世纪公园东门',
      phone:'021-67890123', staff:'王女士', img:$r('app.media.shop1'), type:'recycle' },
    { x:40, y:600, name:'浦东机场回收站', addr:'浦东机场T2航站楼出发层',
      phone:'021-65432109', staff:'张先生', img:$r('app.media.shop1'), type:'recycle' },
    { x:280, y:400, name:'南京西路回收点', addr:'南京西路288号',
      phone:'021-62345678', staff:'陈小姐', img:$r('app.media.shop1'), type:'recycle' }
  ]

  dropPoints: Landmark[] = [
    { x:220, y:120, name:'陆家嘴自助投放点', addr:'陆家嘴环路100号',
      phone:'021-58881234', staff:'自助服务', img:$r('app.media.shop1'), type:'drop' },
    { x:67, y:346, name:'徐家汇自助投放点', addr:'徐家汇美罗城B1',
      phone:'021-64288899', staff:'自助服务', img:$r('app.media.shop1'), type:'drop' },
    { x:200, y:300, name:'静安寺自助投放点', addr:'南京西路1788号',
      phone:'021-62348877', staff:'自助服务', img:$r('app.media.shop1'), type:'drop' },
    { x:110, y:300, name:'人民广场自助投放点', addr:'人民大道221号',
      phone:'021-63782211', staff:'自助服务', img:$r('app.media.shop1'), type:'drop' }
  ]

  build() {
    // 取消注释以下内容，确保页面有UI显示
    Column() {
      // 直接显示地图内容，不需要Tabs
      this.MapMainContent()

      if (this.showDialog && this.selectedPoint !== null) {
        this.buildInfoDialog(this.selectedPoint)
      }
    }
    .height('100%')
    .width('100%')
  }

  // tabs 页的顶部组件
  @Builder
  myTabsBar(img: Resource, title: string, index: number) {
    Column({ space: 5 }) {
      if (index === 2 || index === 3) { // 扫描和商店图标特殊处理
        Image(img).width(24).height(24)
      } else {
        Image(img)
          .fillColor(this.currentIndex === index ? '#f68c95' : '#f68c75')
          .width(24)
          .height(24)
        Text(title).fontSize(14)
      }
    }
  }

  // 蓝点闪烁控制逻辑
  aboutToAppear() {
    setInterval(() => {
      this.blinkingOpacity = this.blinkingOpacity === 1 ? 0.3 : 1
    }, 1000)
  }

  @Builder
  MapMainContent() {
    Stack() {
      // 背景图
      Image($r('app.media.map'))
        .width('100%')
        .height('100%')

      // 中心蓝点，透明度变化实现闪烁
      Image($r('app.media.bluedot'))
        .width(20)
        .height(20)
        .opacity(this.blinkingOpacity)
        .align(Alignment.Center)

      // 回收点
      if (this.showRecyclePoints) {
        ForEach(this.recyclePoints, (point: Landmark) => {
          Image($r('app.media.recycledot'))
            .width(40).height(40)
            .position({ x: point.x, y: point.y })
            .onClick(() => {
              this.selectedPoint = point
              this.showDialog = true
            })
        })
      }

      // 投放点
      if (this.showDropPoints) {
        ForEach(this.dropPoints, (point: Landmark) => {
          Image($r('app.media.dropdot'))
            .width(40).height(40)
            .position({ x: point.x, y: point.y })
            .onClick(() => {
              this.selectedPoint = point
              this.showDialog = true
            })
        })
      }

      // 右下角按钮
      Column() {
        Button('上门回收')
          .fontColor('#292929')
          .backgroundColor('#ffffff')
          .onClick(() => {
            this.showRecyclePoints = !this.showRecyclePoints
          })

        Button('自助投放')
          .fontColor('#292929')
          .backgroundColor('#ffffff')
          .margin({ top: 8 })
          .onClick(() => {
            this.showDropPoints = !this.showDropPoints
          })
      }
      .position({ x: 260, y: 580 })
    }
    .width('100%')
    .height('100%')
  }

  @Builder
  buildInfoDialog(point: Landmark) {
    // 半透明背景（点击关闭）
    Rect()
      .width('100%')
      .height('100%')
      .fill(Color.Black)
      .opacity(0.4)
      .onClick(() => {
        this.showDialog = false
      })

    // 弹窗主体内容
    Column() {
      // 顶部标题
      Text(point.name)
        .fontSize(18)
        .fontWeight(FontWeight.Bold)
        .margin({ bottom: 16 })
        .width('100%')

      // 图片和详细信息
      Row() {
        Image(point.img)
          .width(100)
          .height(100)
          .objectFit(ImageFit.Cover)
          .borderRadius(8)

        Column() {
          Row() {
            Text(point.addr)
              .fontSize(14)
              .fontColor('#666')
          }
          .margin({ bottom: 12 })

          Row() {
            Text(point.phone)
              .fontSize(14)
          }
          .margin({ bottom: 12 })

          if (point.staff !== '自助服务') {
            Row() {
              Text('负责人: ' + point.staff)
                .fontSize(14)
            }
          }
        }
        .margin({ left: 16 })
        .layoutWeight(1)
      }
      Row({ space: 30 }) {
        Button('关闭')
          .width(70)
          .height(40)
          .fontSize(16)
          .margin({ top: 24 })
          .backgroundColor('#07C160')
          .onClick(() => {
            this.showDialog = false
          })

        Button('下单')
          .width(70)
          .height(40)
          .fontSize(16)
          .margin({ top: 24 })
          .backgroundColor('#07C160')
          .onClick(() => {
            router.push({ url: 'pages/OrderPage' })
          })

        Button('导航')
          .width(70)
          .height(40)
          .fontSize(16)
          .margin({ top: 24 })
          .backgroundColor('#07C160')
          .onClick(() => {
            router.push({ url: 'pages/YinLuPage' })
          })
      }
      .width('100%')
      .justifyContent(FlexAlign.Center) // 居中显示


    }
    .padding(24)
    .backgroundColor(Color.White)
    .borderRadius(16)
    .width('80%')
    .position({ x: '10%', y: '30%' })
  }
}