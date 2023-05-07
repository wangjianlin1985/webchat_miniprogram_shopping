package com.my.pro.action;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.my.pro.utils.MapUtils;
import com.my.pro.utils.Pager;
import com.my.pro.utils.UserUtils;
import com.opensymphony.xwork2.ModelDriven;
import java.util.*;

import com.my.pro.model.*;
import com.my.pro.dao.*;
import com.my.pro.dto.CarGoods;
import com.my.pro.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2017年04月14日 21时44分15秒
 */

@Controller("carAction")
@Scope("prototype")
public class CarAction extends BaseAction implements ModelDriven<Car>{
	
	private static final long serialVersionUID = 1L;


	
	//==========model==============
	  private Car car;
		@Override
		public Car getModel() {
			if(car==null) car = new Car();
			return car;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private CarService carService;
	
	private Integer userId;
	
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	@Autowired
	private GoodsService goodsService;
	private Integer goodsId;
	
	//依赖注入 end  dao/service/===
	
	//-------------------------华丽分割线---------------------------------------------
	
	//============自定义参数start=============
	
	//============自定义参数end=============

	
	//-------------------------华丽分割线---------------------------------------------
	
	//============文件上传start=======================================================
	
	
	public Integer getGoodsId() {
		return goodsId;
	}
	public void setGoodsId(Integer goodsId) {
		this.goodsId = goodsId;
	}
	private File file;
	//提交过来的file的名字
    private String fileFileName;
    //提交过来的file的MIME类型
    private String fileContentType;
    public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	 //============文件上传end=========================================================
	public String jsonAction() {
		  // dataMap中的数据将会被Struts2转换成JSON字符串，所以这里要先清空其中的数据
		  jsonMap.clear();
		  jsonMap.put("success", true);
		  return JSON_TYPE;
	}
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============公=======共=======方=======法==========区=========start============//
	/**
	 * 列表分页查询
	 */
	public String car(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Car where 1=1 ");
		sb = sb.append("order by id desc");
		Pager<Car> pagers = carService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("Obj", car);
		return SUCCESS;
    }
	
	public String userList(){
		List<CarGoods> gg = new ArrayList<CarGoods>();
		 Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Car where   user.id="+userId);
		sb = sb.append(" order by id desc");
		List<Car> pagers = carService.listByAlias(sb.toString(),alias);
		if(!isEmpty(pagers)){
			for(Car car :pagers ){
				CarGoods g = new CarGoods ();
				g.setCarId(car.getId());
				g.setGoods(car.getGoods());
				gg.add(g);
			}
		}
		HttpServletRequest request = getRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
		if(!isEmpty(gg)){
			for(CarGoods g2 : gg){
				
				String string = basePath+g2.getGoods().getUrl1();
				String replaceAll = null;
				try {
					replaceAll = string.replaceAll("\\\\", "/").replaceAll("shop", "");
					g2.getGoods().setUrl1(replaceAll);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
		}
		jsonMap.put("listgoods",gg);
		return "json";
	}
	/**
	 * 跳转到添加页面
	 * @return
	 */
	public String add(){
		return SUCCESS;
	}
	
	/**
	 * 执行添加
	 * @return
	 */
	public String exAdd(){
		  
		List<Goods> listByAlias = goodsService.listByAlias("from Car where user.id="+userId+"and goods.id="+goodsId, null);
		if(isEmpty(listByAlias)){
			User user = new User();
			user.setId(userId);
			Goods byId = goodsService.getById(goodsId);
			car.setGoods(byId);
			car.setUser(user);
			carService.save(car);
			
		}
		jsonMap.put("result", 1);
		return "json";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		Car n = carService.getById(car.getId());
		ActionContext.getContext().put("Obj", n);
		return SUCCESS;
	}
	
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		Car n = carService.getById(car.getId());
		ActionContext.getContext().put("Obj", n);
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 */
	public String exUpdate(){
		Car n = carService.getById(car.getId());
		carService.update(n);
		ActionContext.getContext().put("url", "/car_car.do");
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		carService.delete2(car.getId());
		return "json";
	}
	
	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
