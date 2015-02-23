package kr.co.clapp.entities;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class BoardQnaEntity extends PageEntity implements Serializable{

	private static final long serialVersionUID =1L;
	
	public BoardQnaEntity() {
		super(1L);
	}
	private int boardQnaKey;
	private String qnaCategory;								//도움말 분류(1: 기술, 2: 사이트, 3:일반, 4:계약,제휴,광고, 5:채용, 6:기타)
	private String qnaQuestion;								//질문
	private String qnaAnswer;								//답변
	private String qnaTop10Open;							//탑 10 노출 여부
	private String qnaInsertName;							//등록자
	private Date qnaInsertDate;								//등록일
	private Date qnaRemoveDate;								//삭제일
	private List<Integer> boardQnaKeyArr;								
	private String boardQnaKeyList;								
	
	private List<BoardQnaEntity> boardQnaSelectedList;
	private List<BoardQnaEntity> boardQnaList;
	private int sortListSize;

	public int getBoardQnaKey() {
		return boardQnaKey;
	}
	public void setBoardQnaKey(int boardQnaKey) {
		this.boardQnaKey = boardQnaKey;
	}
	public String getQnaCategory() {
		return qnaCategory;
	}
	public void setQnaCategory(String qnaCategory) {
		this.qnaCategory = qnaCategory;
	}
	public String getQnaQuestion() {
		return qnaQuestion;
	}
	public void setQnaQuestion(String qnaQuestion) {
		this.qnaQuestion = qnaQuestion;
	}
	public String getQnaAnswer() {
		return qnaAnswer;
	}
	public void setQnaAnswer(String qnaAnswer) {
		this.qnaAnswer = qnaAnswer;
	}
	public String getQnaTop10Open() {
		return qnaTop10Open;
	}
	public void setQnaTop10Open(String qnaTop10Open) {
		this.qnaTop10Open = qnaTop10Open;
	}
	public String getQnaInsertName() {
		return qnaInsertName;
	}
	public void setQnaInsertName(String qnaInsertName) {
		this.qnaInsertName = qnaInsertName;
	}
	public Date getQnaInsertDate() {
		return qnaInsertDate;
	}
	public void setQnaInsertDate(Date qnaInsertDate) {
		this.qnaInsertDate = qnaInsertDate;
	}
	public Date getQnaRemoveDate() {
		return qnaRemoveDate;
	}
	public void setQnaRemoveDate(Date qnaRemoveDate) {
		this.qnaRemoveDate = qnaRemoveDate;
	}
	public List<Integer> getBoardQnaKeyArr() {
		return boardQnaKeyArr;
	}
	public void setBoardQnaKeyArr(List<Integer> boardQnaKeyArr) {
		this.boardQnaKeyArr = boardQnaKeyArr;
	}
	public String getBoardQnaKeyList() {
		return boardQnaKeyList;
	}
	public void setBoardQnaKeyList(String boardQnaKeyList) {
		this.boardQnaKeyList = boardQnaKeyList;
	}
	
	public List<BoardQnaEntity> getBoardQnaSelectedList() {
		return boardQnaSelectedList;
	}
	public void setBoardQnaSelectedList(List<BoardQnaEntity> boardQnaSelectedList) {
		this.boardQnaSelectedList = boardQnaSelectedList;
	}
	public List<BoardQnaEntity> getBoardQnaList() {
		return boardQnaList;
	}
	public void setBoardQnaList(List<BoardQnaEntity> boardQnaList) {
		this.boardQnaList = boardQnaList;
	}
	public int getSortListSize() {
		return sortListSize;
	}
	public void setSortListSize(int sortListSize) {
		this.sortListSize = sortListSize;
	}
}
