import router from "@ohos.router"
import common from '@ohos.app.ability.common';
import http from '@ohos.net.http';
import promptAction from '@ohos.promptAction';
import preferences from '@ohos.data.preferences';
interface Type1 {
  img: Resource;
}
@Entry
@Component
export struct Gerenxinxixiugai {
  @State message: string = 'Hello World';
  @State nickname: string   = '';
  @State gender: string    = '';
  @State index: number   = 0;
  @State account: string = '未登录'; // 显示的用户名
  private storage: preferences.Preferences | null = null; // 存储实例

  // 页面加载时读取用户名（和“我的”页面逻辑一致）
  aboutToAppear() {
    this.loadUserInfo(); // 调用读取方法
  }

  // 从preferences读取用户名（复用“我的”页面逻辑）
  async loadUserInfo() {
    try {
      const context = getContext(this); // 获取上下文
      this.storage = await preferences.getPreferences(context, 'userInfo'); // 打开存储实例
      const username = await this.storage.get('currentUser', '未登录'); // 读取键为currentUser的值
      this.account = username as string; // 赋值给状态变量
      console.info('设置页面读取用户名成功:', this.account);
    } catch (error) {
      console.error('设置页面读取用户名失败:', error);
      this.account = '未登录';
    }
  }
  @State datas:Type1[] = [
    {img:$r('app.media.img_19')},
    {img:$r('app.media.img_20')},
    {img:$r('app.media.img_21')},
    {img:$r('app.media.img_22')},
    {img:$r('app.media.img_23')},
    {img:$r('app.media.img_24')},
  ]

  // 当前头像
  @State currentAvatar: Resource = $r('app.media.face');
  // 选中的图片索引
  @State selectedIndex: number = -1;
  // 是否显示选择器
  @State showSelector: boolean =false;
  // 获取应用上下文
  private context = getContext(this) as common.UIAbilityContext;
  //UI
  @Builder
  hotItems(data:Type1,index: number) {
    Row({ space: 10 }) {
      Image(data.img)
        .width(90)
        .height(90)
        .borderRadius(12)

    }
  }



  build() {
    Column() {
      Row() {
        Image($r('app.media.return'))
          .width(20)
          .height(20)
          .zIndex(1) // 确保图标在最上层
          .margin({ right: 8 ,top:6})
          .onClick(() => {
            router.back()
          })
        Text('个人信息修改')
          .fontSize(20)
          .fontWeight(600)
          .fontColor($r('sys.color.white'))
        Blank();
        Text('提交')
          .fontSize(20)
          .fontWeight(600)
          .fontColor($r('sys.color.white'))
          .margin({ right: 10 })
          .onClick(() => {
            promptAction.showToast({ message: `提交成功！`, duration: 3000 });
          });
      }
      .padding({
        top: 30,
        right: 10,
        bottom: 20,
        left: 10
      })
      .width('100%')
      .height(100)
      .backgroundColor('#2BD7DD')
      .justifyContent(FlexAlign.Start);

      Column({ space: 10 }) {
        Column() {
          //当前头像显示
          Image(this.currentAvatar)
            .height(100)
            .width(100)
            .borderRadius(50)
            .margin(15)
            .objectFit(ImageFit.Cover)
            .onClick(() => {
              this.showSelector = true; //显示选择器
            })
          //打开选择器按钮
          Button('更改头像')
            .fontSize(18)
            .fontColor('#FF5E81')
            .backgroundColor('#FFFFFF')
            .margin({ bottom: 10 })
            .onClick(() => {
              this.showSelector = true; //显示选择器
            })
          //图片选择器弹窗
          if (this.showSelector) {
            Column() {
              Row() {
                Image($r('app.media.img_18'))
                  .width(24)
                  .height(24)
                  .zIndex(1) // 确保图标在最上层
                  .margin({ right: 10 })
                  .onClick(() => {
                    this.showSelector = false; // 关闭选择器
                    this.selectedIndex = -1; // 重置选中索引
                  })

                Text('所有照片及视频')
                  .fontSize(25)
                  .fontWeight(60)
                  .fontColor($r('sys.color.black'))

                Blank();
                Button('完成')
                  .fontSize(20)
                  .fontWeight(60)
                  .fontColor('#000000')
                  .backgroundColor('#FF5E81')
                  .margin({
                    left: 15,
                    right: 15,
                    top: 8,
                    bottom: 8
                  })
                  .enabled(this.selectedIndex !== -1)
                  .onClick(() => {
                    this.confirmSelection(); // 确认选择
                  })
              }
              .padding({
                //top: 20,
                right: 10,
                bottom: 20,
                left: 10
              })
              .width('100%')
              .justifyContent(FlexAlign.Start);

              Grid() {
                ForEach(this.datas, (item: Type1, index: number) => {
                  GridItem() {
                    Image(item.img)
                      .width(80)
                      .height(80)
                      .borderRadius(5)
                      .border({
                        width: this.selectedIndex === index ? 2 : 0,
                        color: '#007DFF'
                      })
                      .onClick(() => {
                        this.selectedIndex = index; // 更新选中索引
                      })
                  }
                  //.width('33%')
                }, (item: Resource, index: number) => index.toString())
              }
              .columnsTemplate('1fr 1fr 1fr 1fr') // 四列
              .columnsGap(10) // 列间距
              .rowsGap(10) // 行间距
             // .height('60%')
              .margin(10)
              /*
              Row() {
                Button('取消')
                  .width(120)
                  .height(40)
                  .backgroundColor('#FF5E81')
                  .onClick(() => {
                    this.showSelector = false; // 关闭选择器
                    this.selectedIndex = -1; // 重置选中索引
                  })

                Button('确定')
                  .width(120)
                  .height(40)
                  .backgroundColor('#FF5E81')
                  .margin({ left: 20 })
                  .enabled(this.selectedIndex !== -1)
                  .onClick(() => {
                    this.confirmSelection(); // 确认选择
                  })
              }
              .margin(20)
              */
            }
            .width('100%')
            .height('100%')
            .backgroundColor('#EBFCF9')
            .borderRadius(12)
            .margin(10)
            .justifyContent(FlexAlign.Center) // 水平居中
            .zIndex(1)
          }
        }
        .width('95%')
        .backgroundColor('#FFFFFF')
        .borderRadius(12)
        .margin(10)
        .justifyContent(FlexAlign.Center) // 水平居中

      }

      Column() {
        Row() {
          Text('用户昵称')
            .fontSize(18)
            .fontColor('#000000')
            .margin({left:20})
          // 用户昵称输入框
          TextInput({ placeholder: this.account })
            .fontSize(18)
            .fontColor('#000000')
            .margin({ left: 15 })
            .maxLength(6)
            .placeholderColor('#000000')
            .layoutWeight(1)
            .backgroundColor('#FFFFFF') // 设置输入框的底色为白色
            .onChange((value: string) => {
              this.nickname = value
            })
        }

        Divider()
          .strokeWidth(1)         // 线宽为1px
          .color('#E0E0E0')       // 浅灰色线条
          .margin({ left: 20, right: 20 })

        Row() {
          Text('性别')
            .fontSize(18)
            .fontColor('#000000')
            .margin({left:20})

          TextInput({ placeholder: '男', text: this.gender })
            .fontSize(18)
            .fontColor('#000000')
            .margin({ left: 15 })
            .backgroundColor('#FFFFFF') // 设置输入框的底色为白色
            .onClick(() => {
              TextPickerDialog.show({
                range: ['男', '女', '隐私'],
                selected: this.index,
                onAccept: (result: TextPickerResult) => {
                  // console.log(result.value as string)
                  this.gender = result.value as string
                  this.index = result.index as number
                }
              })
            })

        }

      }
      .backgroundColor('#FFFFFF')
      .width('95%')
      .borderRadius(12)
      .margin(10)
      .justifyContent(FlexAlign.Center) // 水平居中

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#EBFCF9')

  }
  // 确认选择操作
  confirmSelection() {
    if (this.selectedIndex !== -1) {
      // 将选中的图片设置为当前头像
      this.currentAvatar = this.datas[this.selectedIndex].img;
      // 关闭选择器
      this.showSelector = false;
      this.selectedIndex = -1; // 重置选中索引
    }
  }
}
