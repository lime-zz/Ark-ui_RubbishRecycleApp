import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { http } from '@kit.NetworkKit';

// 定义收藏物品的数据结构
interface Type1 {
  img: Resource;
  contents: string;
  value: number;
  amount: string;
  img1: Resource;
  image_key: string; // 添加image_key属性
}

// 商品收藏商品接口
interface CartItem {
  id: number;
  image_key: string;
  product_name: string;
  price: number;
  quantity: number;
}

interface ResponseData {
  data: CartItem[];
  code: number;
  message: string;
}

interface DeleteResponse {
  code: number;
  message: string;
}

// key到图片资源的映射表
const imageMap: Record<string, Resource> = {
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

@Entry
@Component
struct CollectItems {
  @State isLoading: boolean = true; // 添加加载状态
  @State collectItems: CartItem[] = []; // 存储从数据库获取的收藏数据

  // 获取购物车商品图片
  getImageByKey(imageKey: string): Resource {
    return imageMap[imageKey] ?? $r('app.media.img_16'); // 默认图片
  }

  // 页面加载时获取收藏数据
  aboutToAppear() {
    this.getCollectData();
  }

  // 从数据库获取收藏数据
  async getCollectData(): Promise<void> {
    try {
      this.isLoading = true;
      const httpRequest = http.createHttp();
      const response = await httpRequest.request(
        'http://192.168.32.1:8080/api/collect/get',
        {
          method: http.RequestMethod.GET,
          header: {
            'Content-Type': 'application/json',
          },
        }
      );

      if (response.responseCode === 200) {
        const collectResponse = JSON.parse(response.result.toString()) as ResponseData;
        if (collectResponse.code === 0) {
          this.collectItems = collectResponse.data; // 取消注释，启用数据加载
        } else {
          promptAction.showToast({ message: `获取收藏数据失败: ${collectResponse.message}`, duration: 2000 });
        }
      } else {
        promptAction.showToast({ message: `请求失败，状态码: ${response.responseCode}`, duration: 2000 });
      }

      httpRequest.destroy();
    } catch (error) {
      console.error('获取收藏数据失败:', error);
      promptAction.showToast({ message: '网络错误，请稍后重试', duration: 2000 });
    } finally {
      this.isLoading = false;
    }
  }

  // 删除收藏商品
  async deleteCollectItem(imageKey: string): Promise<void> {
    try {
      const httpRequest = http.createHttp();
      const response = await httpRequest.request(
        'http://192.168.32.1:8080/api/collect/delete',
        {
          method: http.RequestMethod.DELETE,
          header: {
            'Content-Type': 'application/json',
          },
          extraData: JSON.stringify({
            image_key: imageKey
          }),
        }
      );

      if (response.responseCode === 200) {
        const deleteResponse = JSON.parse(response.result.toString()) as DeleteResponse;
        if (deleteResponse.code === 0) {
          promptAction.showToast({ message: '商品删除成功', duration: 2000 });
          // 重新获取收藏数据以刷新 UI
          await this.getCollectData();
        } else {
          promptAction.showToast({ message: `删除失败: ${deleteResponse.message}`, duration: 2000 });
        }
      } else {
        promptAction.showToast({ message: `删除请求失败，状态码: ${response.responseCode}`, duration: 2000 });
      }

      httpRequest.destroy();
    } catch (error) {
      console.error('删除收藏商品失败:', error);
      promptAction.showToast({ message: '网络错误，请稍后重试', duration: 2000 });
    }
  }

  @Builder
  hotItems(item: Type1) {
    Row({ space: 10 }) {
      Image(item.img)
        .width(150)
        .height(150)
        .borderRadius(12)

      Column() {
        Row() {
          Text(item.contents)
            .fontSize(14)
            .fontColor('#000000')
            .width('100%')
            .textAlign(TextAlign.Start)
            .padding({ left: 15 })
          // Blank()

          Image(item.img1)
            .width(15)
            .height(15)
            //.margin({left:20})
            .onClick(() => {
              // 删除商品 - 现在可以使用item.image_key了
              this.deleteCollectItem(item.image_key);
            })
        }
        .width('100%')
        .margin ({top:12,bottom:12,left:12,right:50})
        //.justifyContent(FlexAlign.SpaceBetween);

        Text(item.amount)
          .fontSize(14)
          .fontColor('#000000')
          .width('100%')
          .textAlign(TextAlign.Start) // 设置文本右对齐
          .margin(12)

        Column() {
          Text(`${item.value}币`)
            .fontSize(18)
            .fontColor('#FF5E81')
            .width('100%')
            .textAlign(TextAlign.Start)
        }
        .width('100%')
        .margin(12)
        .justifyContent(FlexAlign.Start); // 使行内的内容右对齐

      }
      .layoutWeight(1)
    }
    .width('90%')
    .backgroundColor('#FFFFFF')
    .borderRadius(12)
    .margin({bottom:10})
  }

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.img_18'))
          .width(24)
          .height(24)
          .margin({ right: 10 })
          .onClick(() => {
            router.back();
          })
        Text('我的收藏')
          .fontSize(20)
          .fontWeight(500)
          .fontColor('#FFFFFF');
      }
      .width('100%')
      .height(100)
      .backgroundColor('#2BCDDC')
      .padding({ left: 16 })
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Center);

      // 收藏商品列表
      Scroll() {
        Column() {
          if (this.isLoading) {
            // 加载状态显示
            Column() {
              Text('加载中...')
                .fontSize(16)
                .fontColor('#666')
                .margin({ top: 50 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Center)
          } else if (this.collectItems.length === 0) {
            // 空状态显示
            Column() {
              Text('暂无收藏商品')
                .fontSize(16)
                .fontColor('#666')
                .margin({ top: 50 })
            }
            .width('100%')
            .alignItems(HorizontalAlign.Center)
          } else {
            // 显示收藏商品列表
            ForEach(this.collectItems, (item: CartItem) => {
              this.hotItems({
                img: this.getImageByKey(item.image_key),
                contents: item.product_name,
                value: item.price,
                amount: `${item.quantity}人已兑换`,
                img1: $r('app.media.delete'),
                image_key: item.image_key // 传递image_key
              });
            })
          }
        }
      }
      .scrollBar(BarState.Off)
      .width('100%')
      .height('80%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#EBFCF9')
  }
}