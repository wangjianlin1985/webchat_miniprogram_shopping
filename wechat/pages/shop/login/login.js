var app = getApp();
Page({
    data: {
        name: 'ceshi',
        pass: '111111'
    },
    denglu: function () {
        console.log(this.data);
        if (this.data.name == '' || this.data.name == undefined || this.data.pass == '' || this.data.pass == undefined) {
            wx.showModal({
                title: '系统提示',
                content: '用户名或密码不能为空！',
                showCancel: false,
                confirmText: '知道了',
                success: function (res) {
                    if (res.confirm) {
                        console.log('用户点击确定')
                    }
                }
            })
        } else {
            //请求登录
            var that = this;
            wx.request({
                url: app.getUrl() + '/login_utlogin.do?name=' + that.data.name + '&pass=' + that.data.pass,
                method: 'POST',
                success: function (res) {
                    console.log("===================");
                    console.log(res);
                    // 登录成功
                    if (res.data.result == 1) {
                        wx.setStorage({
                            key:"userId",
                            data:res.data.userId
                            })
                           wx.showToast({
                            title: '登陆成功',
                            icon: 'success',
                            complete: function () {
                               wx.switchTab({
                                url: '/pages/shop/index/index'
                                })
                            }
                        })
                
                    } else {
                        wx.showModal({
                            title: '系统提示',
                            content: '用户名或密码不正确！',
                            showCancel: false,
                            confirmText: '知道了',
                            success: function (res) {
                                that.setData({
                                    name: '',
                                    pass: ''
                                })
                            }
                        })
                    }
                },
                fail: function () {
                    // fail
                    console.log("错误")
                },
                complete: function () {
                    // complete
                     console.log("complete")
                }
            })
        }
    },
    nameInput: function (e) {
        this.setData({
            name: e.detail.value
        })
    },
    passwordInput: function (e) {
        this.setData({
            pass: e.detail.value
        })
    },
    toRes:function(){
        wx.redirectTo({
      url:"/pages/shop/res/res"
    })
    }
})
