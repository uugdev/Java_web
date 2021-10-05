package web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.dto.Board;
import web.service.face.BoardService;
import web.service.impl.BoardServiceImpl;
import web.util.Paging;

@WebServlet("/board/list")
public class BoardListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//서비스 객체
	private BoardService boardService = new BoardServiceImpl();
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("/board/list [GET]");
		
		//요청파라미터를 전달하여 paging객체 생성하기
		Paging paging = boardService.getPaging(req);
		System.out.println("BoardListController [GET] - " + paging);
		
		
		//게시글 정보 전체 조회하기
//		List<Board> boardLlist = boardService.getList();
		List<Board> boardList = boardService.getList(paging);
		
		//조회결과를 모델값으로 전달하기
		req.setAttribute("boardList", boardList);
		
		//페이징 정보 MODEL값 전달
		req.setAttribute("paging", paging);
		
		req.getRequestDispatcher("/WEB-INF/views/board/list.jsp").forward(req, resp);
		
		
		
	}
	

	
	

}
