var app = getApp()
Page({
    data: {
        navLeftItems: [],
        navRightItems: [],
        curNav: 1,
		curIndex: 0
    },
    onLoad: function() {

        var that = this
        
        wx.request({
            url: app.getUrl()+"/lb_userLb.do",
            method: 'POST',
            data: {},
            header: {
                'Accept': 'application/json'
            },
            success: function(res) {
                  console.log("=============");
                    console.log(res);

                    
                    wx.request({
            url: app.getUrl()+"/lb_userpp.do?lbId="+res.data.lbs[0].lb.id,
            method: 'POST',
            data: {},
            header: {
                'Accept': 'application/json'
            },
            success: function(res) {
                  console.log("======555555555555555555555=======");
                    console.log(res);
                that.setData({
                    "navRightItems": res.data.pps
                })
                 console.log(that.data.navLeftItems);
            }
           
        })
                that.setData({
                    "navLeftItems": res.data.lbs
                })
                 console.log(that.data.navLeftItems);
            }
           
        })
           
        
    },

    //事件处理函数
    switchRightTab: function(e) {
           var that = this
            let id = e.target.dataset.id,
			index = parseInt(e.target.dataset.index);
            console.log("id====================="+id);
              console.log("index====================="+index);
		that.setData({
			curNav: id,
			curIndex: index
		}),

          wx.request({
            url: app.getUrl()+"/lb_userpp.do?lbId="+id,
            method: 'POST',
            data: {},
            header: {
                'Accept': 'application/json'
            },
            success: function(res) {
                  console.log("======555555555555555555555=======");
                    console.log(res);
                that.setData({
                    "navRightItems": res.data.pps
                })
                 console.log(that.data.navLeftItems);
            }
           
        })
    },
    goList:function(e){
          let id = e.target.dataset.id;
          console.log("被我点击的类型h是===")
           console.log(e.target.dataset)
          console.log("id====================="+id);
       
          
    }

})