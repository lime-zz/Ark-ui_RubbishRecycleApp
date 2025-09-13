/*
import router from "@ohos.router";

interface Type1 {
  img: Resource;
  value: string;
  img1:Resource;
}

@Entry
@Component
 struct Fenlei {
  @State message: string = 'Hello World';
  @State currentIndex: number = 0;
  //定义变量表示是否正在下拉刷新
  @State isRefresh:boolean = false;
  //定义变量表示是否正在上拉加载
  @State isLoading:boolean = false;

  private controller: TabsController = new TabsController()
  datas: Type1[] = [
    { img: $r('app.media.g1'), value: '250币',img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'), value: '120币',img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'), value: '88币',img1:$r('app.media.img_15') },
    { img: $r('app.media.g1'), value: '250币',img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'), value: '120币',img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'), value: '88币',img1:$r('app.media.img_15') },
  ];
  datas1: Type1[] = [
    { img: $r('app.media.g1'), value: '250币',img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'), value: '120币',img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'), value: '88币',img1:$r('app.media.img_15') },
    { img: $r('app.media.g1'), value: '250币',img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'), value: '120币',img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'), value: '88币',img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'), value: '120币',img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'), value: '88币',img1:$r('app.media.img_15') }

  ];

  datas2: Type1[] = [
    { img: $r("app.media.img_3"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_4"), value: '255币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_5"), value: '100币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_6"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_7"), value: '255币',img1:$r('app.media.img_15') },
   // { img: $r('app.media.img_8'), value: '88币',img1:$r('app.media.img_15') },
  ];

  datas2_2: Type1[] = [
    { img: $r("app.media.img22_1"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_2"), value: '255币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_3"), value: '100币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_4"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_5"), value: '255币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_6"), value: '100币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_7"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_8"), value: '255币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_9"), value: '520币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_10"), value: '100币',img1:$r('app.media.img_15') },
  ];

  datas3: Type1[] = [
    { img: $r("app.media.img_25"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_9"), value: '255币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_26"), value: '100币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_27"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_28"), value: '255币',img1:$r('app.media.img_15') },
  // { img: $r('app.media.img_8'), value: '88币',img1:$r('app.media.img_15') },
  ];

  datas3_2: Type1[] = [
    { img: $r("app.media.img_29"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_30"), value: '255币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_31"), value: '100币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_32"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_33"), value: '255币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_34"), value: '100币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_35"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_32"), value: '255币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_36"), value: '520币',img1:$r('app.media.img_15') },
    //{ img: $r("app.media.img22_10"), value: '100币',img1:$r('app.media.img_15') },
  ];

  datas4: Type1[] = [
    { img: $r("app.media.img_39"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_40"), value: '255币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_41"), value: '100币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_42"), value: '200币',img1:$r('app.media.img_15') },
    //{ img: $r("app.media.img_28"), value: '255币',img1:$r('app.media.img_15') },
  // { img: $r('app.media.img_8'), value: '88币',img1:$r('app.media.img_15') },
  ];

  datas4_2: Type1[] = [
    { img: $r("app.media.img_43"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_44"), value: '255币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_45"), value: '100币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_46"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_43"), value: '255币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_44"), value: '100币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_45"), value: '200币',img1:$r('app.media.img_15') },
    { img: $r("app.media.img_46"), value: '255币',img1:$r('app.media.img_15') },
    //{ img: $r("app.media.img_36"), value: '520币',img1:$r('app.media.img_15') },
  //{ img: $r("app.media.img22_10"), value: '100币',img1:$r('app.media.img_15') },
  ];
  //UI
  @Builder
  hotItems(item: Type1) {
    Column({ space: 5 }) {
      Image(item.img)
        .width(80)
        .height(80)
        .borderRadius(12)
        .onClick(() => {
          router.pushUrl({ url: 'pages/shangpinxiangqing' });
        })
      Row({ space: 5 }) {
        Text(item.value)
          .fontSize(16)
          .fontColor('#000000')
        Image(item.img1)
          .width(20)
          .height(20)
      }
    }
  }

  // 自定义导航页签的样式
  @Builder TabBuilder(title: string, targetIndex: number) {
    Column({space:10}) {
      Row() {
        // 标签图片
        Image(this.currentIndex === targetIndex ? $r('app.media.img_8') : $r('app.media.img_37'))
          .width(10)
          .height(40)
          //.margin({left:0, right: 10 })
        Text(title)
          .fontSize(this.currentIndex ===targetIndex ? 22 : 20) // 根据currentIndex动态改变字体大小
          .fontColor(this.currentIndex === targetIndex ? '#FF5E81' : '#8a8a8a')
        // .fontSize(20)
      }
      .width('100%')
      .height(50)
      .justifyContent(FlexAlign.Start)
      .onClick(() => {
        this.currentIndex = targetIndex
        this.controller.changeIndex(this.currentIndex)
      })
    }
  }

  build() {
    Column() {
      Row() {
        Image($r("app.media.img2_10"))
          .width(12)
          .height(24)
          .zIndex(1) // 确保图标在最上层
          .margin({ right: 10 })
          .onClick(() => {
            router.back();
          })
        Text('分类')
          .fontSize(25)
          .fontWeight(600)
          .fontColor($r('sys.color.white'))
        Blank();
        Image($r('app.media.img_14'))
          .width(24)
          .height(24)
          .margin({right:10})
          .onClick(() => {
            router.pushUrl({ url: 'pages/gouwuche' });
          })
          .zIndex(1) // 确保图标在最上层
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
                  Image($r('app.media.img_8'))
                    .width(12)
                    .height(24)
                    .margin({left:12,right:20})
                    .borderRadius(12)

                  Text('家居')
                    .fontSize(15)
                    .fontWeight(600)
                    //.padding(8)
                }.justifyContent(FlexAlign.Start)
                 .margin({top:5})
                 .width('100%') // 确保Row组件占据100%宽度

                Column() {
                  Grid() {
                    ForEach(this.datas, (item: Type1) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  //.height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .margin({top:10,left:10,right:10,bottom:8})
              .borderRadius(12)

              Column() {
                Row() {
                  Image($r('app.media.img_8'))
                    .width(24)
                    .height(24)
                    .margin({ left: 2, right: 3 })

                  Text('饰品')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度

                Column({ space: 10 }) {
                  Grid() {
                    ForEach(this.datas1, (item: Type1) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  // .height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin(10)

              Text('更多商品持续更新中...')
                .fontSize(15)
                .fontWeight(600)
                .fontColor('#E0E0E0')
                .height(60)
                .width('93%')
                .textAlign(TextAlign.Center)
                .backgroundColor('#FFFFFF')
                .borderRadius(12)
                .margin(10)


            }//.size({ width: '100%', height: '100%' })
            }
            .scrollBar(BarState.Off)
            }.tabBar(this.TabBuilder('家居饰品', 0))


          TabContent() {
            Scroll(){
              Column() {
                // 内容项
                Column() {
                  Row() {
                    Image($r('app.media.img_8'))
                      .width(24)
                      .height(24)
                      .margin({left:2,right:3})
                    Text('厨房用品')
                      .fontSize(15)
                      .fontWeight(600)
                      .padding(8)
                  }.justifyContent(FlexAlign.Start)
                  .width('100%')

                  Column() {
                      Grid() {
                      ForEach(this.datas2, (item: Type1) => {
                        GridItem() {
                          this.hotItems(item)
                        }
                      })

                    }
                    .columnsTemplate('1fr 1fr 1fr') // san列
                    .columnsGap(10) // 列间距
                    .rowsGap(10) // 行间距
                    //.height('auto') // 自适应内容高度
                  }
                }
                .backgroundColor('#FFFFFF')
                .margin({top:10,left:10,right:10,bottom:8})
                .borderRadius(12)

                Column() {
                  Row() {
                    Image($r('app.media.img_8'))
                      .width(24)
                      .height(24)
                      .margin({ left: 2, right: 3 })
                    Text('卫浴用品')
                      .fontSize(15)
                      .fontWeight(600)
                      .padding(8)
                  }
                  .justifyContent(FlexAlign.Start)
                  .width('100%')

                  Column({ space: 10 }) {
                    Grid() {
                      ForEach(this.datas2_2, (item: Type1) => {
                        GridItem() {
                          this.hotItems(item)
                        }
                      })
                    }
                    .columnsTemplate('1fr 1fr 1fr') // san列
                    .columnsGap(10) // 列间距
                    .rowsGap(10) // 行间距
                    // .height('auto') // 自适应内容高度
                  }
                }
                .backgroundColor('#FFFFFF')
                .borderRadius(12)
                .margin(10)

                Text('更多商品持续更新中...')
                  .fontSize(15)
                  .fontWeight(600)
                  .fontColor('#E0E0E0')
                  .height(60)
                  .width('93%')
                  .textAlign(TextAlign.Center)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(12)
                  .margin(10)


              }//.size({ width: '100%', height: '100%' })
            }
            .scrollBar(BarState.Off)
          }.tabBar(this.TabBuilder('厨卫用品', 1))

          TabContent() {
            Scroll(){
              Column() {
                // 内容项
                Column() {
                  Row() {
                    Image($r('app.media.img_8'))
                      .width(24)
                      .height(24)
                      .margin({left:2,right:3})
                    Text('垃圾桶')
                      .fontSize(15)
                      .fontWeight(600)
                      .padding(8)
                  }.justifyContent(FlexAlign.Start)
                  .width('100%')

                  Column() {
                    Grid() {
                      ForEach(this.datas3, (item: Type1) => {
                        GridItem() {
                          this.hotItems(item)
                        }
                      })

                    }
                    .columnsTemplate('1fr 1fr 1fr') // san列
                    .columnsGap(10) // 列间距
                    .rowsGap(10) // 行间距
                    //.height('auto') // 自适应内容高度
                  }
                }
                .backgroundColor('#FFFFFF')
                .margin({top:10,left:10,right:10,bottom:8})
                .borderRadius(12)

                Column() {
                  Row() {
                    Image($r('app.media.img_8'))
                      .width(24)
                      .height(24)
                      .margin({ left: 2, right: 3 })
                    Text('垃圾袋')
                      .fontSize(15)
                      .fontWeight(600)
                      .padding(8)
                  }
                  .justifyContent(FlexAlign.Start)
                  .width('100%')

                  Column({ space: 10 }) {
                    Grid() {
                      ForEach(this.datas3_2, (item: Type1) => {
                        GridItem() {
                          this.hotItems(item)
                        }
                      })
                    }
                    .columnsTemplate('1fr 1fr 1fr') // san列
                    .columnsGap(10) // 列间距
                    .rowsGap(10) // 行间距
                    // .height('auto') // 自适应内容高度
                  }
                }
                .backgroundColor('#FFFFFF')
                .borderRadius(12)
                .margin(10)

                Text('更多商品持续更新中...')
                  .fontSize(15)
                  .fontWeight(600)
                  .fontColor('#E0E0E0')
                  .height(60)
                  .width('93%')
                  .textAlign(TextAlign.Center)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(12)
                  .margin({left:10,right:10})


              }//.size({ width: '100%', height: '100%' })
            }
            .scrollBar(BarState.Off)

          }.tabBar(this.TabBuilder('垃圾处理', 2))

          TabContent() {
            Scroll(){
              Column() {
                // 内容项
                Column() {
                  Row() {
                    Image($r('app.media.img_8'))
                      .width(24)
                      .height(24)
                      .margin({left:2,right:3})
                    Text('小电器')
                      .fontSize(15)
                      .fontWeight(600)
                      .padding(8)
                  }.justifyContent(FlexAlign.Start)
                  .width('100%')

                  Column() {
                    Grid() {
                      ForEach(this.datas4, (item: Type1) => {
                        GridItem() {
                          this.hotItems(item)
                        }
                      })

                    }
                    .columnsTemplate('1fr 1fr 1fr') // san列
                    .columnsGap(10) // 列间距
                    .rowsGap(10) // 行间距
                    //.height('auto') // 自适应内容高度
                  }
                }
                .backgroundColor('#FFFFFF')
                .margin({top:10,left:10,right:10,bottom:8})
                .borderRadius(12)

                Column() {
                  Row() {
                    Image($r('app.media.img_8'))
                      .width(24)
                      .height(24)
                      .margin({ left: 2, right: 3 })
                    Text('大型电器')
                      .fontSize(15)
                      .fontWeight(600)
                      .padding(8)
                  }
                  .justifyContent(FlexAlign.Start)
                  .width('100%')

                  Column({ space: 10 }) {
                    Grid() {
                      ForEach(this.datas4_2, (item: Type1) => {
                        GridItem() {
                          this.hotItems(item)
                        }
                      })
                    }
                    .columnsTemplate('1fr 1fr 1fr') // san列
                    .columnsGap(10) // 列间距
                    .rowsGap(10) // 行间距
                    // .height('auto') // 自适应内容高度
                  }
                }
                .backgroundColor('#FFFFFF')
                .borderRadius(12)
                .margin(10)

                Text('更多商品持续更新中...')
                  .fontSize(15)
                  .fontWeight(600)
                  .fontColor('#E0E0E0')
                  .height(60)
                  .width('93%')
                  .textAlign(TextAlign.Center)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(12)
                  .margin({left:10,right:10})


              }//.size({ width: '100%', height: '100%' })
            }
            .scrollBar(BarState.Off)
          }.tabBar(this.TabBuilder('家用电器', 3))

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
    //.backgroundImage($r('app.media.bk'))
    //.backgroundImageSize({ width: '100%', height: '15%' })



  }
}
*/
/*
//new
import router from "@ohos.router";
import promptAction from '@ohos.promptAction'; // OpenHarmony 提供的系统 API
import { http } from '@kit.NetworkKit';

interface CartItems {
  img: Resource;
  image_key: string;
  value: string;
  price:number;
  img1:Resource;
}

// 定义商品信息接口
interface Product {
  image_key: string;    // 商品图片的唯一标识
  product_name: string; // 商品名称
  price: number;        // 商品单价
}

// 数据库购物车商品接口
interface CartItem {
  id: number;
  image_key: string;
  product_name: string;
  price: number;
  quantity: number;
  total_price: number;
}

interface ResponseData {
  code: number;
  message: string;
}

@Entry
@Component
struct Fenlei {
  @State message: string = 'Hello World';
  @State currentIndex: number = 0;
  //定义变量表示是否正在下拉刷新
  @State isRefresh:boolean = false;
  //定义变量表示是否正在上拉加载
  @State isLoading:boolean = false;
  // 购物车商品列表
  @State cartItems: Array<CartItems> = [];


  private controller: TabsController = new TabsController()
  datas: CartItems[] = [
    { img: $r('app.media.g1'), image_key:'app.media.g1',  value: '夏季必备简约桌面风扇', price:250,img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'), image_key:'app.media.g2',value: '北欧风格大表盘壁挂时钟', price:120,img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'),image_key:'app.media.g3', value: '摆拍神器玻璃水晶球摆件',price:88,img1:$r('app.media.img_15') },
    { img: $r('app.media.g1'),image_key:'app.media.g1', value: '夏季必备简约桌面风扇',price:250,img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'),image_key:'app.media.g2', value: '北欧风格大表盘壁挂时钟',price:120,img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'), image_key:'app.media.g3',value: '摆拍神器玻璃水晶球摆件', price:88,img1:$r('app.media.img_15') },
  ];

  datas1:CartItems[] = [
    { img: $r('app.media.g1'),image_key:'app.media.g1', value: '夏季必备简约桌面风扇', price:250,img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'),image_key:'app.media.g2', value: '北欧风格大表盘壁挂时钟', price:120,img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'),image_key:'app.media.g3',value: '摆拍神器玻璃水晶球摆件', price:88,img1:$r('app.media.img_15') },
    { img: $r('app.media.g1'),image_key:'app.media.g1', value: '夏季必备简约桌面风扇', price:250,img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'),image_key:'app.media.g2', value: '北欧风格大表盘壁挂时钟', price:120,img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'),image_key:'app.media.g3', value: '摆拍神器玻璃水晶球摆件', price:88,img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'),image_key:'app.media.g2', value: '北欧风格大表盘壁挂时钟', price:120,img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'),image_key:'app.media.g3', value: '摆拍神器玻璃水晶球摆件', price:88,img1:$r('app.media.img_15') }

  ];

  datas2: CartItems[] = [
    { img: $r("app.media.img_3"),image_key:'app.media.img_3', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_4"),image_key:'app.media.img_4',value:  '商品详情' , price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_5"),image_key:'app.media.img_5', value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_6"),image_key:'app.media.img_6', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_7"), image_key:'app.media.img_7',value: '商品详情', price:255,img1:$r('app.media.img_15') },
  // { img: $r('app.media.img_8'), value: '88币',img1:$r('app.media.img_15') },
  ];

  datas2_2:CartItems[] = [
    { img: $r("app.media.img22_1"),image_key:'app.media.img22_1', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_2"),image_key:'app.media.img22_2', value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_3"),image_key:'app.media.img22_3', value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_4"),image_key:'app.media.img22_4', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_5"),image_key:'app.media.img22_5', value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_6"),image_key:'app.media.img22_6', value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_7"),image_key:'app.media.img22_7', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_8"),image_key:'app.media.img22_8',value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_9"),image_key:'app.media.img22_9', value: '商品详情', price:520,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_10"),image_key:'app.media.img22_10', value: '商品详情', price:100,img1:$r('app.media.img_15') },
  ];

  datas3: CartItems[] = [
    { img: $r("app.media.img_25"),image_key:'app.media.img_25', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_9"), image_key:'app.media.img_9',value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_26"),image_key:'app.media.img_26', value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_27"),image_key:'app.media.img_27',value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_28"),image_key:'app.media.img_28', value: '商品详情', price:255,img1:$r('app.media.img_15') },
  // { img: $r('app.media.img_8'), value: '88币',img1:$r('app.media.img_15') },
  ];

  datas3_2: CartItems[] = [
    { img: $r("app.media.img_29"),image_key:'app.media.img_29', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_30"),image_key:'app.media.img_30', value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_31"),image_key:'app.media.img_31', value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_32"),image_key:'app.media.img_32', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_33"),image_key:'app.media.img_33', value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_34"),image_key:'app.media.img_34', value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_35"),image_key:'app.media.img_35', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_32"),image_key:'app.media.img_32', value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_36"),image_key:'app.media.img_36', value: '商品详情', price:520,img1:$r('app.media.img_15') },
  //{ img: $r("app.media.img22_10"), value: '100币',img1:$r('app.media.img_15') },
  ];

  datas4: CartItems[] = [
    { img: $r("app.media.img_39"), image_key:'app.media.img_39',value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_40"), image_key:'app.media.img_40',value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_41"), image_key:'app.media.img_41',value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_42"), image_key:'app.media.img_42',value: '商品详情', price:200,img1:$r('app.media.img_15') },
  //{ img: $r("app.media.img_28"), value: '255币',img1:$r('app.media.img_15') },
  // { img: $r('app.media.img_8'), value: '88币',img1:$r('app.media.img_15') },
  ];

  datas4_2: CartItems[] = [
    { img: $r("app.media.img_43"),image_key:'app.media.img_43', value: '商品详情', price:2000,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_44"),image_key:'app.media.img_44', value: '商品详情', price:5200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_45"),image_key:'app.media.img_45', value: '商品详情', price:2500,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_46"),image_key:'app.media.img_46', value: '商品详情', price:5200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_43"),image_key:'app.media.img_43', value: '商品详情', price:2000,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_44"),image_key:'app.media.img_44', value: '商品详情', price:5200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_45"),image_key:'app.media.img_45', value: '商品详情', price:2500,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_46"),image_key:'app.media.img_46', value: '商品详情', price:5200,img1:$r('app.media.img_15') },
  //{ img: $r("app.media.img_36"), value: '520币',img1:$r('app.media.img_15') },
  //{ img: $r("app.media.img22_10"), value: '100币',img1:$r('app.media.img_15') },
  ];

  //UI
  @Builder
  // 假设购物车是一个数组，存储商品信息
  hotItems(item: CartItems) {
    Column({ space: 5 }) {
      Image(item.img)
        .width(80)
        .height(80)
        .borderRadius(12)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/shangpinxiangqing',
            params: {
              productInfo: {
                image_key: this.getImageKey(item),
                product_name: item.value,
                price: item.price,
                //img: item.img.toString() // 将Resource转换为字符串
              }
            }
          });
        })
      Row({ space: 5 }) {
        // Text(item.value)
        Text(` ${item.price} 币`)
          .fontSize(16)
          .fontColor('#000000')
        Image(item.img1)
          .width(20)
          .height(20)
          .onClick(() => {
            // 点击购物车图标，将商品图片和 value 传入购物车
            this.addToCart(item);
          })
      }
    }
  }

  private getImageKey(item: CartItems): string {
    const imageKey = item.image_key; // 直接使用传递的资源路径字符串
    console.log('Generated imageKey:', imageKey);
    return imageKey;
  }

  async addToCart(item: CartItems): Promise<void> {
    try {
      // 生成唯一的image_key，这里使用图片资源名称作为标识
      const imageKey = this.getImageKey(item);
      // 使用 http 模块发送请求
      const httpRequest = http.createHttp();
      const response = await httpRequest.request(
        'http://192.168.32.1:8080/api/cart/add',
        {
          method: http.RequestMethod.POST,
          header: {
            'Content-Type': 'application/json',
          },
          extraData: JSON.stringify({
            image_key: imageKey,           // 商品图片的唯一标识
            product_name: item.value,      // 商品名称
            price: item.price              // 商品单价
          }),
        }
      );

      if (response.responseCode === 200) {
        // 解析响应数据
        const responseData: ResponseData = JSON.parse(response.result.toString());

        if (responseData.code === 0) {
          // 添加成功
          promptAction.showToast({ message: `${item.value} 已成功添加到购物车！`, duration: 2000 });
        } else {
          // 添加失败
          promptAction.showToast({ message: `添加失败: ${responseData.message}`, duration: 2000 });
        }
      } else {
        // HTTP 请求失败
        promptAction.showToast({ message: `请求失败，状态码: ${response.responseCode}`, duration: 2000 });
      }

      // 销毁 http 实例
      httpRequest.destroy();
    } catch (error) {
      // 网络错误或其他异常
      console.error('网络错误:', error);
      promptAction.showToast({ message: '网络错误，请稍后重试', duration: 2000 });
    }
  }


  // 自定义导航页签的样式
  @Builder TabBuilder(title: string, targetIndex: number) {
    Column({space:10}) {
      Row() {
        // 标签图片
        Image(this.currentIndex === targetIndex ? $r('app.media.img_8') : $r('app.media.img_37'))
          .width(10)
          .height(40)
        //.margin({left:0, right: 10 })
        Text(title)
          .fontSize(this.currentIndex ===targetIndex ? 22 : 20) // 根据currentIndex动态改变字体大小
          .fontColor(this.currentIndex === targetIndex ? '#FF5E81' : '#8a8a8a')
        // .fontSize(20)
      }
      .width('100%')
      .height(50)
      .justifyContent(FlexAlign.Start)
      .onClick(() => {
        this.currentIndex = targetIndex
        this.controller.changeIndex(this.currentIndex)
      })
    }
  }

  build() {
    Column() {
      Row() {
        Image($r("app.media.img2_10"))
          .width(12)
          .height(24)
          .zIndex(1) // 确保图标在最上层
          .margin({ right: 10 })
          .onClick(() => {
            router.back();
          })
        Text('分类')
          .fontSize(25)
          .fontWeight(600)
          .fontColor($r('sys.color.white'))
        Blank();
        Image($r('app.media.img_14'))
          .width(24)
          .height(24)
          .margin({right:10})
          .onClick(() => {
            router.pushUrl({ url: 'pages/gouwuche' });
          })
          .zIndex(1) // 确保图标在最上层
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
                  Image($r('app.media.img_8'))
                    .width(12)
                    .height(24)
                    .margin({left:12,right:20})
                    .borderRadius(12)

                  Text('家居')
                    .fontSize(15)
                    .fontWeight(600)
                  //.padding(8)
                }.justifyContent(FlexAlign.Start)
                .margin({top:5})
                .width('100%') // 确保Row组件占据100%宽度

                Column() {
                  Grid() {
                    ForEach(this.datas, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  //.height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .margin({top:10,left:10,right:10,bottom:8})
              .borderRadius(12)

              Column() {
                Row() {
                  Image($r('app.media.img_8'))
                    .width(24)
                    .height(24)
                    .margin({ left: 2, right: 3 })

                  Text('饰品')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度

                Column({ space: 10 }) {
                  Grid() {
                    ForEach(this.datas1, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  // .height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin(10)

              Text('更多商品持续更新中...')
                .fontSize(15)
                .fontWeight(600)
                .fontColor('#E0E0E0')
                .height(60)
                .width('93%')
                .textAlign(TextAlign.Center)
                .backgroundColor('#FFFFFF')
                .borderRadius(12)
                .margin(10)


            }//.size({ width: '100%', height: '100%' })
          }
          .scrollBar(BarState.Off)
        }.tabBar(this.TabBuilder('家居饰品', 0))


        TabContent() {
          Scroll(){
            Column() {
              // 内容项
              Column() {
                Row() {
                  Image($r('app.media.img_8'))
                    .width(24)
                    .height(24)
                    .margin({left:2,right:3})
                  Text('厨房用品')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }.justifyContent(FlexAlign.Start)
                .width('100%')

                Column() {
                  Grid() {
                    ForEach(this.datas2, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })

                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  //.height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .margin({top:10,left:10,right:10,bottom:8})
              .borderRadius(12)

              Column() {
                Row() {
                  Image($r('app.media.img_8'))
                    .width(24)
                    .height(24)
                    .margin({ left: 2, right: 3 })
                  Text('卫浴用品')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%')

                Column({ space: 10 }) {
                  Grid() {
                    ForEach(this.datas2_2, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  // .height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin(10)

              Text('更多商品持续更新中...')
                .fontSize(15)
                .fontWeight(600)
                .fontColor('#E0E0E0')
                .height(60)
                .width('93%')
                .textAlign(TextAlign.Center)
                .backgroundColor('#FFFFFF')
                .borderRadius(12)
                .margin(10)


            }//.size({ width: '100%', height: '100%' })
          }
          .scrollBar(BarState.Off)
        }.tabBar(this.TabBuilder('厨卫用品', 1))

        TabContent() {
          Scroll(){
            Column() {
              // 内容项
              Column() {
                Row() {
                  Image($r('app.media.img_8'))
                    .width(24)
                    .height(24)
                    .margin({left:2,right:3})
                  Text('垃圾桶')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }.justifyContent(FlexAlign.Start)
                .width('100%')

                Column() {
                  Grid() {
                    ForEach(this.datas3, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })

                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  //.height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .margin({top:10,left:10,right:10,bottom:8})
              .borderRadius(12)

              Column() {
                Row() {
                  Image($r('app.media.img_8'))
                    .width(24)
                    .height(24)
                    .margin({ left: 2, right: 3 })
                  Text('垃圾袋')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%')

                Column({ space: 10 }) {
                  Grid() {
                    ForEach(this.datas3_2, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  // .height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin(10)

              Text('更多商品持续更新中...')
                .fontSize(15)
                .fontWeight(600)
                .fontColor('#E0E0E0')
                .height(60)
                .width('93%')
                .textAlign(TextAlign.Center)
                .backgroundColor('#FFFFFF')
                .borderRadius(12)
                .margin({left:10,right:10})


            }//.size({ width: '100%', height: '100%' })
          }
          .scrollBar(BarState.Off)

        }.tabBar(this.TabBuilder('垃圾处理', 2))

        TabContent() {
          Scroll(){
            Column() {
              // 内容项
              Column() {
                Row() {
                  Image($r('app.media.img_8'))
                    .width(24)
                    .height(24)
                    .margin({left:2,right:3})
                  Text('小电器')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }.justifyContent(FlexAlign.Start)
                .width('100%')

                Column() {
                  Grid() {
                    ForEach(this.datas4, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })

                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  //.height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .margin({top:10,left:10,right:10,bottom:8})
              .borderRadius(12)

              Column() {
                Row() {
                  Image($r('app.media.img_8'))
                    .width(24)
                    .height(24)
                    .margin({ left: 2, right: 3 })
                  Text('大型电器')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%')

                Column({ space: 10 }) {
                  Grid() {
                    ForEach(this.datas4_2, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  // .height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin(10)

              Text('更多商品持续更新中...')
                .fontSize(15)
                .fontWeight(600)
                .fontColor('#E0E0E0')
                .height(60)
                .width('93%')
                .textAlign(TextAlign.Center)
                .backgroundColor('#FFFFFF')
                .borderRadius(12)
                .margin({left:10,right:10})


            }//.size({ width: '100%', height: '100%' })
          }
          .scrollBar(BarState.Off)
        }.tabBar(this.TabBuilder('家用电器', 3))

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
    //.backgroundImage($r('app.media.bk'))
    //.backgroundImageSize({ width: '100%', height: '15%' })

  }
}
*/

//new
import router from "@ohos.router";
import promptAction from '@ohos.promptAction'; // OpenHarmony 提供的系统 API
import { http } from '@kit.NetworkKit';

interface CartItems {
  img: Resource;
  image_key: string;
  value: string;
  price:number;
  img1:Resource;
}

// 定义商品信息接口
interface Product {
  image_key: string;    // 商品图片的唯一标识
  product_name: string; // 商品名称
  price: number;        // 商品单价
}

// 数据库购物车商品接口
interface CartItem {
  id: number;
  image_key: string;
  product_name: string;
  price: number;
  quantity: number;
  total_price: number;
}

interface ResponseData {
  code: number;
  message: string;
}

@Entry
@Component
struct Fenlei {
  @State message: string = 'Hello World';
  @State currentIndex: number = 0;
  //定义变量表示是否正在下拉刷新
  @State isRefresh:boolean = false;
  //定义变量表示是否正在上拉加载
  @State isLoading:boolean = false;
  // 购物车商品列表
  @State cartItems: Array<CartItems> = [];


  private controller: TabsController = new TabsController()
  datas: CartItems[] = [
    { img: $r('app.media.g1'), image_key:'app.media.g1',  value: '夏季必备简约桌面风扇', price:250,img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'), image_key:'app.media.g2',value: '北欧风格大表盘壁挂时钟', price:120,img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'),image_key:'app.media.g3', value: '摆拍神器玻璃水晶球摆件',price:88,img1:$r('app.media.img_15') },
    { img: $r('app.media.g1'),image_key:'app.media.g1', value: '夏季必备简约桌面风扇',price:250,img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'),image_key:'app.media.g2', value: '北欧风格大表盘壁挂时钟',price:120,img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'), image_key:'app.media.g3',value: '摆拍神器玻璃水晶球摆件', price:88,img1:$r('app.media.img_15') },
  ];

  datas1:CartItems[] = [
    { img: $r('app.media.g1'),image_key:'app.media.g1', value: '夏季必备简约桌面风扇', price:250,img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'),image_key:'app.media.g2', value: '北欧风格大表盘壁挂时钟', price:120,img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'),image_key:'app.media.g3',value: '摆拍神器玻璃水晶球摆件', price:88,img1:$r('app.media.img_15') },
    { img: $r('app.media.g1'),image_key:'app.media.g1', value: '夏季必备简约桌面风扇', price:250,img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'),image_key:'app.media.g2', value: '北欧风格大表盘壁挂时钟', price:120,img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'),image_key:'app.media.g3', value: '摆拍神器玻璃水晶球摆件', price:88,img1:$r('app.media.img_15') },
    { img: $r('app.media.g2'),image_key:'app.media.g2', value: '北欧风格大表盘壁挂时钟', price:120,img1:$r('app.media.img_15') },
    { img: $r('app.media.g3'),image_key:'app.media.g3', value: '摆拍神器玻璃水晶球摆件', price:88,img1:$r('app.media.img_15') }

  ];

  datas2: CartItems[] = [
    { img: $r("app.media.img_3"),image_key:'app.media.img_3', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_4"),image_key:'app.media.img_4',value:  '商品详情' , price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_5"),image_key:'app.media.img_5', value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_6"),image_key:'app.media.img_6', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_7"), image_key:'app.media.img_7',value: '商品详情', price:255,img1:$r('app.media.img_15') },
  // { img: $r('app.media.img_8'), value: '88币',img1:$r('app.media.img_15') },
  ];

  datas2_2:CartItems[] = [
    { img: $r("app.media.img22_1"),image_key:'app.media.img22_1', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_2"),image_key:'app.media.img22_2', value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_3"),image_key:'app.media.img22_3', value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_4"),image_key:'app.media.img22_4', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_5"),image_key:'app.media.img22_5', value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_6"),image_key:'app.media.img22_6', value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_7"),image_key:'app.media.img22_7', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_8"),image_key:'app.media.img22_8',value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_9"),image_key:'app.media.img22_9', value: '商品详情', price:520,img1:$r('app.media.img_15') },
    { img: $r("app.media.img22_10"),image_key:'app.media.img22_10', value: '商品详情', price:100,img1:$r('app.media.img_15') },
  ];

  datas3: CartItems[] = [
    { img: $r("app.media.img_25"),image_key:'app.media.img_25', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_27"), image_key:'app.media.img_9',value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_26"),image_key:'app.media.img_26', value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_27"),image_key:'app.media.img_27',value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_28"),image_key:'app.media.img_28', value: '商品详情', price:255,img1:$r('app.media.img_15') },
  // { img: $r('app.media.img_8'), value: '88币',img1:$r('app.media.img_15') },
  ];

  datas3_2: CartItems[] = [
    { img: $r("app.media.img_29"),image_key:'app.media.img_29', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_30"),image_key:'app.media.img_30', value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_31"),image_key:'app.media.img_31', value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_32"),image_key:'app.media.img_32', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_33"),image_key:'app.media.img_33', value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_34"),image_key:'app.media.img_34', value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_35"),image_key:'app.media.img_35', value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_32"),image_key:'app.media.img_32', value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_36"),image_key:'app.media.img_36', value: '商品详情', price:520,img1:$r('app.media.img_15') },
  //{ img: $r("app.media.img22_10"), value: '100币',img1:$r('app.media.img_15') },
  ];

  datas4: CartItems[] = [
    { img: $r("app.media.img_39"), image_key:'app.media.img_39',value: '商品详情', price:200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_40"), image_key:'app.media.img_40',value: '商品详情', price:255,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_41"), image_key:'app.media.img_41',value: '商品详情', price:100,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_42"), image_key:'app.media.img_42',value: '商品详情', price:200,img1:$r('app.media.img_15') },
  //{ img: $r("app.media.img_28"), value: '255币',img1:$r('app.media.img_15') },
  // { img: $r('app.media.img_8'), value: '88币',img1:$r('app.media.img_15') },
  ];

  datas4_2: CartItems[] = [
    { img: $r("app.media.img_43"),image_key:'app.media.img_43', value: '商品详情', price:2000,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_44"),image_key:'app.media.img_44', value: '商品详情', price:5200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_45"),image_key:'app.media.img_45', value: '商品详情', price:2500,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_46"),image_key:'app.media.img_46', value: '商品详情', price:5200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_43"),image_key:'app.media.img_43', value: '商品详情', price:2000,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_44"),image_key:'app.media.img_44', value: '商品详情', price:5200,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_45"),image_key:'app.media.img_45', value: '商品详情', price:2500,img1:$r('app.media.img_15') },
    { img: $r("app.media.img_46"),image_key:'app.media.img_46', value: '商品详情', price:5200,img1:$r('app.media.img_15') },
  //{ img: $r("app.media.img_36"), value: '520币',img1:$r('app.media.img_15') },
  //{ img: $r("app.media.img22_10"), value: '100币',img1:$r('app.media.img_15') },
  ];

  //UI
  @Builder
  // 假设购物车是一个数组，存储商品信息
  hotItems(item: CartItems) {
    Column({ space: 5 }) {
      Image(item.img)
        .width(80)
        .height(80)
        .borderRadius(12)
        .onClick(() => {
          router.pushUrl({
            url: 'pages/shangpinxiangqing',
            params: {
              productInfo: {
                image_key: this.getImageKey(item),
                product_name: item.value,
                price: item.price,
                //img: item.img.toString() // 将Resource转换为字符串
              }
            }
          });
        })
      Row({ space: 5 }) {
        // Text(item.value)
        Text(` ${item.price} 币`)
          .fontSize(16)
          .fontColor('#000000')
        Image(item.img1)
          .width(20)
          .height(20)
          .onClick(() => {
            // 点击购物车图标，将商品图片和 value 传入购物车
            this.addToCart(item);
          })
      }
    }
  }

  private getImageKey(item: CartItems): string {
    const imageKey = item.image_key; // 直接使用传递的资源路径字符串
    console.log('Generated imageKey:', imageKey);
    return imageKey;
  }

  async addToCart(item: CartItems): Promise<void> {
    try {
      // 生成唯一的image_key，这里使用图片资源名称作为标识
      const imageKey = this.getImageKey(item);
      // 使用 http 模块发送请求
      const httpRequest = http.createHttp();
      const response = await httpRequest.request(
        'http://192.168.32.1:8080/api/cart/add',
        {
          method: http.RequestMethod.POST,
          header: {
            'Content-Type': 'application/json',
          },
          extraData: JSON.stringify({
            image_key: imageKey,           // 商品图片的唯一标识
            product_name: item.value,      // 商品名称
            price: item.price              // 商品单价
          }),
        }
      );

      if (response.responseCode === 200) {
        // 解析响应数据
        const responseData: ResponseData = JSON.parse(response.result.toString());

        if (responseData.code === 0) {
          // 添加成功
          promptAction.showToast({ message: `${item.value} 已成功添加到购物车！`, duration: 2000 });
        } else {
          // 添加失败
          promptAction.showToast({ message: `添加失败: ${responseData.message}`, duration: 2000 });
        }
      } else {
        // HTTP 请求失败
        promptAction.showToast({ message: `请求失败，状态码: ${response.responseCode}`, duration: 2000 });
      }

      // 销毁 http 实例
      httpRequest.destroy();
    } catch (error) {
      // 网络错误或其他异常
      console.error('网络错误:', error);
      promptAction.showToast({ message: '网络错误，请稍后重试', duration: 2000 });
    }
  }


  // 自定义导航页签的样式
  @Builder TabBuilder(title: string, targetIndex: number) {
    Column({space:10}) {
      Row() {
        // 标签图片
        Image(this.currentIndex === targetIndex ? $r('app.media.img_38') : $r('app.media.img_37'))
          .width(10)
          .height(40)
        //.margin({left:0, right: 10 })
        Text(title)
          .fontSize(this.currentIndex ===targetIndex ? 22 : 20) // 根据currentIndex动态改变字体大小
          .fontColor(this.currentIndex === targetIndex ? '#FF5E81' : '#8a8a8a')
        // .fontSize(20)
      }
      .width('100%')
      .height(50)
      .justifyContent(FlexAlign.Start)
      .onClick(() => {
        this.currentIndex = targetIndex
        this.controller.changeIndex(this.currentIndex)
      })
    }
  }

  build() {
    Column() {
      Row() {
        Image($r("app.media.img2_10"))
          .width(12)
          .height(24)
          .zIndex(1) // 确保图标在最上层
          .margin({ right: 10 })
          .onClick(() => {
            router.back();
          })
        Text('分类')
          .fontSize(25)
          .fontWeight(600)
          .fontColor($r('sys.color.white'))
        Blank();
        Image($r('app.media.img_14'))
          .width(24)
          .height(24)
          .margin({right:10})
          .onClick(() => {
            router.pushUrl({ url: 'pages/gouwuche' });
          })
          .zIndex(1) // 确保图标在最上层
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
                  Image($r('app.media.img_38'))
                    .width(12)
                    .height(24)
                    .margin({left:12,right:20})
                    .borderRadius(12)

                  Text('家居')
                    .fontSize(15)
                    .fontWeight(600)
                  //.padding(8)
                }.justifyContent(FlexAlign.Start)
                .margin({top:5})
                .width('100%') // 确保Row组件占据100%宽度

                Column() {
                  Grid() {
                    ForEach(this.datas, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  //.height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .margin({top:10,left:10,right:10,bottom:8})
              .borderRadius(12)

              Column() {
                Row() {
                  Image($r('app.media.img_38'))
                    .width(24)
                    .height(24)
                    .margin({ left: 2, right: 3 })

                  Text('饰品')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度

                Column({ space: 10 }) {
                  Grid() {
                    ForEach(this.datas1, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  // .height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin(10)

              Text('更多商品持续更新中...')
                .fontSize(15)
                .fontWeight(600)
                .fontColor('#E0E0E0')
                .height(60)
                .width('93%')
                .textAlign(TextAlign.Center)
                .backgroundColor('#FFFFFF')
                .borderRadius(12)
                .margin(10)


            }//.size({ width: '100%', height: '100%' })
          }
          .scrollBar(BarState.Off)
        }.tabBar(this.TabBuilder('家居饰品', 0))


        TabContent() {
          Scroll(){
            Column() {
              // 内容项
              Column() {
                Row() {
                  Image($r('app.media.img_38'))
                    .width(24)
                    .height(24)
                    .margin({left:2,right:3})
                  Text('厨房用品')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }.justifyContent(FlexAlign.Start)
                .width('100%')

                Column() {
                  Grid() {
                    ForEach(this.datas2, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })

                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  //.height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .margin({top:10,left:10,right:10,bottom:8})
              .borderRadius(12)

              Column() {
                Row() {
                  Image($r('app.media.img_38'))
                    .width(24)
                    .height(24)
                    .margin({ left: 2, right: 3 })
                  Text('卫浴用品')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%')

                Column({ space: 10 }) {
                  Grid() {
                    ForEach(this.datas2_2, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  // .height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin(10)

              Text('更多商品持续更新中...')
                .fontSize(15)
                .fontWeight(600)
                .fontColor('#E0E0E0')
                .height(60)
                .width('93%')
                .textAlign(TextAlign.Center)
                .backgroundColor('#FFFFFF')
                .borderRadius(12)
                .margin(10)


            }//.size({ width: '100%', height: '100%' })
          }
          .scrollBar(BarState.Off)
        }.tabBar(this.TabBuilder('厨卫用品', 1))

        TabContent() {
          Scroll(){
            Column() {
              // 内容项
              Column() {
                Row() {
                  Image($r('app.media.img_38'))
                    .width(24)
                    .height(24)
                    .margin({left:2,right:3})
                  Text('垃圾桶')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }.justifyContent(FlexAlign.Start)
                .width('100%')

                Column() {
                  Grid() {
                    ForEach(this.datas3, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })

                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  //.height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .margin({top:10,left:10,right:10,bottom:8})
              .borderRadius(12)

              Column() {
                Row() {
                  Image($r('app.media.img_38'))
                    .width(24)
                    .height(24)
                    .margin({ left: 2, right: 3 })
                  Text('垃圾袋')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%')

                Column({ space: 10 }) {
                  Grid() {
                    ForEach(this.datas3_2, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  // .height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin(10)

              Text('更多商品持续更新中...')
                .fontSize(15)
                .fontWeight(600)
                .fontColor('#E0E0E0')
                .height(60)
                .width('93%')
                .textAlign(TextAlign.Center)
                .backgroundColor('#FFFFFF')
                .borderRadius(12)
                .margin({left:10,right:10})


            }//.size({ width: '100%', height: '100%' })
          }
          .scrollBar(BarState.Off)

        }.tabBar(this.TabBuilder('垃圾处理', 2))

        TabContent() {
          Scroll(){
            Column() {
              // 内容项
              Column() {
                Row() {
                  Image($r('app.media.img_38'))
                    .width(24)
                    .height(24)
                    .margin({left:2,right:3})
                  Text('小电器')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }.justifyContent(FlexAlign.Start)
                .width('100%')

                Column() {
                  Grid() {
                    ForEach(this.datas4, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })

                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  //.height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .margin({top:10,left:10,right:10,bottom:8})
              .borderRadius(12)

              Column() {
                Row() {
                  Image($r('app.media.img_38'))
                    .width(24)
                    .height(24)
                    .margin({ left: 2, right: 3 })
                  Text('大型电器')
                    .fontSize(15)
                    .fontWeight(600)
                    .padding(8)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%')

                Column({ space: 10 }) {
                  Grid() {
                    ForEach(this.datas4_2, (item: CartItems) => {
                      GridItem() {
                        this.hotItems(item)
                      }
                    })
                  }
                  .columnsTemplate('1fr 1fr 1fr') // san列
                  .columnsGap(10) // 列间距
                  .rowsGap(10) // 行间距
                  // .height('auto') // 自适应内容高度
                }
              }
              .backgroundColor('#FFFFFF')
              .borderRadius(12)
              .margin(10)

              Text('更多商品持续更新中...')
                .fontSize(15)
                .fontWeight(600)
                .fontColor('#E0E0E0')
                .height(60)
                .width('93%')
                .textAlign(TextAlign.Center)
                .backgroundColor('#FFFFFF')
                .borderRadius(12)
                .margin({left:10,right:10})


            }//.size({ width: '100%', height: '100%' })
          }
          .scrollBar(BarState.Off)
        }.tabBar(this.TabBuilder('家用电器', 3))

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
    //.backgroundImage($r('app.media.bk'))
    //.backgroundImageSize({ width: '100%', height: '15%' })

  }
}
