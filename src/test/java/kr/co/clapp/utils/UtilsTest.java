package kr.co.clapp.utils;


import static org.junit.Assert.*;

import java.util.Date;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("classpath:configs/mvc-dispatcher-servlet.xml")
public class UtilsTest {
	@Before
	public void before() throws Exception {
	}
	@After
	public void after() throws Exception {
	}
	/**
	 * 메일 수신확인 성공
	 * case : 메일키가 넘어와 메일수신 확인 성공시
	 * @throws Exception
	 */
	@Test
	public void testAddNowDate() throws Exception {
		Date addDate = Utils.getAddNowDate(60);
		
		assertNotNull(addDate);
	}
}
