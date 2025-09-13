import router from "@ohos.router";
import promptAction from '@ohos.promptAction'; // OpenHarmony 提供的系统 API
import { http } from '@kit.NetworkKit';

interface Type1{
  img:Resource
  contents:string
  value:string
}

interface ProductInfo {
  image_key: string;
  product_name: string;
  price: number;
}

interface GeneratedTypeLiteralInterface_1 {
  productInfo?: ProductInfo;
}

interface ResponseData {
  code: number;
  message: string;
}

@Entry
@Component
struct Shangpinxiangqing {
  @State message: string = 'Hello World';
  //Swiper控制器
  swiperController: SwiperController = new SwiperController();
  @State currentIndex: number = 0;
  @State count:number = 48045;
  //@State productInfo: product | null = null;
  @State productInfo: ProductInfo = {
    image_key: '',
    product_name: '',
    price: 0
  };
  @State isLoading: boolean = true;
  @State error: string | null = null;
  @State showPaymentDialog: boolean = false; // 控制支付弹窗显示

  // key到图片资源的映射表
  private  imageMap: Record<string, Resource> = {
    'app.media.g1': $r('app.media.g1'),
    'app.media.g2': $r('app.media.g2'),
    'app.media.g3': $r('app.media.g3'),
    'app.media.img_3': $r('app.media.img_3'),
    'app.media.img_4': $r('app.media.img_4'),
    'app.media.img_5': $r('app.media.img_5'),
    'app.media.img_6': $r('app.media.img_6'),
    'app.media.img_7': $r('app.media.img_7'),
    'app.media.img22_1': $r('app.media.img22_1'),
    'app.media.img22_2': $r('app.media.img22_2'),
    'app.media.img22_3': $r('app.media.img22_3'),
    'app.media.img22_4': $r('app.media.img22_4'),
    'app.media.img22_5': $r('app.media.img22_5'),
    'app.media.img22_6': $r('app.media.img22_6'),
    'app.media.img22_7': $r('app.media.img22_7'),
    'app.media.img22_8': $r('app.media.img22_8'),
    'app.media.img22_9': $r('app.media.img22_9'),
    'app.media.img22_10': $r('app.media.img22_10'),
    'app.media.img_25': $r('app.media.img_25'),
    'app.media.img_9': $r('app.media.img_9'),
    'app.media.img_26': $r('app.media.img_26'),
    'app.media.img_27': $r('app.media.img_27'),
    'app.media.img_28': $r('app.media.img_28'),
    'app.media.img_29': $r('app.media.img_29'),
    'app.media.img_30': $r('app.media.img_30'),
    'app.media.img_31': $r('app.media.img_31'),
    'app.media.img_32': $r('app.media.img_32'),
    'app.media.img_33': $r('app.media.img_33'),
    'app.media.img_34': $r('app.media.img_34'),
    'app.media.img_35': $r('app.media.img_35'),
    'app.media.img_36': $r('app.media.img_36'),
    'app.media.img_39': $r('app.media.img_39'),
    'app.media.img_40': $r('app.media.img_40'),
    'app.media.img_41': $r('app.media.img_41'),
    'app.media.img_42': $r('app.media.img_42'),
    'app.media.img_43': $r('app.media.img_43'),
    'app.media.img_44': $r('app.media.img_44'),
    'app.media.img_45': $r('app.media.img_45'),
    'app.media.img_46': $r('app.media.img_46'),
  };
  // 获取对应 image_key 的图片资源，如果不存在则返回默认图片
  private getImageByKey(imageKey: string): Resource {
    return this.imageMap[imageKey] ?? $r('app.media.img_16'); // 默认图片
  }


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

      }
    },1000)

    // 获取参数
    let params = router.getParams() as GeneratedTypeLiteralInterface_1;
    if (params && params.productInfo) {
      this.productInfo = params.productInfo;
    }
  }



  datas:Type1[] = [
    {img:$r('app.media.g1'),contents:'夏季必备简约桌面风扇',value:'250币'},
    {img:$r('app.media.g2'),contents:'北欧风格大表盘壁挂时钟',value:'120币'},
    {img:$r('app.media.g3'),contents:'摆拍神器玻璃水晶球摆件',value:'88币'},
    {img:$r('app.media.g1'),contents:'夏季必备简约桌面风扇',value:'250币'},
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

  // 支付弹窗组件
  @Builder
  paymentDialog() {
    // 遮罩层
    Column()
      .width('100%')
      .height('100%')
      .backgroundColor('#000000')
      .opacity(0.5)
      .onClick(() => {
        this.showPaymentDialog = false; // 点击遮罩层关闭弹窗
      })
    // 弹窗内容
    Column()
    {
      Text('确认支付')
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .textAlign(TextAlign.Center)
        .margin({ bottom: 20 });
      Column({ space: 10 }) {
        Text(`选中商品：${ this.productInfo.product_name}`)
          .fontSize(16)
          .fontColor('#666666');
        Text(`总价：${this.productInfo.price} 币`)
          .fontSize(24)
          .fontWeight(FontWeight.Bold)
          .fontColor('#FF5E81');
      }
      .margin({ bottom: 30 });

      Row({ space: 20 }) {
        Button('取消')
          .width('40%')
          .height(50)
          .backgroundColor('#F5F5F5')
          .fontColor('#666666')
          .borderRadius(25)
          .onClick(() => {
            this.showPaymentDialog = false; // 关闭弹窗
          });

        Button('确认支付')
          .width('40%')
          .height(50)
          .backgroundColor('#FF5E81')
          .fontColor('#FFFFFF')
          .borderRadius(25)
          .onClick(() => {
            this.showPaymentDialog = false;
            promptAction.showToast({ message: `支付成功！总价：${this.productInfo.price}`, duration: 3000 });
          });
      }
    }
    .width('80%')
    .height('30%')
    .backgroundColor('#FFFFFF')
    .borderRadius(12)
    .padding(20)
    .position({ top: '30%', left: '10%' }) // 定位弹窗
    .zIndex(999) // 确保弹窗在最上层
  }
  //加入到购物车
  async addToCart(): Promise<void> {
    try {
      const httpRequest = http.createHttp();
      const response = await httpRequest.request(
        'http://192.168.32.1:8080/api/cart/add',
        {
          method: http.RequestMethod.POST,
          header: {
            'Content-Type': 'application/json',
          },
          extraData: JSON.stringify({
            image_key: this.productInfo.image_key,
            product_name: this.productInfo.product_name,
            price: this.productInfo.price
          }),
        }
      );

      if (response.responseCode === 200) {
        // 解析响应数据
        const responseData: ResponseData = JSON.parse(response.result.toString());
        if (responseData.code === 0) {
          promptAction.showToast({ message: `${this.productInfo.product_name} 已成功添加到购物车！`, duration: 2000 });
        } else {
          promptAction.showToast({ message: `添加失败: ${responseData.message}`, duration: 2000 });
        }
      } else {
        promptAction.showToast({ message: `请求失败，状态码: ${response.responseCode}`, duration: 2000 });
      }
      httpRequest.destroy();
    } catch (error) {
      promptAction.showToast({ message: '网络错误，请稍后重试', duration: 2000 });
    }
  }
  //加入收藏
  async addToCollect(): Promise<void> {
    try {
      const httpRequest = http.createHttp();
      const response = await httpRequest.request(
        'http://192.168.32.1:8080/api/collect/add',
        {
          method: http.RequestMethod.POST,
          header: {
            'Content-Type': 'application/json',
          },
          extraData: JSON.stringify({
            image_key: this.productInfo.image_key,
            product_name: this.productInfo.product_name,
            price: this.productInfo.price
          }),
        }
      );

      if (response.responseCode === 200) {
        const responseData: ResponseData = JSON.parse(response.result.toString());
        if (responseData.code === 0) {
          promptAction.showToast({ message: '收藏成功！', duration: 2000 });
        } else {
          promptAction.showToast({ message: `收藏失败: ${responseData.message}`, duration: 2000 });
        }
      } else {
        promptAction.showToast({ message: `请求失败，状态码: ${response.responseCode}`, duration: 2000 });
      }
      httpRequest.destroy();
    } catch (error) {
      promptAction.showToast({ message: '网络错误，请稍后重试', duration: 2000 });
    }
  }

  build() {
    Stack() {
      Column() {
        Scroll() {
          Column() {
            Column() {
              Row() {
                Swiper() {
                  Image($r("app.media.img_49"));
                  Image($r("app.media.img_19"));
                  Image($r("app.media.img_20"));
                  Image($r("app.media.img_48"));
                }
                .autoPlay(true)
                .width('100%')
                .height('100%')
                .margin({ bottom: 10 })
                .onChange((index: number) => {
                  this.currentIndex = index;
                })
              }
              .width('100%')

              // .position({ top: 0 }) // 确保轮播图在顶部
              Row() {
                Image($r("app.media.img_47"))
                  .width(24)
                  .height(24)
                  .zIndex(2) // 确保图标在最上层
                  .onClick(() => {
                    router.back();
                  })
                Blank();
                Image($r('app.media.img_14'))
                  .width(24)
                  .height(24)
                  .zIndex(2) // 确保图标在最上层
                  //.margin({ right: 10 })
                  .onClick(() => {
                    router.pushUrl({ url: 'pages/gouwuche' });
                  })
              }
              //.padding({ top: 20, left: 10 })
              .padding({ right: 40 })
              .position({ top: 20, left: 20 }) // 设置图标的相对位置
              .margin({ top: 20 })
              .width('100%')

            }
            .width('100%')
            .height('40%')

            Column() {
              Column({ space: 20 }) {
                Text('创意卫浴五件套 欧式高档卫生间洗漱杯套装浴室用品刷牙杯漱口杯')
                  .fontSize(18)
                  .fontWeight(600)
                Row({ space: 15 }) {
                  //文字
                  Text(`${this.productInfo.price} 币`)
                    .fontSize(24)
                    .fontColor('#FF5E81')
                    .fontWeight(600)
                  Text(`${this.productInfo.price + 50}`)
                    .fontColor('#E0E0E0')
                    .fontSize(18)
                    .fontWeight(600)
                    .decoration({ type: TextDecorationType.LineThrough }) // ← 中划线
                }.width('100%')
                // .padding(10)
                .justifyContent(FlexAlign.Start)

                Row() {
                  Text('距离抢购结束   ')
                    .fontColor('#E0E0E0')
                    .fontSize(18)
                    .fontWeight(600)
                  Text(this.formatTime(this.count))
                    .fontSize(18)
                    .fontColor('#FF5E81')
                    .fontWeight(60);
                }.width('100%')
                .justifyContent(FlexAlign.Start)
              }.width('100%')
              .padding({
                left: 20,
                right: 20,
                top: 10,
                bottom: 10
              })
              .backgroundColor('#FFFFFF')
              .margin({ bottom: 10 })

              Column({ space: 20 }) {
                Row() {
                  Image($r('app.media.img_38'))
                    .width(20)
                    .height(20)
                    .margin({ right: 8 })
                  Text('服务详情')
                    .fontSize(20)
                    .fontWeight(600)
                }.justifyContent(FlexAlign.Start)
                .margin({ top: 10 })
                .width('100%') // 确保Row组件占据100%宽度
                Row({ space: 50 }) {
                  Text('服务')
                    .fontSize(18)
                    .fontWeight(600)
                  Text('24小时内送货 | 15天退货')
                    .fontSize(18)
                    .fontWeight(600)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度

                Row({ space: 50 }) {
                  Text('说明')
                    .fontSize(18)
                    .fontWeight(600)
                  Text('假一赔十 | 7天无理由退货')
                    .fontSize(18)
                    .fontWeight(600)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度

                Row({ space: 50 }) {
                  Text('选择')
                    .fontSize(18)
                    .fontWeight(600)
                  Text('淡金色 【10cm】')
                    .fontSize(18)
                    .fontWeight(600)
                    .fontColor('#FF5E81')
                }
                .justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度
              }.padding({ left: 20, top: 10, bottom: 10 })
              .width('100%')
              .backgroundColor('#FFFFFF')
              .margin({ bottom: 10 })

              //商品参数
              Column({ space: 20 }) {
                Row() {
                  Image($r('app.media.img_38'))
                    .width(20)
                    .height(20)
                    .margin({ right: 8 })
                  Text('商品参数')
                    .fontSize(20)
                    .fontWeight(600)
                  //.margin({top:8})
                }.justifyContent(FlexAlign.Start)
                .margin({ top: 10 })
                .width('100%') // 确保Row组件占据100%宽度
                Row({ space: 50 }) {
                  Text('件数')
                    .fontSize(18)
                    .fontWeight(600)
                  Text('5件')
                    .fontSize(18)
                    .fontWeight(600)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度

                Row({ space: 50 }) {
                  Text('材质')
                    .fontSize(18)
                    .fontWeight(600)
                  Text('树脂、铜')
                    .fontSize(18)
                    .fontWeight(600)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度

                Row({ space: 50 }) {
                  Text('风格')
                    .fontSize(18)
                    .fontWeight(600)
                  Text('欧式')
                    .fontSize(18)
                    .fontWeight(600)
                }
                .justifyContent(FlexAlign.Start)
                .width('100%') // 确保Row组件占据100%宽度
              }.padding({ left: 20, bottom: 10 })
              .width('100%')
              .backgroundColor('#FFFFFF')
              .margin({ bottom: 10 })

              //商品详情
              Column() {
                Row() {
                  Image($r('app.media.img_38'))
                    .width(20)
                    .height(20)
                    .margin({ right: 8 })
                  Text('商品详情')
                    .fontSize(20)
                    .fontWeight(600)
                }
                .justifyContent(FlexAlign.Start)
                .margin({ top: 10 })
                .padding({ left: 20 })
                .width('100%') // 确保Row组件占据100%宽度
                .margin({ bottom: 10 })
                .backgroundColor('#FFFFFF')

                Image($r('app.media.img_50'))
                  .width('100%')
                //猜你喜欢
                //猜你喜欢
                Column({ space: 10 }) {
                  //标题部分
                  Row({ space: 10 }) {
                    Image($r('app.media.img_8'))
                      .width(24)
                      .height(24)
                      .margin({ left: 3, right: 5 })
                    Text('猜你喜欢')
                      .fontSize(18)   //字体大小
                      .fontWeight(600) //字体粗细（加粗）
                  }
                  .padding({ top: 5 })
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
                .margin({ top: 10, bottom: 10 })

                Text('没有更多内容了')
                  .fontSize(18)
                  .fontWeight(600)
                  .fontColor('#E0E0E0')
                  .height(40)
                  .width('93%')
                  .textAlign(TextAlign.Center)
                  .backgroundColor('#FFFFFF')
                  .borderRadius(12)
                  .margin({ left: 10, right: 10 })

              }
            } //.layoutWeight(1)
          }

        }.scrollBar(BarState.Off) // 关闭滚动条显示
        //.layoutWeight(1)
        .height('90%')

        //底部按钮
        Row({}) {
          Row() {
            // 加入购物车
            Image($r('app.media.pinkcar'))
              .width(25)
              .height(25)
              .padding({ left: 10 })
              //.layoutWeight(1)
              .backgroundColor('#FFFFFF')
              .onClick(() => {
                // 点击购物车图标，将商品图片和 value 传入购物车
                this.addToCart();
              })
            // 添加一条灰色竖线
            Line()
              .width(1) // 竖线的宽度
              .height(50) // 竖线的高度
              .backgroundColor('#D3D3D3') // 灰色
            //.layoutWeight(0.1)
            Column() {
              Image($r('app.media.yellowstar'))
                .width(25)
                .height(25)
                .padding({ right: 10 })
                //.layoutWeight(1)
                .backgroundColor('#FFFFFF')
                .onClick(() => {
                  this.addToCollect();

                })
            }
          }
          .justifyContent(FlexAlign.SpaceAround)
          .height(100)
          .width('50%')
          .backgroundColor('#FFFFFF')

          //.margin({ bottom: 20 })

          Column() {
            Button('立即购买')
              .width('50%')
              .height(100)
              //.layoutWeight(1)
              .backgroundColor('#00C9D6')
              .fontColor('#FFFFFF')
              .fontWeight(300)
              .fontSize(16)
              .onClick(() => {
                // 结算逻辑
                // 显示支付弹窗
                this.showPaymentDialog = true;
              })
          }
          .backgroundColor('#00C9D6')

          //.margin({ bottom: 20 })
        }
        .zIndex(1)
        .width('100%')
        //.layoutWeight(1)
        .justifyContent(FlexAlign.Center)

        //.padding({ bottom: 20 }) // 防止按钮被底部导航栏遮挡

      }.width('100%')
      if (this.showPaymentDialog) {
        this.paymentDialog(); // 调用支付弹窗组件
      }
    }
    .height('100%')
    .backgroundColor('#EBFCF9')

  }
}
