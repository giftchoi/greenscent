package controller;

import diaryController.*;
import marketController.*;
import memberController.*;
import qnaController.*;
import replyController.*;
import tipController.*;


public class HandlerMapping {
	private static HandlerMapping instance=new HandlerMapping();
	private HandlerMapping(){}
	public static HandlerMapping getInstance(){
		return instance;
	}
	public Controller create(String command){
		Controller c=null;
		if(command.equals("home")) {
			c=new HomeController();
		}else if(command.equals("upload")){
			c = new UploadImgController();
		}else if(command.equals("login")) {
			c= new LoginController();
		}else if(command.equals("loginForm")) {
			c = new LoginFormController();
		}else if(command.equals("logout")) {
			c = new LogoutController();
		}else if(command.equals("registerMemberForm")) {
			c = new RegisterMemberFormController();
		}else if(command.equals("registerMember")) {
			c = new RegisterMemberController();
		}else if(command.equals("mypage")) {
			c = new FindMemberController();
		}else if(command.equals("updateMemberForm")) {
			c = new UpdateMemberFormController();
		}else if(command.equals("updateMember")) {
			c = new UpdateMemberController();
		}else if(command.equals("deleteMember")) {
			c = new DeleteMemberController();
		}// Member
		//---------------------------------------------------------
		else if(command.equals("diaryList")) {
			c = new DiaryListController();
		}else if(command.equals("diaryDetail")) {
			c = new DiaryDetailController();
		}else if(command.equals("publicDiaryList")) {
			c = new PublicDiaryListController();
		}else if(command.equals("publicDiaryDetail")) {
			c = new PublicDiaryDetailController();
		}else if(command.equals("registerDiaryForm")) {
			c = new RegisterDiaryFormController();
		}else if(command.equals("registerDiary")) {
			c = new RegisterDiaryController();
		}else if(command.equals("updateDiaryForm")) {
			c = new UpdateDiaryFormController();
		}else if(command.equals("updateDiary")) {
			c = new UpdateDiaryController();
		}else if(command.equals("deleteDiary")) {
			c = new DeleteDiaryController();
		}else if(command.equals("diarySearch")) {
			c = new DiarySearchController();
		}else if(command.equals("publicDiarySearch")) {
			c = new PublicDiarySearchController();
		}
		// diary
		//---------------------------------------------------------
		else if(command.equals("tipRegisterForm")) {
			c = new TipRegisterFormController();
		}else if(command.equals("tipRegister")) {
			c = new TipRegisterController();
		}else if(command.equals("tipUpdateForm")) {
			c = new TipUpdateFormController();
		}else if(command.equals("tipUpdate")) {
			c = new TipUpdateController();
		}else if(command.equals("tipDelete")) {
			c = new TipDeleteController();
		}else if(command.equals("tipList")) {
			c = new TipListController();
		}else if(command.equals("tipDetail")) {
			c = new TipDetailContoller();
		}else if(command.equals("tipDetailNo")) {
			c = new TipDetailNoContoller();
		}else if(command.equals("tipPostSearch")) {
			c = new tipPostSearchController();
		}
		
		//tip
		//--------------------------------------------
		else if(command.equals("marketDeletePost")) {
			c = new MarketDeletePostController();
		}else if(command.equals("marketList")) {
			c = new MarketListController();
		}else if(command.equals("marketPostDetail")) {
			c = new MarketPostDetailController();
		}else if(command.equals("marketUpdatePost")) {
			c = new MarketUpdatePostController();
		}else if(command.equals("marketUpdatePostForm")) {
			c = new MarketUpdatePostFormController();
		}else if(command.equals("marketWritePost")) {
			c = new MarketWritePostController();
		}else if(command.equals("marketWritePostForm")) {
			c = new MarketWritePostFormController();
		}//market
		//-----------------------------------------------
		else if(command.equals("registerQnaForm")) {
			c = new RegisterQnaFormController();
		}else if(command.equals("registerQna")) {
			c = new RegisterQnaController();
		}else if(command.equals("qnaList")) {
			c = new QnaListController();
		}else if(command.equals("qnaDetail")) {
			c = new QnaDetailController();
		}else if(command.equals("updateQna")) {
			c = new UpdateQnaController();
		}else if(command.equals("updateQnaForm")) {
			c = new UpdateQnaFormController();
		}else if(command.equals("deleteQna")) {
			c = new DeleteQnaController();
		}//QnA
		//-----------------------------------------
		else if(command.equals("writeReplyInTip")) {
			c = new WriteReplyInTipController();
		}else if(command.equals("writeReplyInQna")) {
			c = new WriteReplyInQnaController();
		}else if(command.equals("writeReplyInMarket")) {
			c = new WriteReplyInMarketController();
		}else if(command.equals("writeReplyInDiary")) {
			c = new WriteReplyInDiaryController();
		}else if(command.equals("deleteReplyInTip")) {
			c = new DeleteReplyInTipController();
		}else if(command.equals("deleteReplyInQna")) {
			c = new DeleteReplyInQnaController();
		}else if(command.equals("deleteReplyInMarket")) {
			c = new DeleteReplyInMarketController();
		}else if(command.equals("deleteReplyInDiary")) {
			c = new DeleteReplyInDiaryController();
		} // reply
		return c;
	}
}










