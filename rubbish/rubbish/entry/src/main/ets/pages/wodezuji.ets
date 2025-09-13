interface FootprintItem {
  id: number;
  image: Resource;
}

interface FootprintGroup {
  date: string;
  items: FootprintItem[];
}

@Entry
@Component
struct MyFootprintPage {
  // 匹配设计图的数据结构
  private static readonly INITIAL_FOOTPRINTS: FootprintGroup[] = [
    {
      date: '2019-8-12',
      items: [
        { id: 1, image: $r('app.media.clock') },
        { id: 2, image: $r('app.media.fan') },
        { id: 3, image: $r('app.media.crystal') },
        { id: 4, image: $r('app.media.clock') },
        { id: 5, image: $r('app.media.fan') },
      ],
    },
    {
      date: '2019-8-13',
      items: [
        { id: 6, image: $r('app.media.clock') },
        { id: 7, image: $r('app.media.fan') },
        { id: 8, image: $r('app.media.crystal') },
        { id: 9, image: $r('app.media.clock') },
      ],
    },
    {
      date: '2019-8-14',
      items: [
        { id: 10, image: $r('app.media.clock') },
        { id: 11, image: $r('app.media.fan') },
        { id: 12, image: $r('app.media.crystal') },
        { id: 13, image: $r('app.media.clock') },
      ],
    },
  ];

  @State private currentGroups: FootprintGroup[] = MyFootprintPage.INITIAL_FOOTPRINTS;

  private deleteItem(groupIndex: number, itemId: number) {
    const newGroups = [...this.currentGroups];
    const group = newGroups[groupIndex];

    if (group) {
      group.items = group.items.filter(item => item.id !== itemId);
      if (group.items.length === 0) {
        newGroups.splice(groupIndex, 1);
      }
      this.currentGroups = newGroups;
    }
  }

  build() {
    Column() {
      // 顶部标题栏
      Row()
      {
        Row() {
          Image($r('app.media.fanhui'))
            .width(24)
            .height(24)
            .margin({ left: 16 })
            .onClick(() => {
              // 路由返回逻辑（需提前配置 router）
              // router.back();
            });

          Text('我的足迹')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
            .margin({ left: 8 })
            .flexGrow(1)

            .fontColor('#ffffff')

        }
        .width('100%')
        .height(56)
        .margin({top:20})
        .backgroundColor('#2BCDDD')
        .justifyContent(FlexAlign.Center)
      }
      .backgroundColor('#2BCDDD')
      .width('100%')
      .height('10%')

      // 主内容区
      Scroll() {
        Column({ space: 16 }) {
          ForEach(this.currentGroups, (group: FootprintGroup, groupIndex: number) => {
            Column({ space: 12 }) {
              // 日期标题
              Row() {
                Text('|')
                  .fontSize(16)
                  .fontWeight(FontWeight.Bold)
                  .fontColor('#FF6B6B')
                  .margin({ right: 4 });

                Text(group.date)
                  .fontSize(16)
                  .fontWeight(FontWeight.Medium);
              }
.width('100%')
              .padding({ top: 8 });

              // 图片网格
              Grid() {
                ForEach(group.items, (item: FootprintItem, itemIndex: number) => {
                  GridItem() {
                    Stack({ alignContent: Alignment.TopEnd }) {
                      Image(item.image)
                        .width('100%')
                        .height(120)
                        .objectFit(ImageFit.Cover)
                        .borderRadius(8);

                      Button({ type: ButtonType.Circle, stateEffect: true }) {
                        Image($r('app.media.shanchu'))
                          .width(20)
                          .height(20)
                          .fillColor(Color.White);
                      }
                      .width(32)
                      .height(32)
                      .backgroundColor('#FF5757')
                      .margin({ top: 4, right: 4 })
                      .onClick(() => this.deleteItem(groupIndex, item.id));
                    }
                  }
                });
              }
              .columnsTemplate('1fr 1fr 1fr')
              .columnsGap(12)
              .rowsGap(12)
              .padding({ left: 16, right: 16 });
            }
          });
        }
        .width('100%')
        .padding({ bottom: 16 });
      }
      .width('100%')

      .backgroundColor('#ECFDFA');
    }
    .width('100%')
    .height('100%');
  }
}