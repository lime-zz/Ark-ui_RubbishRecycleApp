import router from "@ohos.router"
import { autoFillManager } from "@kit.AbilityKit";

interface Type1{
  img:Resource
  contents:string
  value:string
}
@Entry
@Component
export struct store {
  //Swiper控制器
  swiperController: SwiperController = new SwiperController();
  //定义变量记录当前Swiper的下标
  @State currentIndex: number = 3;
  //定时器时间
  @State count:number = 48045;

  // 格式化时间为 HH:MM:SS
  formatTime(seconds: number): string {
    const hours = Math.floor(seconds / 3600); // 计算小时
    const minutes = Math.floor((seconds % 3600) / 60); // 计算分钟
    const remainingSeconds = seconds % 60; // 计算秒数

    // 使用 padStart 来保证两位数格式
    return `${hours.toString().padStart(2, '0')}:${minutes.toString().padStart(2, '0')}:${remainingSeconds.toString().padStart(2, '0')}`;
  }

  //当页面进来之后自动执行
  aboutToAppear(): void {
    //参数1：周期执行的函数  参数2：周期时长(单位毫秒)
    let id = setInterval(()=>{
      this.count--
      // 更新显示的时间
      const formattedTime = this.formatTime(this.count);
      console.log(formattedTime); // 这里你可以把这个输出更新到页面
      if(this.count == 0){
        //1、取消定时器
        clearInterval(id)
        //2、跳转到Index页面
        //router.pushUrl({url:'pages/Index'}) //会保留原有页面
        // router.replaceUrl({url:'pages/Index'}) //会清除当前页面
      }
    },1000)
  }

  //数据
  datas:Type1[] = [
    {img:$r('app.media.g1'),contents:'夏季必备简约桌面风扇',value:'250币'},
    {img:$r('app.media.g2'),contents:'北欧风格大表盘壁挂时钟',value:'120币'},
    {img:$r('app.media.g3'),contents:'摆拍神器玻璃水晶球摆件',value:'88币'},
    {img:$r('app.media.g1'),contents:'夏季必备简约桌面风扇',value:'250币'},
    {img:$r('app.media.g2'),contents:'北欧风格大表盘壁挂时钟',value:'120币'},
    {img:$r('app.media.g3'),contents:'摆拍神器玻璃水晶球摆件',value:'88币'},

  ]
  //UI
  @Builder
  hotItems(data:Type1){
    Column({ space: 5 }){
      Image(data.img)
        //.width(180)
        //.height(180)
        .width('100%')
        .height('auto')
        .borderRadius(12)
      Column({space:8}){
        Text(data.contents)
          .fontSize(15)
          .fontWeight(200)
          .width(165)
        Text(data.value)
          .fontSize(15)
          .width(165)
          .margin({bottom:10})
      }
      .backgroundColor('#FFFFFF')
    }
    .borderRadius(12)
    .width(170)
    //.height(240)
    .margin({left:5,right:5,bottom:15})
    .shadow({
      color:'#7E7E7E',
      offsetX:2, // 阴影偏移量
      offsetY:2,
      radius:10
    })
  }

  build() {

      Column({ space: 10 }) {
        /* 1. 标题 Row */
        Row({}) {
          Row().width(10);
          Text('兑换商城')
            .fontSize(25)
            .fontWeight(60)
            .fontColor($r('sys.color.white'))
          Blank(); //把图标顶到最右
          Image($r("app.media.img2_9"))
            .width(24)
            .height(24)
            .margin({right:20})
            .onClick(() => {
              router.pushUrl({ url: 'pages/fenlei' });
            })
            .zIndex(1) // 确保图标在最上层
          Image($r("app.media.img2_8"))
            .width(24)
            .height(24)
            .zIndex(1)
            .onClick(() => {
              router.pushUrl({ url: 'pages/Shangpingsousuoyoujieguo' })
            })        }
        .margin({top:20})
        .padding({
          top: 30,
          right: 10,
          bottom: 20,
          left: 10
        })
        .width('100%')
        .justifyContent(FlexAlign.Start);

        Scroll() {
          Column() {

            /* 2. Swiper */
            Swiper() {
              Image($r("app.media.a"));
              Image($r("app.media.b"));
            }
            .autoPlay(true)
            .width('95%')
            .height(130)
            .borderRadius(15)
            .margin({bottom:10})
            .onChange((index: number) => {
              this.currentIndex = index;
            });

            /* 3. 限时兑换区域 */
            Column() {
              Column({ space: 10 }) {
                Row({ space: 8 }) {
                  Image($r('app.media.img_88'))
                    .width(24)
                    .height(24)
                    .margin({left:0,right:5})
                  Text('限时兑换   ')
                    .fontSize(18)
                    .fontWeight(600)
                    .margin({right:20})
                  Text(this.formatTime(this.count))
                    .fontSize(15)
                    .fontWeight(60);

                  Blank();
                  Text('更多 >')
                    .fontSize(15)
                    .fontColor('#ffbfbbbb')
                    .margin({ right: 10 })
                    .onClick(() => {
                      router.pushUrl({ url: 'pages/TimeExchangePage' });
                    })

                }
                .width('100%')
                .justifyContent(FlexAlign.Start)

                //.margin(10)

                Scroll() {
                  Row({ space: 20 }) {
                    Column({ space: 10 }) {
                      //图标
                      Image($r('app.media.g1'))
                        .width(90)   //宽度
                        .height(90) //高度
                        .borderRadius(12)
                      //文字
                      Text('200币')
                        .fontSize(20)
                      //按钮
                      Text('250')

                        .fontColor('#7E7E7E')
                        .height(15)
                        .decoration({ type: TextDecorationType.LineThrough }) // ← 中划线

                    }

                    Column({ space: 8 }) {
                      //图标
                      Image($r('app.media.g2'))
                        .width(90)   //宽度
                        .height(90) //高度
                        .borderRadius(12)
                      //文字
                      Text('255币')
                        .fontSize(20)
                      Text('325')
                        .fontColor('#7E7E7E')
                        .height(15)
                        .decoration({ type: TextDecorationType.LineThrough }) // ← 中划线

                    }

                    Column({ space: 8 }) {
                      //图标
                      Image($r('app.media.g3'))
                        .width(90)   //宽度
                        .height(90) //高度
                        .borderRadius(12)
                      //文字
                      Text('100币')
                        .fontSize(20)
                      //按钮
                      Text('125')

                        .fontColor('#7E7E7E')
                        .height(15)
                        .decoration({ type: TextDecorationType.LineThrough }) // ← 中划线

                    }

                    Column({ space: 8 }) {
                      //图标
                      Image($r('app.media.g1'))
                        .width(90)   //宽度
                        .height(90) //高度
                        .borderRadius(12)
                      //文字
                      Text('200币')
                        .fontSize(20)
                      Text('250')

                        .fontColor('#7E7E7E')
                        .height(15)
                        .decoration({ type: TextDecorationType.LineThrough }) // ← 中划线

                    }
                  }
                  .width('100%')
                }
                .width('100%')
                .scrollable(ScrollDirection.Horizontal)
                //.vertical(false) // 设置为水平排列
                .scrollBar(BarState.Off)
              }
              .padding(10)
              .width('100%')

            }
            .backgroundColor('#FFFFFF')
            .margin({ top: 10 })

            Column({ space: 10 }) {
              Row({ space: 8 }) {
                Image($r('app.media.img_38'))
                  .width(24)
                  .height(24)
                  .margin({ left: 3, right: 5 })
                Text('近期热门')
                  .fontSize(18)
                  .fontWeight(600);
                Blank();

                Text('更多 >')
                  .fontSize(15)
                  .fontColor('#ffbfbbbb')
                  .margin(10)
              }
              .width('100%')
              .justifyContent(FlexAlign.Start);

                Scroll() { // 使用Scroll组件来包裹Row以实现滚动功能
                  Row({ space: 20 }) {
                    Column({ space: 8 }) {
                      //图标
                      Image($r('app.media.g1'))
                        .width(90)   //宽度
                        .height(90) //高度
                        .borderRadius(12)
                      //文字
                      Text('200币')
                        .fontSize(14)
                    }

                    Column({ space: 8 }) {
                      //图标
                      Image($r('app.media.g2'))
                        .width(90)   //宽度
                        .height(90) //高度
                        .borderRadius(12)
                      //文字
                      Text('255币')
                        .fontSize(14)
                    }

                    Column({ space: 8 }) {
                      //图标
                      Image($r('app.media.g3'))
                        .width(90)   //宽度
                        .height(90) //高度
                        .borderRadius(12)
                      //文字
                      Text('100币')
                        .fontSize(14)
                    }

                    Column({ space: 8 }) {
                      //图标
                      Image($r('app.media.g1'))
                        .width(90)   //宽度
                        .height(90) //高度
                        .borderRadius(12)
                      //文字
                      Text('200币')
                        .fontSize(14)
                    }
                  }

                  .width('100%')
                }
                .width('100%')
                .scrollable(ScrollDirection.Horizontal) // 设置水平滚动
                .scrollBar(BarState.Off) // 关闭滚动条显示
            }
            .padding(10)
            .backgroundColor('#FFFFFF')
            .margin({ top: 10 })


              //猜你喜欢
              Column({ space: 10 }) {
                //标题部分
                Row({ space: 10 }) {
                  Image($r('app.media.img_38'))
                    .width(24)
                    .height(24)
                    .margin({left:3,right:5})
                  Text('猜你喜欢')
                    .fontSize(18)   //字体大小
                    .fontWeight(600) //字体粗细（加粗）
                }
                .padding({top:5})
                .width('100%')
                .justifyContent(FlexAlign.Start);

                Column() {
                  //列表
                  //参数1：数组
                  Grid() {
                    ForEach(this.datas, (item: Type1) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr') // 两列等宽
                  .columnsGap(8) // 列间距
                  .rowsGap(8) // 行间距
                 // .padding(10)
                }

              }
              .padding(10)
              .backgroundColor('#FFFFFF')
              .margin({ top: 10 })

          }
        }.scrollBar(BarState.Off) // 关闭滚动条显示

      }
      .width('100%')
      .height('100%')
      .backgroundColor('#EBFCF9')
      .backgroundImage($r('app.media.bk'))
      .backgroundImageSize({ width: '100%', height: '25%' })

  }
}