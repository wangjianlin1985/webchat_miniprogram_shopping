var app = getApp();
Page({
	data:{
			img_url: 'http://appuat.huihuishenghuo.com/img/',
			checkType:true,
			focus:true,
			height:'440rpx',
			ids:[],
			name:"1",
			phone:"12",
			address:"13"
	},
	checkTap:function(){
		var check=this.data.checkType;
		this.setData({
			checkType: !check
		})
	},
	paymentTap:function(){
		this.setData({
			height: '440rpx'
		})
	},
	payloseTap:function(){
		this.setData({
			focus:false,
			height: '0rpx'
		})
	},
	privilegeTap:function(){
		wx.navigateTo({
		  url: 'privilege',
		  success: function(res){
			// success
		  },
		  fail: function() {
			// fail
		  },
		  complete: function() {
			// complete
		  }
		})
	},
	paycommentTap:function(){
		//提交
		  var that = this;
  wx.getStorage({
    key: 'userId',
    success: function(res){
      console.log("缓存查数据");
       console.log(res);
			 console.log(decodeURIComponent(that.data.name));
 wx.request({
        url: app.getUrl()+"/dd_exAdd.do",
        method: 'POST', // OPTIONS, GET, HEAD, POST, PUT, DELETE, TRACE, CONNECT
				data:{
					"name":that.data.name,
					"address":that.data.address,
					"phone":that.data.phone,
					"userId":res.data,
					"ids":that.data.ids
				},
       header: {
        "content-type": "application/x-www-form-urlencoded"
      },
        success: function(a){
          wx.switchTab({
                                url: '/pages/shop/order/order'
                                })
        },
        fail: function(res) {
             wx.redirectTo({
      url:"/pages/shop/login/login"
    })
        },
        complete: function(res) {
          // complete
        }
      })
    },
    fail: function(res) {
      // fail
       wx.redirectTo({
               url:"/pages/shop/login/login"
             })
    },
    complete: function(res) {
      // complete
    }
  })
		wx.navigateTo({
			url: '/pages/yiguo/pay/paycomment',
			success: function(res){
				// success
			},
			fail: function() {
				// fail
			},
			complete: function() {
				// complete
			}
		})
	},
	onLoad:function(options){
// 页面初始化 options为页面跳转所带来的参数
    console.log("接收需要购买的id=========");
    console.log(options);
		this.setData({"ids":options.ids});
	},
	name1:function(e){
 this.setData({
            name: e.detail.value
        })
	}
	,
	phone1:function(e){
 this.setData({
            phone: e.detail.value
        })
	}
	,
	address1:function(e){
 this.setData({
            address: e.detail.value
        })
	}
})