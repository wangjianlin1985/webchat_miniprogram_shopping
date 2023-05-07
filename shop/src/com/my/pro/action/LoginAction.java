package com.my.pro.action;
/**
 * 和登陆有关的都在这里
 */

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.my.pro.model.Goods;
import com.my.pro.model.Manage;
import com.my.pro.model.News;
import com.my.pro.model.User;
import com.my.pro.service.GoodsService;
import com.my.pro.service.ManageService;
import com.my.pro.service.NewsService;
import com.my.pro.service.UserService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

@Controller("loginAction")
@Scope("prototype")
public class LoginAction extends BaseAction {
	//============依赖注入start================
			@Autowired
			private ManageService manageService;//管理
			@Autowired
			private UserService userService;//用户
			@Autowired
		    private NewsService newsService;
			@Autowired
			private GoodsService goodsService;
			//===========依赖注入end==================
			
			//-------------------------华丽分割线---------------------------------------------
			
			//============自定义参数start=============
			private Integer role;
			public Integer getRole() {
				return role;
			}
			public void setRole(Integer role) {
				this.role = role;
			}

			public String getName() {
				return name;
			}
			public void setName(String name) {
				this.name = name;
			}
			public String getPass() {
				return pass;
			}
			public void setPass(String pass) {
				this.pass = pass;
			}
			public String getPhone() {
				return phone;
			}
			public void setPhone(String phone) {
				this.phone = phone;
			}

			private String name;
			
			private String pass;
			
			private String phone;
			
			
			
			private String userName;//用户名
			private String passWord;//密码
			private String realName;
			//============自定义参数end=============
			
			//-------------------------华丽分割线---------------------------------------------
			
			public String getRealName() {
				return realName;
			}
			public void setRealName(String realName) {
				this.realName = realName;
			}
			public String getUserName() {
				return userName;
			}
			public void setUserName(String userName) {
				this.userName = userName;
			}
			public String getPassWord() {
				return passWord;
			}
			public void setPassWord(String passWord) {
				this.passWord = passWord;
			}

			//============文件上传start=============
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
			//============文件上传end=============
			
			//-------------------------华丽分割线---------------------------------------------

			public String login() {
				return "login";
			}
			//用户登陆
			public String ulogin() {
				return "success";
			}
			/**
			 * 用户首页
			 * @return
			 */
			public String uIndex() {
				List<Goods> list = goodsService.list();
				HttpServletRequest request = getRequest();
				String path = request.getContextPath();
				String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
				if(!isEmpty(list)){
					for(Goods g : list){
						String string = basePath+g.getUrl1();
						String replaceAll = null;
						try {
							replaceAll = string.replaceAll("\\\\", "/").replaceAll("shop", "");
							g.setUrl1(replaceAll);
						} catch (Exception e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
						
					}
					
				}
				jsonMap.put("newgoods",list);
				return JSON_TYPE;
			}
			public String home() {
				return "success";
			}
			
			//注册
			public String res() throws UnsupportedEncodingException{
				
				
				User user = new User();
				if(!isEmpty(realName)){
					//String str =  URLDecoder.decode((new String(realName.getBytes("ISO8859-1"), "UTF-8")), "UTF-8");
					String str =  realName;
					user.setRealName(str);
				}
				user.setCreateTime(new Date());
				user.setPassWord(pass);
				user.setPhone(phone);
				user.setIsDelete(0);
				user.setUserName(name);
				Integer id = userService.save2(user);
				return "json";
			}
			
			//用户登陆
			public String utlogin(){
				String hql = "from User where userName = :userName and passWord = :passWord";
				  Map<String,Object> alias = new HashMap<String,Object>();
				  alias.put("userName",name);
				  alias.put("passWord", pass);
				List<User> manageList=userService.getByHQL(hql, alias);
				if(manageList.size()>0){
					//将用户信息放入session
					HttpSession session = ServletActionContext.getRequest()
							.getSession();
					session.setAttribute("userName", manageList.get(0).getRealName());
					session.setAttribute("userId",manageList.get(0).getId() );
					session.setAttribute("manage", manageList.get(0));
					session.setAttribute("roleId", role);
					jsonMap.put("result", 1);
					jsonMap.put("userId", manageList.get(0).getId() );
					return "json";
				}else{
					jsonMap.put("result", 2);
					return "json";
				}
				
			}
	       //登录
			public String toLogin(){
						String hql = "from Manage where name = :userName and passWord = :passWord";
						  Map<String,Object> alias = new HashMap<String,Object>();
						  alias.put("userName",userName);
						  alias.put("passWord", passWord);
						List<Manage> manageList=manageService.getByHQL(hql, alias);
						if(manageList.size()>0){
							//将用户信息放入session
							HttpSession session = ServletActionContext.getRequest()
									.getSession();
							session.setAttribute("role",  manageList.get(0).getType());
							session.setAttribute("userName", manageList.get(0).getRealName());
							session.setAttribute("userId",manageList.get(0).getId() );
							session.setAttribute("manage", manageList.get(0));
							session.setAttribute("roleId", role);
							return "index";
						}else{
							return "login";
						}
			}
			
			   //退出
				public String tuichu() {
					ActionContext ac = ActionContext.getContext();
					Map session = ac.getSession();
					session.remove("userName");
					session.remove("userId");
					return "login";
				}
				
		
}
