var app = getApp();
Page({
    data: {
        name: '',
        pass: '',
        phone:"",
        realName:"",
        Obj:"",
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
    },
    onLoad:function(){
        // 页面初始化 options为页面跳转所带来的参数
    // 页面初始化 options为页面跳转所带来的参数
     var that = this;
     wx.getStorage({
       key: 'userId',
       success: function(res){
          console.log("查询参数。。。。。。。。"+res);
          console.log(res);
      wx.request({
        url: app.getUrl()+"/user_view.do?id="+res.data,
        method: 'POST', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
       header: {
        "content-type": "application/json"
      },
        success: function(a){
          // success
            var da = a.data.newgoods;
           console.log('===========返回参数=================');
             console.log(a);
        that.setData({"Obj":a.data.Obj});
        },
        fail: function(res) {
          // fail
        },
        complete: function(res) {
          // complete
        }
      })
       },
       fail: function(res) {
          console.log('===========查询缓存失败=================');
          wx.redirectTo({
               url:"/pages/shop/login/login"
             })
       },
       complete: function(res) {
         // complete
       }
     })
    }
})
