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
import com.my.pro.utils.Pager;
import com.opensymphony.xwork2.ModelDriven;
import java.util.*;

import com.my.pro.model.*;
import com.my.pro.dao.*;
import com.my.pro.dto.LbDto;
import com.my.pro.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2017年04月14日 21时44分16秒
 */

@Controller("lbAction")
@Scope("prototype")
public class LbAction extends BaseAction implements ModelDriven<Lb>{
	
	private static final long serialVersionUID = 1L;


	
	//==========model==============
	  private Lb lb;
		@Override
		public Lb getModel() {
			if(lb==null) lb = new Lb();
			return lb;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private LbService lbService;
	@Autowired
	private PpService ppService;
	
	private Integer lbId;
	
	//依赖注入 end  dao/service/===
	
	//-------------------------华丽分割线---------------------------------------------
	
	//============自定义参数start=============
	
	//============自定义参数end=============

	
	//-------------------------华丽分割线---------------------------------------------
	
	//============文件上传start=======================================================
	
	
	public Integer getLbId() {
		return lbId;
	}
	public void setLbId(Integer lbId) {
		this.lbId = lbId;
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
	public String lb(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Lb where 1=1 and isDelete = 0");
		sb = sb.append("order by id desc");
		Pager<Lb> pagers = lbService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("Obj", lb);
		return SUCCESS;
    }
	
	
	/**
	 * 微信查询品牌集合
	 * @return
	 */
	public String userLb(){
		HttpServletRequest request = getRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
		List<LbDto> lbs = new ArrayList<LbDto>();
		List<Lb> pagers = lbService.listByAlias("from Lb where 1=1 and isDelete = 0",null);
		if(!isEmpty(pagers)){
			for(Lb lb : pagers){
				LbDto ld = new LbDto();
				ld.setLb(lb);
				//查询品牌
				List<Pp> listByAlias = ppService.listByAlias("from Pp where 1=1 and  lb.id="+lb.getId(), null);
				if(!isEmpty(listByAlias)){
					for(Pp p : listByAlias){
						String string = basePath+p.getCpUrl();
						String replaceAll;
						try {
							replaceAll = string.replaceAll("\\\\", "/").replaceAll("shop", "");
							p.setCpUrl(replaceAll);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
				ld.setPps(listByAlias);
				lbs.add(ld);
			}
			
		}
		
		jsonMap.put("lbs", lbs);
		return "json";
	}
	
	public String userpp(){
		HttpServletRequest request = getRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
		List<Pp> listByAlias = ppService.listByAlias("from Pp where 1=1 and  lb.id="+lbId, null);
		if(!isEmpty(listByAlias)){
			for(Pp p : listByAlias){
				String string = basePath+p.getCpUrl();
				String replaceAll;
				try {
					replaceAll = string.replaceAll("\\\\", "/").replaceAll("shop", "");
					p.setCpUrl(replaceAll);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}
		jsonMap.put("pps", listByAlias);
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
		lb.setIsDelete(0);
		lbService.save(lb);
		ActionContext.getContext().put("url", "/lb_lb.do");
		return "redirect";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		Lb n = lbService.getById(lb.getId());
		ActionContext.getContext().put("Obj", n);
		return SUCCESS;
	}
	
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		Lb n = lbService.getById(lb.getId());
		ActionContext.getContext().put("Obj", n);
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 */
	public String exUpdate(){
		Lb n = lbService.getById(lb.getId());
		n.setName(lb.getName());
		lbService.update(n);
		ActionContext.getContext().put("url", "/lb_lb.do");
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		Lb n = lbService.getById(lb.getId());
		n.setIsDelete(1);
		lbService.update(n);
		ActionContext.getContext().put("url", "/lb_lb.do");
		return "redirect";
	}
	
	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
