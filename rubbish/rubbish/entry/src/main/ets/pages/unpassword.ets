import { router } from "@kit.ArkUI";

@Entry
@Component
export struct Unpassword {
  @State message: string = 'Hello World';
  @State currentIndex: number = 4
  @StorageProp('bottomRectHeight')
  bottomRectHeight:number=0;
  @StorageProp('topRectHeight')
  topRectHeight:number=0;

  @State phone: string   = '';
  @State code: string    = '';
  @State countDown: number = 60;
  @State counting: boolean = false;

  /* 倒计时逻辑 */
  startCountDown=()=> {
    if(this.counting) return; // 如果已经在倒计时，则不重复开始
    this.countDown = 60;//重置倒计时时
    this.counting = true;// 开始倒计时
    const interval = setInterval(() => {
      /*this.countDown--;
      if (this.countDown <= 0) {
        clearInterval(timer);
        this.counting = false;

      }
      */
      if (this.countDown > 0) {
        this.countDown--; // 每秒减1
      } else {
        clearInterval(interval); // 倒计时结束，清除定时器
        this.counting = false; // 标记倒计时结束

      }
    }, 1000);
  }

  build() {

      Stack() {
        /* 1️ 顶部 25% 背景图
       Image($r('app.media.img_10'))
         .width(24).height(24)
         .padding(10)
  */


          Image($r("app.media.img2_10"))
            .width(24)
            .height(24)
            .position({ x: 10, y: 30 }) // 调整位置以避免被其他组件覆盖
            .zIndex(1) // 确保图标在最上层

          /* 2️ 表单区域（居中白底卡片） */
          Column({ space: 25 }) {
            /* 返回 & 标题 */
            Row() {
              Image($r("app.media.img3_5"))
                .width(80)
                .height(80)
                //.onClick(() => router.back());
                .onClick(() => {
                  router.pushUrl({ url: 'pages/gerenxinxixiugai' });
                  //router.pushUrl({ url: 'pages/newface' });
                })
            }
            .width('100%')
            .justifyContent(FlexAlign.Center) // 水平居中
            .padding({ left: 15, right: 15 });

            Text('验证手机号码')
              .fontSize(23)
              .fontColor('#E0E0E0')
              .fontWeight(600);

            /* 手机号输入框 */
            TextInput({ placeholder: '请输入手机号码', text: this.phone })
              .type(InputType.PhoneNumber)
              .onChange(v => this.phone = v)
              .width('100%')
              .height(48)
              .backgroundColor('#FFFFFF')
              .borderRadius(8)
              .padding({ left: 12, right: 12 });
            Image($r('app.media.img_13'))
              .width('100%')

            /* 验证码输入框 + 获取按钮 */
            Row({ space: 10 }) {
              TextInput({ placeholder: '请输入验证码', text: this.code })
                .type(InputType.Number)
                .onChange(v => this.code = v)
                .layoutWeight(1)
                .height(48)
                .backgroundColor('#FFFFFF')
                .borderRadius(8)
                .padding({ left: 12, right: 12 });
              Text(this.counting ? `${this.countDown}s` : '获取验证码')
                .fontSize(16)
                .fontColor(this.counting ? '#999' : '#FF5E81')
                .width(90)
                .height(48)
                .borderRadius(8)
                .backgroundColor('#FFFFFF')
                .textAlign(TextAlign.Center)
                .onClick(() => {
                  if (!this.counting) this.startCountDown();
                });
            }
            .width('100%');

            Image($r('app.media.img_13'))
              .width('100%')

            /* 提交按钮 */
            Button('提交')
              .width('100%')
              .height(48)
              .borderRadius(24)
              .backgroundColor('#FF5E81')
              .fontColor('#FFFFFF')
              .fontSize(18)
              .margin({ top: 50 })
              .onClick(() => {
                // 这里写验证逻辑
              });

            /* 取消按钮 */
            Button('取消')
              .width('100%')
              .height(48)
              .borderRadius(24)
              .backgroundColor('#FFFFFF') // 底色为白色
              .fontColor('#FF5E81')       // 字体颜色为 #FF5E81
              .fontSize(18)
              .border({ width: 1, color: '#FF5E81' }) // 边框颜色为 #FF5E81
              //.margin({ top: 5 }) // 取消按钮与提交按钮之间的间距
              .onClick(() => {
                // 取消按钮的逻辑，例如清空表单或返回上一页
              });
          }
          .width('90%')
          .height('75%')
          .padding(20)
          .backgroundColor('#FFFFFF')
          .borderRadius(16)
          .shadow({ radius: 8, color: '#1A000000' })
          .position({ x: '5%', y: '18%' }); // 垂直居中稍靠下
        }
        .width('100%')
        .height('100%')
        .backgroundImage($r('app.media.bk'))
        .backgroundImageSize({ width: '100%', height: '25%' })
        .backgroundColor('#EBFCF9'); // 整体背景色
      }

}