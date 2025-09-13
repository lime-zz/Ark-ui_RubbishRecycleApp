
import router from "@ohos.router"
import promptAction from '@ohos.promptAction'; // OpenHarmony 提供的系统 API
import { http } from '@kit.NetworkKit';
interface Type1 {
  img: Resource;
  contents:string;
  dvalue: string;
  cvalue: string;
  amount:string;
  avalue:string;
  img1:Resource;
  selected: boolean; // 添加选中状态
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

interface CartResponse {
  code: number;
  data: CartItem[];
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
struct Gouwuche {
  @State message: string = 'Hello World';
  @State isSelectedAll: boolean = false;
  @State isLoading: boolean = true; // 添加加载状态
  @State cartItems: CartItem[] = []; // 存储从数据库获取的购物车数据
  @State showPaymentDialog: boolean = false; // 控制支付弹窗显示

  // 更新选中状态的方法
  updateSelection() {
    this.isSelectedAll = this.datas.every(item => item.selected);
  }

  // 更新单个商品选中状态
  toggleSelection(index: number) {
    const newDatas: Type1[] = this.datas.map((item, i) => {
      return {
        img: item.img,
        contents: item.contents,
        dvalue: item.dvalue,
        cvalue: item.cvalue,
        amount: item.amount,
        avalue: item.avalue,
        img1: item.img1,
        selected: (i === index) ? !item.selected : item.selected
      } as Type1;
    });

    this.datas = newDatas;
    this.updateSelection();
  }

  // 更新全选状态
  toggleSelectAll() {
    const newSelectedState = !this.isSelectedAll;

    const newDatas: Type1[] = this.datas.map((item: Type1): Type1 => {
      return {
        img: item.img,
        contents: item.contents,
        dvalue: item.dvalue,
        cvalue: item.cvalue,
        amount: item.amount,
        avalue: item.avalue,
        img1: item.img1,
        selected: newSelectedState
      } as Type1;
    });

    this.datas = newDatas;
    this.isSelectedAll = newSelectedState;
  }

  @State isChecked: boolean = false;
  @State datas: Type1[] = [
    {
      img: $r('app.media.img_16'),
      contents: '创意卫浴五件套 欧式高档卫生...',
      dvalue: '250币',
      cvalue: '200币',
      amount: 'X2',
      avalue: '400币',
      img1: $r('app.media.lajitong'),
      selected: false
    },
  // 其他商品数据...
  ];

  // 从数据库获取购物车数据
  async getCartData(): Promise<void> {
    try {
      this.isLoading = true;
      const httpRequest = http.createHttp();
      const response = await httpRequest.request(
        'http://192.168.32.1:8080/api/cart/get',
        {
          method: http.RequestMethod.GET,
          header: {
            'Content-Type': 'application/json',
          },
        }
      );

      if (response.responseCode === 200) {
        const cartResponse: CartResponse = JSON.parse(response.result.toString());
        if (cartResponse.code === 0) {
          this.cartItems = cartResponse.data;
          // 将数据库数据转换为UI显示数据
          this.updateDisplayData();
        } else {
          promptAction.showToast({ message: `获取购物车数据失败: ${cartResponse.message}`, duration: 2000 });
        }
      } else {
        promptAction.showToast({ message: `请求失败，状态码: ${response.responseCode}`, duration: 2000 });
      }

      httpRequest.destroy();
    } catch (error) {
      console.error('获取购物车数据失败:', error);
      promptAction.showToast({ message: '网络错误，请稍后重试', duration: 2000 });
    } finally {
      this.isLoading = false;
    }
  }

  // 删除购物车商品
  async deleteCartItem(imageKey: string): Promise<void> {
    try {
      const httpRequest = http.createHttp();
      const response = await httpRequest.request(
        'http://192.168.32.1:8080/api/cart/delete',
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
        const deleteResponse: DeleteResponse = JSON.parse(response.result.toString());
        if (deleteResponse.code === 0) {
          promptAction.showToast({ message: '商品删除成功', duration: 2000 });
          // 重新获取购物车数据
          await this.getCartData();
        } else {
          promptAction.showToast({ message: `删除失败: ${deleteResponse.message}`, duration: 2000 });
        }
      } else {
        promptAction.showToast({ message: `删除请求失败，状态码: ${response.responseCode}`, duration: 2000 });
      }

      httpRequest.destroy();
    } catch (error) {
      console.error('删除购物车商品失败:', error);
      promptAction.showToast({ message: '网络错误，请稍后重试', duration: 2000 });
    }
  }

  // 将数据库数据转换为UI显示数据
  updateDisplayData(): void {
    this.datas = this.cartItems.map((item: CartItem): Type1 => {
      return {
        img: this.getImageByKey(item.image_key), // 根据image_key映射
        contents: item.product_name,
        dvalue: `${item.price}币`, // 原价
        cvalue: `${item.price}币`, // 现价（这里假设没有折扣）
        amount: `X${item.quantity}`,
        avalue: `${item.total_price}币`,
        img1: $r('app.media.lajitong'),
        selected: false
      } as Type1;
    });
  }

  // 获取购物车商品图片
  getImageByKey(imageKey: string): Resource {
    return imageMap[imageKey] ?? $r('app.media.img_16'); // 默认图片
  }

  // 页面加载时获取购物车数据
  aboutToAppear() {
    this.getCartData();
  }

  // 计算选中商品的总价
  calculateTotalPrice(): string {
    const selectedItems: Type1[] = this.datas.filter((item: Type1): boolean => item.selected);
    const total: number = selectedItems.reduce((sum: number, item: Type1): number => {
      // 从avalue中提取价格数字
      const price: number = parseInt(item.avalue.replace('币', ''));
      return sum + (isNaN(price) ? 0 : price);
    }, 0);
    return `${total}币`;
  }

  // 获取选中商品数量
  getSelectedItemCount(): number {
    return this.datas.filter((item: Type1): boolean => item.selected).length;
  }

  // 确认支付
  confirmPayment(): void {
    const selectedItems = this.datas.filter((item: Type1): boolean => item.selected);
    const totalPrice = this.calculateTotalPrice();

    // 这里可以添加实际的支付逻辑
    console.log('确认支付，总价：', totalPrice);
    console.log('选中商品：', selectedItems);

    promptAction.showToast({ message: `支付成功！总价：${totalPrice}`, duration: 3000 });
    // 关闭支付弹窗
    this.showPaymentDialog = false;
    // 支付成功后，可以清空选中的商品或跳转到支付成功页面
    // 这里简单地将选中商品从购物车中移除
    this.removeSelectedItems();
  }

  // 移除选中的商品
  async removeSelectedItems(): Promise<void> {
    const selectedItems = this.datas.filter((item: Type1): boolean => item.selected);

    // 收集所有需要删除的 image_key
    const imageKeysToDelete: string[] = [];

    for (const item of selectedItems) {
      const index = this.datas.indexOf(item);
      if (index !== -1 && this.cartItems[index]) {
        imageKeysToDelete.push(this.cartItems[index].image_key);
      }
    }

    // 批量删除所有选中的商品
    for (const imageKey of imageKeysToDelete) {
      await this.deleteCartItem(imageKey);
    }

    // 显示批量删除成功提示
    if (imageKeysToDelete.length > 0) {
      promptAction.showToast({ message: `成功支付 ${imageKeysToDelete.length} 件商品`, duration: 2000 });
    }

    // 重新获取购物车数据以刷新 UI
    await this.getCartData();
  }
  // UI
  @Builder
  hotItems(item: Type1, index: number) {
    Row({ space: 10 }) {
      Checkbox()
        .select(item.selected)
        .onChange((checked: boolean) => {
          item.selected = checked;
          this.toggleSelection(index); // 更新单个商品的选中状态
        })
      Image(item.img)
        .width(120)
        .height(120)
        .borderRadius(12)
        .margin({ top: 10, bottom: 10 })

      Column({ space: 10 }) {
        Text(item.contents)
          .fontSize(14)
          .fontColor('#000000')
          .width('100%')
          .textAlign(TextAlign.End)
          .padding({ right: 20 })

        Row({ space: 20 }) {
          Text(item.dvalue)
            .fontSize(14)
            .fontColor('#E0E0E0')
            .decoration({ type: TextDecorationType.LineThrough }) // ← 中划线
            .textAlign(TextAlign.End) // 设置文本右对齐
          Text(item.cvalue)
            .fontSize(14)
            .fontColor('#000000')
            .textAlign(TextAlign.End) // 设置文本右对齐
        }
        .width('100%')
        .padding({ right: 20 })
        .justifyContent(FlexAlign.End); // 使行内的内容右对齐

        Text(item.amount)
          .fontSize(14)
          .fontColor('#000000')
          .width('100%')
          .textAlign(TextAlign.End) // 设置文本右对齐
          .padding({ right: 20 })

        Row({ space: 20 }) {
          Text(item.avalue)
            .fontSize(18)
            .fontColor('#FF5E81')
            .textAlign(TextAlign.End)
          Image(item.img1)
            .width(15)
            .height(15)
            .onClick(() => {
              // 删除商品
              this.deleteCartItem(this.cartItems[index].image_key);
            })
        }
        .width('100%')
        .padding({ right: 20 })
        .justifyContent(FlexAlign.End);
      }
      .layoutWeight(1)
    }
    .width('90%')
    .backgroundColor('#FFFFFF')
    .borderRadius(12)
    .margin(10)
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
        Text(`选中商品：${this.getSelectedItemCount()}件`)
          .fontSize(16)
          .fontColor('#666666');
        Text(`总价：${this.calculateTotalPrice()}`)
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
            this.confirmPayment(); // 调用支付逻辑
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


  // UI
  build() {
    Stack() {
      Column({ space: 10 }) {
        // 顶部导航栏保持不变
        Row() {
          Image($r("app.media.img2_10"))
            .width(12)
            .height(24)
            .zIndex(1)
            .margin({ right: 10 })
            .onClick(() => {
              router.back();
            })
          Text('购物车')
            .fontSize(30)
            .fontWeight(600)
            .fontColor($r('sys.color.white'))
        }
        .margin({ top: 25 })
        .padding({
          top: 20,
          right: 10,
          bottom: 20,
          left: 10
        })
        .width('100%')
        .justifyContent(FlexAlign.Start);

        // 设置一个固定高度的容器用于滚动内容
        Column() {
          // 购物车列表区域 - 使用固定高度的Scroll
          Scroll() {
            Column() {
              if (this.datas.length === 0) {
                // 空购物车状态
                Column() {
                  Image($r('app.media.img_16'))
                    .width(100)
                    .height(100)
                    .opacity(0.5)
                  Text('购物车为空')
                    .fontSize(18)
                    .fontColor('#666666')
                    .margin({ top: 20 })
                  Text('快去添加一些商品吧！')
                    .fontSize(14)
                    .fontColor('#999999')
                    .margin({ top: 10 })
                }
                .width('100%')
                .height('100%')
                .justifyContent(FlexAlign.Center)
                .alignItems(HorizontalAlign.Center)
              } else {
                // 商品列表
                List() {
                  ForEach(this.datas, (item: Type1, index: number) => {
                    ListItem() {
                      this.hotItems(item, index)
                    }
                  })
                }
              }
            }
            .width('100%')
          }
          .scrollBar(BarState.Off)
          .height('75%') // 关键：设置固定高度，留出空间给底部按钮
        }
        .width('100%')

        // 全选和结算按钮区域 - 固定在底部
        Row({}) {
          Row() {
            // 添加"全选"复选框
            Checkbox()
              .select(this.isSelectedAll) // 全选复选框的状态与是否全选同步
              .padding({ left: 20 })
              .onChange((checked: boolean) => {
                this.toggleSelectAll(); // 当点击复选框时切换全选状态
              })
            Button(`${this.isSelectedAll ? '取消全选' : '全选'}`)
              .width('37%')
              .height(110)
              .fontSize(16)
              .fontColor('#000000')
              .fontWeight(300)
              .backgroundColor('#FFFFFF')
              .onClick(() => {
                this.toggleSelectAll(); // 切换全选状态
              })
          }
          .backgroundColor('#FFFFFF')
          .margin({ bottom: 20 })

          Column() {
            Button('立即结算')
              .width('50%')
              .height(110)
              .backgroundColor('#00C9D6')
              .fontColor('#FFFFFF')
              .fontWeight(300)
              .fontSize(16)
              .onClick(() => {
                // 检查是否有选中的商品
                const selectedItems = this.datas.filter((item: Type1) => item.selected);
                if (selectedItems.length === 0) {
                  promptAction.showToast({ message: '请先选择要结算的商品', duration: 2000 });
                  return;
                } else {
                  // 显示支付弹窗
                  this.showPaymentDialog = true;
                }
              })
            // 支付弹窗
            if (this.showPaymentDialog) {
              this.paymentDialog(); // 调用支付弹窗组件
            }
          }
          .backgroundColor('#00C9D6')
          .margin({ bottom: 20 })
        }
        .zIndex(1)
        .width('100%')
        .justifyContent(FlexAlign.Center)

        // 支付弹窗
        if (this.showPaymentDialog) {
          this.paymentDialog(); // 调用支付弹窗组件
        }

      }
      .width('100%')
      .height('100%')
      .backgroundColor('#EBFCF9')
      .backgroundImage($r('app.media.bk'))
      .backgroundImageSize({ width: '100%', height: '25%' })
      // 支付弹窗
      if (this.showPaymentDialog) {
        this.paymentDialog(); // 调用支付弹窗组件
      }
    }
    .width('100%')
    .height('100%')
  }
}