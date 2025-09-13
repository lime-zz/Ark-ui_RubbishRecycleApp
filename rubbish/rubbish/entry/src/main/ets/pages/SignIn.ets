import prompt from '@ohos.prompt';
import router from '@ohos.router';
import hilog from '@ohos.hilog';
import http from '@ohos.net.http';  // 导入HTTP模块

// 定义接口，明确后端返回数据结构
interface GeneratedTypeLiteralInterface_1 {
  monthly_checks: number[];
  is_signed_today: boolean;
  consecutive_days: number;
}

interface CheckInInfoResponse {
  code: number;
  message: string;
  data: GeneratedTypeLiteralInterface_1;
}

@Entry
@Component
struct SignInPage {
  // 从数据库获取的签到数据（不再使用本地模拟数据）
  @State signedDates: Set<number> = new Set();  // 本月已签到的日期（天数）
  @State isSignedToday: boolean = false;         // 今日是否签到
  @State consecutiveDays: number = 0;            // 连续签到天数
  @State showDialog: boolean = false;
  private currentDate: Date = new Date();
  // 当前用户ID（实际项目中应从登录状态获取，这里固定为测试用户ID=1）
  private userId: number = 1;

  // 页面加载时获取签到数据
  aboutToAppear() {
    this.fetchCheckInData();
  }

  // 从后端获取签到数据
  fetchCheckInData() {
    let request = http.createHttp();
    let url = `http://192.168.32.1:8080/api/user/${this.userId}/check-info`;  // 替换为你的后端IP

    request.request(url, { method: http.RequestMethod.GET })
      .then((response: http.HttpResponse) => {
        if (response.responseCode === 200 && typeof response.result === 'string') {
          let result: CheckInInfoResponse = JSON.parse(response.result);
          if (result.code === 0) {
            // 更新状态变量（与数据库同步）
            this.signedDates = new Set(result.data.monthly_checks);
            this.isSignedToday = result.data.is_signed_today;
            this.consecutiveDays = result.data.consecutive_days;
            hilog.info(0x0000, 'SignInPage', '签到数据加载成功');
          } else {
            prompt.showToast({ message: result.message || '获取数据失败' });
          }
        } else {
          prompt.showToast({ message: '获取数据失败' });
        }
      })
      .catch((error: Error) => {
        hilog.error(0x0000, 'SignInPage', `获取数据错误: ${JSON.stringify(error)}`);
        prompt.showToast({ message: '网络异常' });
      })
      .finally(() => {
        request.destroy();
      });
  }

  // 执行签到（调用后端接口）
  doCheckIn() {
    let request = http.createHttp();
    let url = `http://192.168.32.1:8080/api/user/${this.userId}/check-in`;

    request.request(url, { method: http.RequestMethod.POST })
      .then((response: http.HttpResponse) => {
        if (response.responseCode === 200 && typeof response.result === 'string') {
          let result: CheckInInfoResponse = JSON.parse(response.result);
          if (result.code === 0) {
            // 更新状态变量（与数据库同步）
            this.signedDates = new Set(result.data.monthly_checks);
            this.isSignedToday = result.data.is_signed_today;
            this.consecutiveDays = result.data.consecutive_days;
            this.showDialog = true;  // 显示签到成功弹窗
            hilog.info(0x0000, 'SignInPage', '签到成功');
          } else {
            prompt.showToast({ message: result.message || '签到失败' });
          }
        } else {
          prompt.showToast({ message: '签到失败' });
        }
      })
      .catch((error: Error) => {
        hilog.error(0x0000, 'SignInPage', `签到错误: ${JSON.stringify(error)}`);
        prompt.showToast({ message: '网络异常' });
      })
      .finally(() => {
        request.destroy();
      });
  }

  build() {
    Column() {
      // 顶部导航栏（保持不变）
      Row() {
        Image($r('app.media.return'))
          .width(24)
          .height(24)
          .margin({ right: 10 })
          .onClick(() => {
            router.back();
          })
        Text('每日签到')
          .fontSize(20)
          .fontWeight(500)
          .fontColor('#FFFFFF');
      }
      .width('100%')
      .height(90)
      .backgroundColor('#2BCDDC')
      .padding({ left: 16 })
      .justifyContent(FlexAlign.Start)
      .alignItems(VerticalAlign.Center);

      // 日历卡片（保持不变，数据从数据库获取）
      Column() {
        Text(`${this.currentDate.getFullYear()}年${this.currentDate.getMonth() + 1}月`)
          .fontSize(20)
          .fontColor('#2BCDDC')
          .margin({ top: 20, bottom: 10 });

        // 星期标题（保持不变）
        Row() {
          Text('星期一').width('14.28%').textAlign(TextAlign.Center).fontSize(14).fontColor('#2BCDDC');
          Text('星期二').width('14.28%').textAlign(TextAlign.Center).fontSize(14).fontColor('#2BCDDC');
          Text('星期三').width('14.28%').textAlign(TextAlign.Center).fontSize(14).fontColor('#2BCDDC');
          Text('星期四').width('14.28%').textAlign(TextAlign.Center).fontSize(14).fontColor('#2BCDDC');
          Text('星期五').width('14.28%').textAlign(TextAlign.Center).fontSize(14).fontColor('#2BCDDC');
          Text('星期六').width('14.28%').textAlign(TextAlign.Center).fontSize(14).fontColor('#2BCDDC');
          Text('星期日').width('14.28%').textAlign(TextAlign.Center).fontSize(14).fontColor('#2BCDDC');
        }
        .width('100%')
        .margin({ bottom: 10 });

        // 日历日期（保持不变，数据从数据库获取）
        Column() {
          Row() {
            this.renderDay(27, false);
            this.renderDay(28, false);
            this.renderDay(29, false);
            this.renderDay(30, false);
            this.renderDay(1, true);
            this.renderDay(2, true);
            this.renderDay(3, true);
          }.width('100%');

          Row() {
            this.renderDay(4, true);
            this.renderDay(5, true);
            this.renderDay(6, true);
            this.renderDay(7, true);
            this.renderDay(8, true);
            this.renderDay(9, true);
            this.renderDay(10, true);
          }.width('100%');

          Row() {
            this.renderDay(11, true);
            this.renderDay(12, true);
            this.renderDay(13, true);
            this.renderDay(14, true);
            this.renderDay(15, true);
            this.renderDay(16, true);
            this.renderDay(17, true);
          }.width('100%');

          Row() {
            this.renderDay(18, true);
            this.renderDay(19, true);
            this.renderDay(20, true);
            this.renderDay(21, true);
            this.renderDay(22, true);
            this.renderDay(23, true);
            this.renderDay(24, true);
          }.width('100%');

          Row() {
            this.renderDay(25, true);
            this.renderDay(26, true);
            this.renderDay(27, true);
            this.renderDay(28, true);
            this.renderDay(29, true);
            this.renderDay(30, true);
            this.renderDay(31, true);
          }.width('100%');
        }.width('100%');
      }
      .width('90%')
      .padding(20)
      .backgroundColor('#FFFFFF')
      .borderRadius(10)
      .margin({ top: 20 });

      // 签到按钮（点击事件改为调用后端接口）
      Column() {
        Button('点击签到')
          .width(150)
          .height(150)
          .backgroundColor('#2BCDDC')
          .borderRadius(75)
          .fontSize(20)
          .fontColor('#FFFFFF')
          .onClick(() => {
            hilog.info(0x0000, 'SignInPage', '签到按钮被点击');
            if (!this.isSignedToday) {
              this.doCheckIn();  // 调用后端签到接口
            } else {
              prompt.showToast({ message: '今日已签到' });
              hilog.info(0x0000, 'SignInPage', '今日已签到');
            }
          })
          .margin({ top: 50 });

        Text(this.isSignedToday? '今日已签到' : '今日未签到')
          .fontSize(16)
          .fontColor(this.isSignedToday? '#FF5E81' : '#999999')
          .margin({ top: 10 });
      }
      .width('100%')
      .justifyContent(FlexAlign.Center)
      .alignItems(HorizontalAlign.Center);

      // 签到成功弹窗（保持不变，数据从数据库获取）
      if (this.showDialog) {
        Column() {
          Column() {
            Column() {
              Column() {
                Text('签到成功')
                  .fontSize(20)
                  .fontColor('#FFFFFF')
                  .fontWeight(FontWeight.Bold)
              }
              .width('100%')
              .height(50)
              .backgroundColor('#FF5E81')
              .borderRadius({ topLeft: 10, topRight: 10 })
              .justifyContent(FlexAlign.Center)

              Column() {
                Text(`连续签到 ${this.consecutiveDays} 天`)  // 显示从数据库获取的连续天数
                  .fontSize(18)
                  .fontColor('#333333')
                  .margin({ top: 20 })

                Column() {
                  Image($r('app.media.touxiang'))
                    .width(40)
                    .height(40)
                    .margin({ right: 10 })

                  Text('+10 金币')
                    .fontSize(16)
                    .fontColor('#FF9800')
                }
                .width('100%')
                .height(60)
                .direction(Direction.Ltr)
                .justifyContent(FlexAlign.Center)
                .alignItems(HorizontalAlign.Center)
                .margin({ top: 15 })

                Text('连续签到一个月可获得现金奖励哦~')
                  .fontSize(14)
                  .fontColor('#999999')
                  .textAlign(TextAlign.Center)
                  .width('100%')
                  .margin({ top: 15 })

                Button('确定')
                  .width(120)
                  .height(40)
                  .backgroundColor('#2BCDDC')
                  .borderRadius(20)
                  .fontSize(16)
                  .fontColor('#FFFFFF')
                  .margin({ top: 20 })
                  .onClick(() => {
                    this.showDialog = false
                  })
              }
              .width('100%')
              .padding({ top: 10, bottom: 20 })
            }
            .width(280)
            .backgroundColor('#FFFFFF')
            .borderRadius(10)
            .shadow({
              radius: 10,
              color: '#00000020',
              offsetX: 0,
              offsetY: 0
            })
          }
          .width('100%')
          .height('100%')
          .backgroundColor('#00000040')
          .justifyContent(FlexAlign.Center)
          .alignItems(HorizontalAlign.Center)
        }
        .width('100%')
        .height('100%')
        .backgroundColor('#00000080')
        .zIndex(999);
      }
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#F0F8FF');
  }

  // 渲染日历中的某一天（保持不变，数据从数据库获取）
  @Builder
  renderDay(day: number, isCurrentMonth: boolean) {
    Column() {
      if (isCurrentMonth) {
        if (this.signedDates.has(day)) {  // 使用从数据库获取的签到记录
          Text(day.toString())
            .fontSize(14)
            .fontColor('#FFFFFF')
            .backgroundColor('#2BCDDC')
            .borderRadius(15)
            .width(30)
            .height(30)
            .textAlign(TextAlign.Center);
        } else {
          Text(day.toString())
            .fontSize(14)
            .fontColor('#333333')
            .width(30)
            .height(30)
            .textAlign(TextAlign.Center);
        }
      } else {
        Text(day.toString())
          .fontSize(14)
          .fontColor('#CCCCCC')
          .width(30)
          .height(30)
          .textAlign(TextAlign.Center);
      }
    }
    .width('14.28%')
    .height(50)
    .justifyContent(FlexAlign.Center)
    .alignItems(HorizontalAlign.Center);
  }
}