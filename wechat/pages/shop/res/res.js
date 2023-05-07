var app = getApp();
Page({
    data: {
        name: '',
        pass: '',
        phone:"",
        realName:"",
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
                url: app.getUrl() + '/login_res.do?name=' + that.data.name + '&pass=' + that.data.pass+"&phone="+that.data.phone+"&realName="+that.data.realName,
                method: 'POST',
                success: function (res) {
                    console.log("===================");
                    console.log(res);
                    wx.showToast({
                            title: '注册成功',
                            icon: 'success',
                            complete: function () {
                               wx.redirectTo({
                                url:"/pages/shop/login/login"
                                })
                            }
                        })
                },
                fail: function () {
                    // fail
                },
                complete: function () {
                    // complete
                }
            })
        }
    },
    phoneInput:function(e){
      this.setData({
            phone: e.detail.value
        })
    },
    realNameInput:function(e){
      this.setData({
            realName: e.detail.value
        })
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
    toLog:function(){
        wx.redirectTo({
      url:"/pages/shop/login/login"
    })
    }
})
