package kr.co.clapp.utils;

import java.io.File;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Vector;

import kr.co.clapp.controller.admin.board.BoardRestController;
import kr.co.clapp.entities.BoardEntity;
import kr.co.digigroove.commons.utils.StringUtils;

import org.apache.xmlrpc.XmlRpcException;
import org.apache.xmlrpc.client.XmlRpcClient;
import org.apache.xmlrpc.client.XmlRpcClientConfigImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import twitter4j.Status;
import twitter4j.StatusUpdate;
import twitter4j.Twitter;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;

import com.google.gson.JsonObject;

public class SnsClientUtils {
	private static final Logger logger = LoggerFactory.getLogger(SnsClientUtils.class);
	//@Value("#{snsConfig['xmlrpcUrl']}")
	private String xmlrpcUrl = "https://api.blog.naver.com/xmlrpc";
	//@Value("#{snsConfig['blogTags']}")
	private String blogTags = "Clapp";
	//@Value("#{snsConfig['blogCategory']}")
	private String blogCategory = "Clapp Category";
	
	/**
	 * 페이스북 글쓰기
	 * @param boardEntity
	 * @return
	 */
	public String doWriteFacebook(BoardEntity boardEntity) {
		JsonObject facebookObj = null;
	    String facebookId = null;
		/**페이스북에 글쓰기*/
		Facebook graph_api;
		try {
			graph_api = new Facebook(boardEntity.getAppId(), boardEntity.getAccessTocken());
			Map<String, String> data = new HashMap<String, String>();  
			data.put("message", boardEntity.getSocialBlogContent());  
			data.put("link", boardEntity.getLinkUrl()+"#"+boardEntity.getBoardSocialBlogKey());   
			data.put("name", boardEntity.getSocialBlogTitle());  
			if(!StringUtils.isEmpty(boardEntity.getFileName())) {
				//logger.debug("=======FILE_NAME===== :"+boardEntity.getFileName());
			    data.put("picture", boardEntity.getFileName());
			}
			facebookObj = graph_api.sendPostToMyWall(data);
			facebookId = facebookObj.get("id").toString();
		} catch (Exception e) {
			boardEntity.setFacebookFlag("N");
			logger.error("SnsClientUtils.doWriteFacebook:Faild" , e);
		} 
		return facebookId;
	}
	/**
	 * 트위터 글쓰기 
	 * @param boardEntity
	 * @param targetFile
	 * @return
	 */
	public Status doWriteTwitter(BoardEntity boardEntity, File targetFile) {
		Twitter twitter = new TwitterFactory().getInstance();
		twitter4j.Status state = null;
		try {
			twitter.setOAuthConsumer(boardEntity.getConsumerKey(), boardEntity.getConsumerSecret());
			AccessToken accessToken = new AccessToken(boardEntity.getAccessToken(),
					boardEntity.getAccessTokenSecret());

			twitter.setOAuthAccessToken(accessToken); 
			StatusUpdate status = new StatusUpdate(boardEntity.getSocialBlogContent());
		    /**이미지 및 글쓰기*/
			if(!StringUtils.isEmpty(targetFile)) {
				status.setMedia(targetFile);
			}
			state =  twitter.updateStatus(status);  

		} catch (Exception e) {
			boardEntity.setTwitterFlag("N");
			logger.error("SnsClientUtils.doWriteTwitter:Faild" , e);
		}
		 return state;
	}
	/**
	 * 블로그 글쓰기
	 * @param boardEntity
	 * @return
	 */
	public String doWriteBlog(BoardEntity boardEntity) {
	    String rs = null;
		try {
		  XmlRpcClient client = new XmlRpcClient();
		  XmlRpcClientConfigImpl myconfig = new XmlRpcClientConfigImpl();
		  myconfig.setServerURL(new java.net.URL(xmlrpcUrl));
		  myconfig.setBasicEncoding("UTF-8");
		  myconfig.setEncoding("UTF-8");
		  //파라미터 설정
		  Vector<Object> params = new Vector<Object>();
		  params.addElement(new String(boardEntity.getBlogId()));
		  params.addElement(new String(boardEntity.getBlogId()));
		  params.addElement(new String(boardEntity.getBlogApiKey()));
		  Hashtable<String, String> hashtable = new Hashtable<String, String>();
	
		  // 블로그 글 제목 설정 
		  String sTitle = boardEntity.getSocialBlogTitle();
		  hashtable.put("title", sTitle);
		  //블로그 본문 설정 
		  String sDescription = boardEntity.getSocialBlogContent();
		  hashtable.put("description", sDescription);
		  
		  //블로그 태그 설정
		  hashtable.put("tags", blogTags);
		  
		  //블로그 카테고리 설정 
		  hashtable.put("category", blogCategory);
		  
		  params.addElement(hashtable);
		  params.add(new Boolean(true));
		  
		  rs = (String) client.execute(myconfig, "metaWeblog.newPost", params);
		  
        } catch(XmlRpcException e) {
        	boardEntity.setBlogFlag("N");
        	logger.error("Fault # "+ Integer.toString(e.code) + ": " + e.toString());
        } catch(Exception e)  {
        	boardEntity.setBlogFlag("N");
        	logger.error("SnsClientUtils.doWriteBlog:Faild" , e);
        }
		return rs;
	}
}
