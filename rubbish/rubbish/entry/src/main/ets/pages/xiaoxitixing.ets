interface SettingItem {
  title: string;
  description: string;
  isEnabled: boolean;
}

@Entry
@Component
struct NotificationSettings {
  private settings: SettingItem[] = [
    { title: '系统内音效', description: '如系统内刷新、新消息、点赞等音效', isEnabled: true },
    { title: '新消息提醒', description: '关闭后，程序不运行时将无法收到提醒', isEnabled: true },
    { title: '应用内横幅提醒', description: '提醒将以横幅形式展现', isEnabled: false },
    { title: '声音提醒', description: '', isEnabled: false },
    { title: '震动提醒', description: '', isEnabled: true },
  ];

  private saveSettings() {
    console.info('当前设置:', this.settings);
  }

  build() {
    Column() {
      // 顶部导航栏
      Row() {
        Image($r('app.media.fanhui'))
          .margin({ top: 10, left: 4, right: 4 })
          .width(40)
          .height(40);

        Text('消息提醒')
          .fontSize(20)
          .fontWeight(FontWeight.Bold)
          .flexGrow(1)
          .fontColor('#ffffff')
          .margin({ top: 10 })
          .textAlign(TextAlign.Center);

        Button('保存')
          .fontSize(16)
          .fontColor('#FFFFFF')
          .backgroundColor('#2BCDDD')
          .borderRadius(4)
          .margin({ right: 16, top: 10 })
          .onClick(() => this.saveSettings());
      }
      .width('100%')
      .height('10%')
      .backgroundColor('#2BCDDD')
      .alignItems(VerticalAlign.Center);

      // 设置列表容器
      Column() {
        Column({ space: 1 }) {
          ForEach(this.settings, (item: SettingItem, index: number) => {
            Column() {
              Row({ space: 1 }) {
                // 标题和描述列，通过 flexGrow 占满剩余空间，文字自然左对齐
                Column({ space: 1 }) {
                  Text(item.title)
                    .fontSize(16)
                    .fontWeight(FontWeight.Medium)
                    .textAlign(TextAlign.Start); // 明确设置左对齐

                  if (item.description) {
                    Text(item.description)
                      .fontSize(14)
                      .fontColor('#999999')
                      .textAlign(TextAlign.Start); // 描述文字也左对齐
                  }
                }
                .flexGrow(1)
              //  .padding({ left: 12 });

                Toggle({
                  type: ToggleType.Switch,
                  isOn: item.isEnabled
                })
                  .onChange((isOn: boolean) => {
                    this.settings[index].isEnabled = isOn;
                  });
              }
              .width('100%')
              .padding({ top: 16, bottom: 16, left: 16, right: 16 })
              .backgroundColor('#FFFFFF')
              .borderRadius(8)
              .shadow({
                radius: 2,
                color: '#ECECEC',
                offsetX: 0,
                offsetY: 2
              });
            }
            .width('100%')
            .margin({ left: 16, right: 16, bottom: 12 });
          });
        }
        .width('90%')
        .borderRadius(8)
        .margin({ top: 7 });
      }
      .width('100%')
      .backgroundColor('#ECFDFA')
      .height('100%');
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#ECFDFA');
  }
}