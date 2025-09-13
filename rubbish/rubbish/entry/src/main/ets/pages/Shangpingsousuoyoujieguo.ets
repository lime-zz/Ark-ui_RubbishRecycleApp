// MainAbility/index.ets
import  router  from '@ohos.router';
// 类型定义（必须放在组件外部）
interface FanItem {
  id: number;
  name: string;
  image: Resource;
  price: number;
}

@Entry
@Component

export struct FanExchangePage {
  @State searchText: string = '风扇'


  private fanList: FanItem[] = [
  {
    id: 1,
    name: '手持小风扇',
    image: $r('app.media.imgtu4'),
    price: 200
  },
  {
    id: 2,
    name: '空气循环风扇',
    image: $r('app.media.imgtu4'),
    price: 200
  }
];

  // 跳转到搜索结果页
  navigateToSearchResult() {
    if (this.searchText.trim()) {
      router.pushUrl({
        url: 'pages/SearchResultPage',
        params: { keyword: this.searchText }
      });
    }
  }

  build() {
    Column() {
      // 顶部搜索栏 - 蓝绿色背景
      Row() {
        Image($r('app.media.return'))
          .width(24)
          .height(24)
          .margin({ left: 12 })

        Search({
          placeholder: '搜索',
          value: this.searchText
        })
          .onChange((value: string) => {
            this.searchText = value
          })
          .layoutWeight(1)
          .margin({ left: 8, right: 8 })

        Button('搜索')
          .fontSize(16)
          .margin({ right: 12 })
          .onClick(() => this.navigateToSearchResult())
      }
      .width('100%')
      .height(100)
      .backgroundColor('#0fb9a8')
      .alignItems(VerticalAlign.Center)

      // 主体内容 - 白色背景

        Column() {
          // 可兑换商品标题
          Text('可兑换商品')
            .fontSize(18)
            .fontWeight(FontWeight.Bold)
            .margin({ left:10, top: 16, bottom: 12 })
            .width('100%')

          // 商品列表
          List() {
            ForEach(this.fanList, (item: FanItem) => {
              ListItem() {
                Row() {
                  // 商品图片
                  Image(item.image)
                    .width(80)
                    .height(80)
                    .objectFit(ImageFit.Contain)
                    .margin({ right: 12 })

                  // 商品信息
                  Column() {
                    // 商品名称 - "风扇"二字粉色
                    Text(this.highlightFanText(item.name))
                      .fontSize(16)
                      .margin({ bottom: 4 })

                    // 价格 - 粉色
                    Text(`${item.price}币`)
                      .fontSize(14)
                      .fontColor('#ff6b81')
                  }
                  .layoutWeight(1)

                  // 兑换按钮 - 蓝绿色
                  Button('兑换', { type: ButtonType.Capsule })
                    .width(80)
                    .backgroundColor('#0fb9a8')
                    .fontColor(Color.White)
                }
                .padding(12)
                .width('100%')
              }
            })
          }
          .width('100%')
          .divider({ strokeWidth: 1, color: '#f0f0f0' })
        }
        .margin({top:20})
        .height(300)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ffffff')
  }

  // 高亮"风扇"文字为粉色
  private highlightFanText(name: string): string {
    return name.replace('风扇', '风扇');
  }
}