package kr.co.clapp.utils;

import twitter4j.Twitter;
import twitter4j.TwitterFactory;
import twitter4j.auth.AccessToken;
import twitter4j.auth.RequestToken;

import javax.servlet.http.HttpServletRequest;

public class TwitterClient {

	private HttpServletRequest request;

	private Twitter twitter;
	RequestToken requestToken = null;
	AccessToken accessToken = null;
	String q = "";

	final String CONSUMER_KEY = "ypocSJ3mjfdcwwcl4RqT8eiqt";
	final String CONSUMER_SECRET = "08qzUgdXAfuLX6ft9Piu9TwFQzRHTn6NjeGdkmKNkBqJEAg43a";

	/**
	 * 생성자
	 * 
	 * @param req
	 */
	public TwitterClient(HttpServletRequest req) {
		request = req;
	}

	/**
	 * RequestToken를 받기
	 * 
	 * @return
	 */
	public RequestToken getRequestToken() {
		twitter = new TwitterFactory().getInstance();
		twitter.setOAuthConsumer(CONSUMER_KEY, CONSUMER_SECRET);

		requestToken = null;
		try {
			requestToken = twitter.getOAuthRequestToken();
			request.getSession().setAttribute("requestToken", requestToken);
		} catch (Exception te) {
			te.printStackTrace();
		}

		return requestToken;
	}

	/**
	 * AccessToken 토큰 받기
	 * 
	 * @return
	 * @throws Exception
	 */
	public AccessToken getAccessToken() throws Exception {
		String oauthToken = request.getParameter("oauth_token");
		requestToken = request.getSession() != null ? (RequestToken) request
				.getSession().getAttribute("requestToken") : null;

		if (requestToken == null) {
			throw new Exception("error requestToken == null");
		}
		if (oauthToken == null) {
			throw new Exception("error oauthToken == null");
		}

		twitter = new TwitterFactory().getInstance();
		twitter.setOAuthConsumer(CONSUMER_KEY, CONSUMER_SECRET);

		if (requestToken.getToken().equals(oauthToken)) {
			try {
				accessToken = twitter.getOAuthAccessToken(requestToken);
				twitter.setOAuthAccessToken(accessToken);
				request.getSession().setAttribute("accessToken", accessToken);
			} catch (Exception te) {
				te.printStackTrace();
			}
		} else {
			throw new Exception("oauth_token error");
		}
		return accessToken;
	}

	/**
	 * AccessToken으로 사용자 인증 받기
	 * 
	 * @return
	 */
	public Twitter getTwitter() {
		twitter = new TwitterFactory().getInstance();
		twitter.setOAuthConsumer(CONSUMER_KEY, CONSUMER_SECRET);

		if (request.getSession() != null) {
			AccessToken accessToken = (AccessToken) request.getSession()
					.getAttribute("accessToken");
			twitter.setOAuthAccessToken(accessToken);
		}

		return twitter;
	}

	public void setTwitter(Twitter twitter) {
		this.twitter = twitter;
	}

}
