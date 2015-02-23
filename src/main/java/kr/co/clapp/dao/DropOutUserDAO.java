package kr.co.clapp.dao;

import java.util.List;

import kr.co.clapp.entities.DropOutUserEntity;

public interface DropOutUserDAO {
	/**
	 * 탈퇴 회원 목록
	 * @param dropOutUserEntity
	 * @return
	 */
	List<DropOutUserEntity> getDropOutUserList(DropOutUserEntity dropOutUserEntity);
	/**
	 * 탈퇴 회원 카운트
	 * @param dropOutUserEntity
	 * @return
	 */
	int getDropOutUserCount(DropOutUserEntity dropOutUserEntity);
	/**
	 * 탈퇴 회원 등록
	 * @param dropOutUserEntity
	 * @return
	 */
	int insertDropOutUser(DropOutUserEntity dropOutUserEntity);
	/**
	 * 누적 탈퇴 회원 카운트
	 */
	int getDropOutCount();
	
}
