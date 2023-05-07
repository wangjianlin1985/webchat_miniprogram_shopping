package com.my.pro.action;

import java.util.HashMap;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
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
import com.my.pro.utils.JavaToMapUtils;
import com.my.pro.utils.MapUtils;
import com.my.pro.utils.Pager;
import com.my.pro.utils.UUIDUtils;
import com.opensymphony.xwork2.ModelDriven;
import java.util.*;

import com.my.pro.model.*;
import com.my.pro.dao.*;
import com.my.pro.service.*;

/**
 * @ClassName:  
 * @Description: 
 * @author administrator
 * @date 2015年12月24日 下午1:46:33 - 2017年04月14日 21时44分16秒
 */

@Controller("goodsAction")
@Scope("prototype")
public class GoodsAction extends BaseAction implements ModelDriven<Goods>{
	
	private static final long serialVersionUID = 1L;


	
	//==========model==============
	  private Goods goods;
		@Override
		public Goods getModel() {
			if(goods==null) goods = new Goods();
			return goods;	
		}
		//==========model==============
	/**
	 * 依赖注入 start dao/service/===
	 */
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private PpService ppService;
	
	private Integer ppId;
	
	
	//依赖注入 end  dao/service/===
	
	//-------------------------华丽分割线---------------------------------------------
	
	//============自定义参数start=============
	
	//============自定义参数end=============

	
	//-------------------------华丽分割线---------------------------------------------
	
	//============文件上传start=======================================================
	
	
	    public Integer getPpId() {
		return ppId;
	}

	public void setPpId(Integer ppId) {
		this.ppId = ppId;
	}
		private List<File> file;
	    public List<File> getFile() {
			return file;
		}

		public void setFile(List<File> file) {
			this.file = file;
		}

		public List<String> getFileFileName() {
			return fileFileName;
		}

		public void setFileFileName(List<String> fileFileName) {
			this.fileFileName = fileFileName;
		}

		public List<String> getFileContentType() {
			return fileContentType;
		}

		public void setFileContentType(List<String> fileContentType) {
			this.fileContentType = fileContentType;
		}
		private List<String> fileFileName;
	    private List<String> fileContentType;
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
	public String goods(){
	    Map<String,Object> alias = new HashMap<String,Object>();
		StringBuffer sb = new StringBuffer();
		sb = sb.append("from Goods where 1=1 and isDelete= 0");
		sb = sb.append("order by id desc");
		Pager<Goods> pagers = goodsService.findByAlias(sb.toString(),alias);
		ActionContext.getContext().put("pagers", pagers);
		ActionContext.getContext().put("Obj", goods);
		return SUCCESS;
    }
	
	public String userSrarch() throws UnsupportedEncodingException{
		StringBuffer sb = new StringBuffer();
		
	    Map<String,Object> alias = new HashMap<String,Object>();
		sb = sb.append("from Goods where 1=1 and isDelete= 0");
		if(goods!=null && goods.getTitle() !=null && !"".equals(goods.getTitle())){
			//String str =  URLDecoder.decode((new String(goods.getTitle().getBytes("ISO8859-1"), "UTF-8")), "UTF-8");
			String str = goods.getTitle();
			sb.append("  and title like :realName ");
			alias.put("realName", "%" +goods.getTitle()+ "%" );
		}
		sb = sb.append("order by id desc");
		List<Goods> list = goodsService.listByAlias(sb.toString(),alias);
		HttpServletRequest request = getRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
		if(!isEmpty(list)){
			for(Goods g : list){
				String string = basePath+g.getUrl1();
				String replaceAll;
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
	
	
	
	public String userList() throws UnsupportedEncodingException{
		StringBuffer sb = new StringBuffer();
		
	    Map<String,Object> alias = new HashMap<String,Object>();
		sb = sb.append("from Goods where 1=1 and isDelete= 0 and pp.id="+ppId);
		if(goods!=null && goods.getTitle() !=null && !"".equals(goods.getTitle())){
			String str =  URLDecoder.decode((new String(goods.getTitle().getBytes("ISO8859-1"), "UTF-8")), "UTF-8");
			sb.append("  and title like :realName ");
			alias.put("realName", "%" +str+ "%" );
		}
		sb = sb.append("order by id desc");
		List<Goods> list = goodsService.listByAlias(sb.toString(),alias);
		HttpServletRequest request = getRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
		if(!isEmpty(list)){
			for(Goods g : list){
				String string = basePath+g.getUrl1();
				String replaceAll;
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
	
	public String goodsInfo(){
		Goods n = goodsService.getById(goods.getId());
		HttpServletRequest request = getRequest();
		String path = request.getContextPath();
		String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"";
		String string1 = basePath+n.getUrl2();
		String string2 = basePath+n.getUrl2();
		String string3 = basePath+n.getUrl3();
		String string4 = basePath+n.getUrl1();
		String replaceAll1;
		String replaceAll2;
		String replaceAll3;
		String replaceAll4;
		try {
			
			replaceAll1 = string1.replaceAll("\\\\", "/").replaceAll("shop", "");
			n.setUrl1(replaceAll1);
			
			replaceAll2 = string2.replaceAll("\\\\", "/").replaceAll("shop", "");
			n.setUrl2(replaceAll2);
			
			replaceAll3 = string3.replaceAll("\\\\", "/").replaceAll("shop", "");
			n.setUrl3(replaceAll3);
			
			replaceAll4 = string4.replaceAll("\\\\", "/").replaceAll("shop", "");
			n.setUrl4(replaceAll4);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*private Integer id;
		
		private String title;//标题
		
		private String url1;//封面
		
		private String url2;
		
		private String url3;
		
		private String url4;
		
	    private double price;//价格	
	    
	    private Integer isDelete;//
*/		
		Map<String, Object> map = MapUtils.getMap();
		map.put("id",n.getId());
		map.put("title",n.getTitle());
		List list = new ArrayList();
		list.add(n.getUrl1());
		list.add(n.getUrl2());
		list.add(n.getUrl3());
		list.add(n.getUrl4());
		map.put("list",list);
		map.put("price",n.getPrice());
		jsonMap.put("Obj", map);
		return JSON_TYPE;
	}
	/**
	 * 跳转到添加页面
	 * @return
	 */
	public String add(){
		getActionContext().put("pps", ppService.listByAlias("from Pp ", null));
		return SUCCESS;
	}
	
	/**
	 * 执行添加
	 * @return
	 * @throws IOException 
	 */
	public String exAdd() throws IOException{
		if (file != null) {
            for (int i = 0; i < file.size(); i++) {
                ActionContext ac = ActionContext.getContext();
                HttpServletRequest request = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);
                String root  = "D:/my/upload";
                InputStream is = new FileInputStream(file.get(i));
                String f = fileFileName.get(i);
                f = UUIDUtils.create() + i + fileFileName.get(i);
                OutputStream os = new FileOutputStream(new File(root, f));
                byte[] buffer = new byte[500];
                int length = 0;
                while (-1 != (length = is.read(buffer, 0, buffer.length))) {
                    os.write(buffer);
                }
                os.close();
                is.close();
                if (i == 0){
                	goods.setUrl1("\\upload\\" + f);
                }
                if (i == 1){
                	goods.setUrl2("\\upload\\" + f);
                }
                if (i == 2){
                	goods.setUrl3("\\upload\\" + f);
                }
                if (i == 3){
                	goods.setUrl4("\\upload\\" + f);
                }
            }
        }

		goods.setIsDelete(0);
		goodsService.save(goods);
		ActionContext.getContext().put("url", "/goods_goods.do");
		return "redirect";
	}
	
	/**
	 * 查看详情页面
	 * @return
	 */
	public String view(){
		Goods n = goodsService.getById(goods.getId());
		ActionContext.getContext().put("Obj", n);
		return SUCCESS;
	}
	
	/**
	 * 跳转修改页面
	 * @return
	 */
	public String update(){
		getActionContext().put("pps", ppService.listByAlias("from Pp ", null));
		Goods n = goodsService.getById(goods.getId());
		ActionContext.getContext().put("Obj", n);
		return SUCCESS;
	}
    
	/**
	 * 执行修改
	 * @return
	 * @throws IOException 
	 */
	public String exUpdate() throws IOException{
		Goods n = goodsService.getById(goods.getId());
		if (file != null) {
            for (int i = 0; i < file.size(); i++) {
                ActionContext ac = ActionContext.getContext();
                HttpServletRequest request = (HttpServletRequest) ac.get(ServletActionContext.HTTP_REQUEST);
                String root  = "D:/my/upload";
                InputStream is = new FileInputStream(file.get(i));
                String f = fileFileName.get(i);
                f = UUIDUtils.create() + i + fileFileName.get(i);
                OutputStream os = new FileOutputStream(new File(root, f));
                byte[] buffer = new byte[500];
                int length = 0;
                while (-1 != (length = is.read(buffer, 0, buffer.length))) {
                    os.write(buffer);
                }
                os.close();
                is.close();
                if (i == 0){
                	n.setUrl1("\\upload\\" + f);
                }
                if (i == 1){
                	n.setUrl2("\\upload\\" + f);
                }
                if (i == 2){
                	n.setUrl3("\\upload\\" + f);
                }
                if (i == 3){
                	n.setUrl4("\\upload\\" + f);
                }
            }
        }
		n.setPp(goods.getPp());
		goodsService.update(n);
		ActionContext.getContext().put("url", "/goods_goods.do");
		return "redirect";
	}
	
	
	/**
	 * 删除
	 * @return
	 */
	public String delete(){
		Goods n = goodsService.getById(goods.getId());
		n.setIsDelete(1);
		goodsService.update(n);
		ActionContext.getContext().put("url", "/goods_goods.do");
		return "redirect";
	}
	
	//=============公=======共=======方=======法==========区=========end============//
	
	 //-------------------------华丽分割线---------------------------------------------//
	
	 //=============自=======定=======义=========方=======法==========区=========start============//
	
	
	
	
	//=============自=======定=======义=========方=======法==========区=========end============//
		
	
	
}
