package kr.co.clapp.service;

import static org.hamcrest.CoreMatchers.*;
import static org.junit.Assert.*;
import kr.co.clapp.constants.CommonCode;
import kr.co.clapp.entities.EcrmEntity;
import kr.co.clapp.service.ecrm.EcrmService;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration("classpath:configs/mvc-dispatcher-servlet.xml")
public class EcrmServiceTest {
	@Autowired
	private EcrmService ecrmService;
	private EcrmEntity ecrmEntity;
	@Before
	public void before() throws Exception {
		ecrmEntity= new EcrmEntity();
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
	@Rollback(true)
	public void testSetMailOpenSuccess() throws Exception {
	  ecrmEntity.setMailMasterKey(1);
	  int result = ecrmService.setMailOpen(ecrmEntity);
	  assertThat(result, is(1));
	}
	/**
	 * 메일 수신확인 실패
	 * case : 메일키가 넘어오지 않아 메일수신 확인 실패
	 * @throws Exception
	 */
	@Test
	@Rollback(true)
	public void testSetMailOpenFail() throws Exception {
	  //ecrmEntity.setMailMasterKey(1);
	  int result = ecrmService.setMailOpen(ecrmEntity);
	  assertThat(result, is(CommonCode.ZERO));
	}
	
	/**
	 * 설문 리스트
	 * case : 정상적인 정보를 불러왔을때.
	 * @throws Exception
	 */
	@Test
	public void testGetSurveyList() throws Exception {
      ecrmEntity = ecrmService.getSurveyList(ecrmEntity);
      assertThat(ecrmEntity, is(notNullValue()));
	}
	
	/**
	 * 설문 상세
	 * case : 정상적인 정보를 불러왔을때.
	 * @throws Exception
	 */
	@Test
	public void testGetSurveyDetail(Model model) throws Exception {
	  ecrmEntity.setSurveyMasterKey(1);
	  ecrmEntity = ecrmService.getSurveyDetail(ecrmEntity, model);
	  //상세 정보
	  assertThat(ecrmEntity, is(notNullValue()));
	  //상세 질문 리스트
	  assertNotNull(ecrmEntity.getEcrmList());
	  //설문 리포트
	  assertNotNull(ecrmEntity.getSurveyList());
	}
}
