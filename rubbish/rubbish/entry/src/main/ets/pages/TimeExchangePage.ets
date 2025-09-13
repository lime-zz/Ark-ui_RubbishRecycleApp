import router  from '@kit.ArkUI';
import http from '@ohos.net.http';          // 正确导入 http
import promptAction from '@ohos.promptAction'; // 正确导入弹窗

// 补充接口定义（确保类型完整）
interface DateInfo {
  date: string;
  time: string;
  status: string;
}

interface ApiProduct {
  id: number;
  title: string;
  exchangedPeople: number;
  points: number;
  originalPoints: number;
  progress: number;
  status: string;
  totalCount: number;
  activityDate: string;
}

interface ProductInfo {
  id: number;
  img: Resource;
  title: string;
  exchangedPeople: number;
  points: number;
  originalPoints: number;
  progress: number;
  status: string;
  buttonText: string;
  buttonEnabled: boolean;
  totalCount: number;
  activityDate: string;
}

interface ApiResponse<T> {
  code: number;
  data: T;
  message?: string;
}

@Entry
@Component
export struct TimedExchangePage {
  @State currentIndex: number = 0;
  @State userId: number = 123;
  @State isLoading: boolean = false;

  @State dates: DateInfo[] = [
    { date: '7.8', time: '20:00', status: '进行中' },
    { date: '7.9', time: '20:00', status: '进行中' },
    { date: '7.10', time: '20:00', status: '未开始' },
    { date: '7.12', time: '20:00', status: '未开始' },
    { date: '7.15', time: '20:00', status: '未开始' }
  ];

  @State products: ProductInfo[] = [];

  aboutToAppear() {
    this.loadProducts(this.dates[this.currentIndex].date);
  }

  async loadProducts(date: string) {
    this.isLoading = true;
    try {
      // 创建 HTTP 请求（修正 API 导入后）
      let httpRequest = http.createHttp();
      let url = `http://192.168.32.1:8080/api/exchange/items?date=${date}`;

      let response = await httpRequest.request(url, {
        method: http.RequestMethod.GET // 修正：使用 http 模块的 RequestMethod
      });

      // 明确响应类型
      let result: ApiResponse<ApiProduct[]> = JSON.parse(response.result as string);

      if (result.code === 0) {
        this.products = result.data.map((item: ApiProduct): ProductInfo => ({
          id: item.id,
          img: this.getProductImage(item.id),
          title: item.title,
          exchangedPeople: item.exchangedPeople,
          points: item.points,
          originalPoints: item.originalPoints,
          progress: item.progress,
          status: item.status === '进行中' ? `已兑${item.progress}%` : '未开始',
          buttonText: item.status === '进行中' ? '马上兑' : '未开始',
          buttonEnabled: item.status === '进行中',
          totalCount: item.totalCount,
          activityDate: item.activityDate
        }));
      } else {
        // 修正：使用 promptAction 正确弹窗
        promptAction.showToast({ message: result.message || "获取商品失败" });
      }
    } catch (e) {
      console.error("加载商品失败:", e);
      promptAction.showToast({ message: "网络错误，请重试" });
    } finally {
      this.isLoading = false;
    }
  }

  getProductImage(id: number): Resource {
    return $r('app.media.iceball');
  }

  async exchangeItem(itemId: number) {
    try {
      let httpRequest = http.createHttp();
      let url = "http://192.168.32.1:8080/api/exchange";

      let response = await httpRequest.request(url, {
        method: http.RequestMethod.POST,
        extraData: {
          itemId: itemId,
          userId: this.userId
        },
        header: {
          "Content-Type": "application/json"
        }
      });

      let result: ApiResponse<null> = JSON.parse(response.result as string);

      if (result.code === 0) {
        promptAction.showToast({ message: "兑换成功" });
        this.updateProductAfterExchange(itemId);
      } else {
        promptAction.showToast({ message: result.message || "兑换失败" });
      }
    } catch (e) {
      console.error("兑换失败:", e);
      promptAction.showToast({ message: "网络错误，请重试" });
    }
  }

  updateProductAfterExchange(itemId: number) {
    const index = this.products.findIndex(item => item.id === itemId);
    if (index !== -1) {
      this.products[index].exchangedPeople += 1;
      this.products[index].progress = Math.round(
        (this.products[index].exchangedPeople / this.products[index].totalCount) * 100
      );
      this.products[index].status = `已兑${this.products[index].progress}%`;

      if (this.products[index].exchangedPeople >= this.products[index].totalCount) {
        this.products[index].buttonEnabled = false;
        this.products[index].buttonText = '已兑完';
      }

      this.products = [...this.products];
    }
  }

  build() {
    Column() {
      // 顶部标题栏
      Row() {
        Text('限时兑换')
          .fontSize(20)
          .fontColor(Color.White)
          .fontWeight(FontWeight.Bold)
      }
      .padding({ left: 16, right: 16, top: 33, bottom: 8 })
      .width('100%')
      .backgroundColor('#2BCDDD')

      // 日期选择
      Scroll() {
        Row() {
          ForEach(this.dates, (item: DateInfo, index: number) => {
            Column() {
              Text(item.date)
                .fontSize(14)
                .fontColor(this.currentIndex === index ? '#FF69B4' : Color.White)

              Text(item.time)
                .fontSize(18)
                .fontWeight(FontWeight.Bold)
                .fontColor(this.currentIndex === index ? '#FF69B4' : Color.White)
                .margin({ top: 4 })

              Text(item.status)
                .fontSize(12)
                .fontColor(this.currentIndex === index ? '#FF69B4' : Color.White)
                .margin({ top: 4 })
            }
            .padding(15)
            .onClick(() => {
              if (!this.isLoading) {
                this.currentIndex = index;
                this.loadProducts(item.date);
              }
            })
          })
        }
      }
      .scrollable(ScrollDirection.Horizontal)
      .width('100%')
      .backgroundColor('#2BCDDD')

      // 商品列表
      if (this.isLoading) {
        Column() {
          Progress({ value: 0 })
            .width(100)
            .height(100)
        }
        .width('100%')
        .height('100%')
        .justifyContent(FlexAlign.Center)
      } else {

        Swiper() {
          ForEach(this.dates, (dateItem: DateInfo, index: number) => {
            Column() {
              List({ space: 12 }) {
                ForEach(this.products, (product: ProductInfo) => {
                  ListItem() {
                    Column({space:10}) {
                      Row() {
                        Image(product.img)
                          .width(80)
                          .height(80)
                          .margin({ right: 9, left: 9, top: 9 })

                        Column() {
                          Text(product.title)
                            .fontSize(16)
                            .fontColor('#333')
                            .margin({ bottom: 8 })
                            .textAlign(TextAlign.Start)
                            .width('100%')

                          Row() {
                            Text(`${product.exchangedPeople}人已兑换`)
                              .fontSize(12)
                              .fontColor('#999')
                              .textAlign(TextAlign.Start)
                              .width('100%')
                          }

                          // 币和按钮
                          Row() {
                            Text(`${product.points} 币`)
                              .fontSize(22)
                              .fontColor('#E02020')
                              .margin({ left: 2, right: 130, top: 5 })

                            Blank()

                            Button(product.buttonText, {
                              type: ButtonType.Normal,
                              stateEffect: product.buttonEnabled
                            })
                              .height(24)
                              .fontColor(Color.White)
                              .fontSize(12)
                              .backgroundColor('#2BCDDD')
                              .opacity(product.buttonEnabled ? 1 : 0.7)
                              .margin({ right: 0 })
                              .onClick(() => {
                                if (product.buttonEnabled) {
                                  this.exchangeItem(product.id);
                                }
                              })
                          }
                          .justifyContent(FlexAlign.SpaceBetween)

                          // 原价和进度条
                          Row() {
                            Text(`${product.originalPoints}`)
                              .fontSize(12)
                              .fontColor('#999')
                              .decoration({ type: TextDecorationType.LineThrough })
                              .margin({ left: 2, right: 170 })

                            Column() {
                              Progress({
                                value: product.progress,
                                total: 100,
                                type: ProgressType.Linear
                              })
                                .width(70)
                                .height(4)
                                .margin({ left: 2, right: 2 })

                              Text(product.status)
                                .fontSize(12)
                                .fontColor('#999')
                                .margin({ right: 8 })
                            }
                            .margin({ right: 2 })
                          }
                          .margin({ top: 3 })
                        }
                        .layoutWeight(1)
                      }
                      .padding(16)
                      .width('100%')
                      .borderRadius(8)
                      .backgroundColor(Color.White)


                    }
                  }
                })
              }
              .width('100%')
              .height('100%')
              .divider({ strokeWidth: 0.5, color: '#EEE' })
            }
            .width('100%')
            .height('100%')
          })
        }
        .index(this.currentIndex)
        .autoPlay(false)
        .indicator(false)
        .onChange((index: number) => {
          if (!this.isLoading) {
            this.currentIndex = index;
            this.loadProducts(this.dates[index].date);
          }
        })
        .margin({ top: 12 })
        .layoutWeight(1)
      }
    }
    .height('100%')
    .backgroundColor('#F5F5F5')
    .padding({ bottom: 12 })
  }
}