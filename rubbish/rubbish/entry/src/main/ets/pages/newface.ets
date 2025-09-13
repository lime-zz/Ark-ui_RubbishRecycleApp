
import common from '@ohos.app.ability.common';
import router from "@ohos.router"
interface Type1 {
  img: Resource;
}
@Entry
@Component
struct Newface {
  @State message: string = 'Hello World';
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
  // 选择的图片列表
  //@State imageList: Array<Resource> = [];
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
        Image($r('app.media.img_18'))
          .width(80)
          .height(80)
          .zIndex(1) // 确保图标在最上层
          .margin({ right: 10 })
          .onClick(() => {
            router.back();
          })

        Text('所有照片及视频')
          .fontSize(25)
          .fontWeight(600)
          .fontColor($r('sys.color.white'))

        Blank();
        Button('完成')
          .fontSize(25)
          .fontWeight(60)
          .fontColor($r('sys.color.white'))
          .backgroundColor('#FF5E81')
          .margin({ left:15,right:15, top:8,bottom:8})
          .onClick(() => {
            router.back();
          })
      }
      .padding({
        top: 20,
        right: 10,
        bottom: 20,
        left: 10
      })
      .width('100%')
      .justifyContent(FlexAlign.Start);

      Column() {
        // 当前头像显示
        Image(this.currentAvatar)
          .width(150)
          .height(150)
          .borderRadius(75)
          .margin(20)
          .objectFit(ImageFit.Cover)
          .onClick(() => {
            this.showSelector = true;// 显示选择器
          })
        // 打开选择器按钮
        Button('选择头像')
          .width(200)
          .height(40)
          .margin(10)
          .onClick(() => {
            this.showSelector = true;
          })

        // 图片选择器弹窗
        if (this.showSelector) {
          Column() {
            // 标题
            Text('选择头像图片')
              .fontSize(20)
              .margin(10)

        Grid() {
          ForEach(this.datas, (item:Type1,index:number) => {
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
            .width('33%')
          }, (item: Resource, index: number) => index.toString())
        }
        .columnsTemplate('1fr 1fr 1fr 1fr') // san列
        .columnsGap(10) // 列间距
        .rowsGap(10) // 行间距
        .height('60%')
        .margin(10)
        // .height('auto') // 自适应内容高度
            // 操作按钮
            Row() {
              Button('取消')
                .width(120)
                .height(40)
                .backgroundColor('#F5F5F5')
                .onClick(() => {
                  this.showSelector = false; // 关闭选择器
                  this.selectedIndex = -1; // 重置选中索引
                })

              Button('确定')
                .width(120)
                .height(40)
                .backgroundColor('#007DFF')
                .margin({ left: 20 })
                .enabled(this.selectedIndex !== -1)
                .onClick(() => {
                  this.confirmSelection();// 确认选择
                })
            }
            .margin(20)
          }
          .width('90%')
          .height('70%')
          .backgroundColor(Color.White)
          .borderRadius(10)
          .position({ x: '5%', y: '15%' })
          .zIndex(1)
        }
      }
      .width('100%')
      .height('100%')
      .justifyContent(FlexAlign.Center)

    }
    .width('100%')
    .height('100%')
    .backgroundColor('#2BD7DD')

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
