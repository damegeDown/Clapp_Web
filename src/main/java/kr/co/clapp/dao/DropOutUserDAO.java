package kr.co.clapp.dao;

import kr.co.clapp.entities.DropOutUserEntity;

import java.util.List;

public interface DropOutUserDAO {
	/**
	 * 탈퇴 회원 목록
	 * @param dropOutUserEntity
	 * @return
	 */
	List<DropOutUserEntity> getDropOutUserList(DropOutUserEntity dropOutUserEntity);
    /**
     * 누적 탈퇴 회원 카운트
     */
	int getDropOutUserCount();
    /**
     * 탈퇴회원 카운트
     * @return
     */
    int getDropOutUserSearchCount(DropOutUserEntity dropOutUserEntity);
	/**
	 * 탈퇴 회원 등록
	 * @param dropOutUserEntity
	 * @return
	 */
	int insertDropOutUser(DropOutUserEntity dropOutUserEntity);


}
