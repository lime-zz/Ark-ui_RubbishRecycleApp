import { router } from '@kit.ArkUI';

@Entry
@Component
export struct Home {
  @State message: string = 'Hello World';

  build() {
    // 添加 Scroll 组件包裹整个页面
    Scroll() {
      Column({ space: 15 }) {
        //标题
        Column() {
          // 标题行
          Row() {
            // 左侧文本
            Text('星期一')
              .fontSize(30)
              .fontWeight(600)
              .fontColor('#ffffff')
              .layoutWeight(1) // 关键：使用权重占据剩余空间
              .textAlign(TextAlign.Start) // 文本左对齐
              .margin({ top: 50 })

            // 右侧图标
            Image($r("app.media.img2_9"))
              .width(24)
              .height(24)
              .margin({top: 50,right:20})
              .onClick(() => router.pushUrl({ url: 'pages/homeclassify' }))
            Image($r("app.media.sousuo"))
              .width(40)
              .margin({ top: 50 })
              .onClick(() => router.pushUrl({ url: 'pages/Search' }))
          }
          .justifyContent(FlexAlign.SpaceBetween) // 关键：两端对齐
          .width('100%') // 关键：确保Row宽度为100%

          // 垃圾回收时间模块 - 位于星期一下方
          Column() {
            Text('干垃圾              晚上湿垃圾')
              .fontSize(16)
              .fontColor('#ffffff')
            Text('7:30-8:30          19:00-20:00')
              .fontSize(14)
              .fontColor('#ffffff')
          }
          .width('90%')
          .margin({ top: 15, bottom: 15 })
          .padding(13)
          .backgroundColor('#79dfea')
          .borderRadius(8)
        }
        .width('100%')
        .backgroundColor('#2bd7dd')
        .padding({ left: 15, right: 15 })


        //轮播图片
        Swiper() {
          Image($r("app.media.a"))
          Image($r("app.media.b"))
        }
        .zIndex(1)
        .autoPlay(true)
        .width('90%')
        .height(120)
        .borderRadius(15)

        //四个指示图标
        Row() {
          Column() {
            Image($r("app.media.c"))
              .width(40)
              .height(40)
            Text('投放日历')
              .onClick(() => {
                router.pushUrl({ url: 'pages/toufangrili' })
              })
          }
          Column() {
            Image($r("app.media.d"))
              .width(40)
              .height(40)
            Text('上门回收')
              .onClick(() => router.pushUrl({ url: 'pages/OrderPage' }))
          }
          Column() {
            Image($r("app.media.e"))
              .width(40)
              .height(40)
            Text('垃圾识别')
              .onClick(() => router.pushUrl({ url: 'pages/ScanPage' }))
          }
          Column() {
            Image($r("app.media.f"))
              .width(40)
              .height(40)
            Text('每日签到')
              .onClick(() => router.pushUrl({ url: 'pages/SignIn' }))
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)

        //限时兑换
        Column() {
          Row() {
            Text('限时兑换')
              .fontSize(18)
              .margin({ left: 15 })
              .onClick(() => {
                router.pushUrl({ url: 'pages/TimeExchangePage' })
              })
            Text('更多')
              .fontSize(12)
              .fontColor('#ffbfbbbb')
              .onClick(() => {
                router.push({ url: 'pages/TimeExchangePage' })
              })
          }
          .width('95%')
          .justifyContent(FlexAlign.SpaceBetween)
          .onClick(() => {
            router.push({ url: 'pages/TimeExchangedPage' })
          })
        }

        //兑换详情
        Scroll() {
          Row({ space: 5 }) {
            Column() {
              Image($r("app.media.aa"))
                .height(80)
              Text('200币')
            }
            Column() {
              Image($r("app.media.bb"))
                .height(80)
              Text('250币')
            }
            Column() {
              Image($r("app.media.cc"))
                .height(80)
              Text('220币')
            }
            Column() {
              Image($r("app.media.aa"))
                .height(80)
              Text('200币')
            }
            Column() {
              Image($r("app.media.bb"))
                .height(80)
              Text('250币')
            }
          }
        }
        .width('100%')
        .scrollable(ScrollDirection.Horizontal)
        .scrollBar(BarState.Off)

        //热门讨论
        Column() {
          Row() {
            Text('热门讨论')
              .fontSize(18)
              .margin({ left: 15 })
            Text('更多')
              .fontSize(12)
              .fontColor('#ffbfbbbb')
          }
          .width('95%')
          .justifyContent(FlexAlign.SpaceBetween)
          .onClick(() => {
            router.pushUrl({ url: 'pages/taolun2' })
          })
        }

        //讨论部分
        Scroll() {
          Column({ space: 15 }) {
            // 置顶帖
            Column({ space: 8 }) {
              Row() {
                Text('置顶')
                  .fontSize(12)
                  .fontColor('#ffffff')
                  .backgroundColor('#f95050')
                  .padding({ left: 6, right: 6, top: 2, bottom: 2 })
                  .borderRadius(4)
                Text('  关于近期服务器故障的说明')
                  .fontSize(16)
                  .fontWeight(500)
              }
              .width('100%')
              Text('由于近期服务器波动，导致部分用户自助投放时获取的积分数据出现误差，针对该情况我司紧急调整了服务器配置及相......')
                .fontSize(14)
                .lineHeight(22)
                .maxLines(2)
                .fontColor('#999999')
              Row() {
                Row() {
                  Image($r("app.media.111"))
                    .width(16)
                    .height(16)
                  Text(' 25684')
                    .fontSize(12)
                }
                Text('2019-7-25')
                  .fontSize(12)
                  .fontColor('#999999')
                  .margin({ left: 'auto' })
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .padding(10)
            .backgroundColor('#ffffff')
            .borderRadius(6)
            //点击事件更改处
            .onClick(() => {
              router.pushUrl({
                url: 'pages/zhifu', // 替换帖子
                params: {
                  title: '关于近期服务器故障的说明' // 传递帖子标题等参数，详情页可接收
                }
              });
            })

            // 奶茶帖
            Column({ space: 8 }) {
              Row() {
                Text('奶茶究竟应该怎么扔？')
                  .fontSize(16)
                  .fontWeight(500)
                Text('求助')
                  .fontSize(12)
                  .fontColor('#ffffff')
                  .backgroundColor('#f9c850')
                  .padding({ left: 6, right: 6, top: 2, bottom: 2 })
                  .borderRadius(4)
                  .margin({ left: 5 })
              }
              .width('100%')
              Row() {
                Text('RT，一杯珍珠奶茶有珍珠有杯子有奶茶还有吸管，应该怎么分类才对？')
                  .fontSize(14)
                  .lineHeight(22)
                  .maxLines(3)
                  .width('70%')
                  .fontColor('#999999')
                Image($r("app.media.naicha"))
                  .width(100)
                  .height(100)
                  .borderRadius(4)
                  .margin({ left: 10 })
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
              Row() {
                Row() {
                  Image($r("app.media.111"))
                    .width(16)
                    .height(16)
                  Text(' 25684')
                    .fontSize(12)
                }
                Text('2019-7-25')
                  .fontSize(12)
                  .fontColor('#999999')
                  .margin({ left: 'auto' })
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .padding(10)
            .backgroundColor('#ffffff')
            .borderRadius(6)
            // 奶茶帖点击跳转
            .onClick(() => {
              router.pushUrl({
                url: 'pages/start',
                params: {
                  title: '奶茶究竟应该怎么扔？'
                }
              });
            })

            // 吐槽帖
            Column({ space: 8 }) {
              Row() {
                Text('有没有人吐槽最近的垃圾分类？')
                  .fontSize(16)
                  .fontWeight(500)
                Text('吐槽')
                  .fontSize(12)
                  .fontColor('#ffffff')
                  .backgroundColor('#ff7b7b')
                  .padding({ left: 6, right: 6, top: 2, bottom: 2 })
                  .borderRadius(4)
                  .margin({ left: 5 })
              }
              .width('100%')
              Text('感觉最近整个人都不好了...')
                .fontSize(14)
                .lineHeight(22)
                .maxLines(1)
                .fontColor('#999999')
                .width('100%')
              Row() {
                Row() {
                  Image($r("app.media.111"))
                    .width(16)
                    .height(16)
                  Text(' 25684')
                    .fontSize(12)
                }
                Text('2019-7-25')
                  .fontSize(12)
                  .fontColor('#999999')
                  .margin({ left: 'auto' })
              }
              .width('100%')
              .justifyContent(FlexAlign.SpaceBetween)
            }
            .padding(10)
            .backgroundColor('#ffffff')
            .borderRadius(6)
            // 吐槽帖点击跳转
            .onClick(() => {
              router.pushUrl({
                url: 'pages/sousuo',
                params: {
                  title: '有没有人吐槽最近的垃圾分类？'
                }
              });
            })
          }
        }
        .width('100%')
        .height('auto')
        .scrollBar(BarState.Off)

        //导航栏
        Row().layoutWeight(1)
        Row({ space: 10 }) {
          Column() {
            Image($r("app.media.c"))
              .width(40)
              .height(40)
          }
          Column() {
            Image($r("app.media.d"))
              .width(40)
              .height(40)
          }
          Column() {
            Image($r("app.media.e"))
              .width(40)
              .height(40)
          }
          Column() {
            Image($r("app.media.f"))
              .width(40)
              .height(40)
          }
          Column() {
            Image($r("app.media.f"))
              .width(40)
              .height(40)
          }
        }
        .width('100%')
        .justifyContent(FlexAlign.SpaceAround)
      }
      .width('100%')
      .backgroundColor(Color.White)
    }
    .scrollable(ScrollDirection.Vertical) // 关键：设置垂直滚动
    .scrollBar(BarState.Auto) // 显示滚动条
    .width('100%')
    .height('100%')
  }
}