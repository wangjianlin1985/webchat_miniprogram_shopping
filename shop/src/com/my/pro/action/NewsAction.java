package com.my.pro.action;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.my.pro.model.News;
import com.my.pro.service.NewsService;
import com.my.pro.utils.Pager;
import com.my.pro.utils.UUIDUtils;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
@Controller("newsAction")
@Scope("prototype")
public class NewsAction extends BaseAction implements ModelDriven<News>{

		@Autowired
	    private NewsService newsService;
	private static final long serialVersionUID = 1L;
    private News news;
    private String titles;
    //=====================新闻发布参数
    /*
    
    
    */
    private int adverId;//广告id
    private int qt;//新闻类别选择其他
    private int zt;//新闻类别选择专题
    private int xwlx;//单选框是1 专题还是2 其他
    //==================================

	public News getNews() {
		return news;
	}

	public void setNews(News news) {
		this.news = news;
	}

	public int getAdverId() {
		return adverId;
	}

	public void setAdverId(int adverId) {
		this.adverId = adverId;
	}

	public int getQt() {
		return qt;
	}

	public void setQt(int qt) {
		this.qt = qt;
	}

	public int getZt() {
		return zt;
	}

	public void setZt(int zt) {
		this.zt = zt;
	}

	public int getXwlx() {
		return xwlx;
	}

	public void setXwlx(int xwlx) {
		this.xwlx = xwlx;
	}

	public String getTitles() {
		return titles;
	}

	public void setTitles(String titles) {
		this.titles = titles;
	}

	public News getModel() {
		if(news==null) news = new News();
		return news;
	}

	public String newList(){
		Pager<News> pagers = newsService.list(titles);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("titles", titles);
		return SUCCESS;
	}

	public String add(){
		News newN = newsService.getById(1);
		getActionContext().put("dddd", newN);
		return SUCCESS;
	}
	
	public String updatenew(){
		News newN = newsService.getById(1);
		newN.setContent(news.getContent());
		newN.setTitle(news.getTitle());
		newsService.update(newN);
		ActionContext.getContext().put("url", "/news_add.do");
		return "redirect";
	}
	public String exAdd(){
		newsService.add(news);
		ActionContext.getContext().put("url", "/news_newList.do");
		return "redirect";
	}

	
	public String del(){
		 News newN = newsService.load(news);
		newsService.del(news);
		ActionContext.getContext().put("url", "/news_newsnew.do?");
		return "redirect";
	}
	
	//文件上传
    //上传的文件对象  
    private File uploadFile;  
    //文件名称  
    private String uploadFileFileName;  
    //文件类型  
    private String uploadFileContentType;  
      
    public File getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(File uploadFile) {
		this.uploadFile = uploadFile;
	}

	public String getUploadFileFileName() {
		return uploadFileFileName;
	}

	public void setUploadFileFileName(String uploadFileFileName) {
		this.uploadFileFileName = uploadFileFileName;
	}

	public String getUploadFileContentType() {
		return uploadFileContentType;
	}

	public void setUploadFileContentType(String uploadFileContentType) {
		this.uploadFileContentType = uploadFileContentType;
	}
	public String fileUpload() throws Exception{
		        News news2 = new News();
		        news2.setTitle(news.getTitle());
		        news2.setIntroduction(news.getIntroduction());
		        news2.setContent(news.getContent());
		        news2.setCreateTime(new Date());
		        newsService.addInfo(news2);
		        ActionContext.getContext().put("url", "/news_newsnew.do");
		        return "redirect";
		}
	  public String delNews(){
	    	 newsService.del(news);
	    	ActionContext.getContext().put("url", "/news_newList.do");
			return "redirect";
	    }
	  
	
}
