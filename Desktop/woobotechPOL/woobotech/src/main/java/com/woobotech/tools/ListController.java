package com.woobotech.tools;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

/*****************************************************************************************************************
 * 페이징을 포함한 목록을 컨트롤한다. 1. servlet설정에서 페이지 설정 정보를 주입받는다. 2. 페이징 query를 DAO에 구현한다. 3. View 페이지에
 * javascript, useBean, 필수 input, 목록, 페이징을 구현한다.
 * 
 * @author BESTIST create : 2012-11-29
 * 
 *         ex)
 * 
 *         //******* [xxx-servlet.xml] View의 url, 목록에 보일 row 갯수, 페이징에 보일 페이지 번호 갯수를 주입시켜준다.
 *         <bean name="/user.do" class="org.ecom.controller.UserController" />
 *         <bean name="/user_list.do" class="org.ecom.controller.UserListController">
 *         <property name="targetUrl" value="/ecom/user_list.jsp"></property>
 *         <property name="itemCountPerPage" value="5"></property>
 *         <property name="pageCountPerPaging" value="10"></property> </bean>
 * 
 *         //****** [DAO] 검색어와 page, itemCountPerPage로 검색을 하는 메소드(getUserCount)와 검색된 갯수를 알려줄
 *         메소드(getUserListCount)를 생성한다. // 검색 조건에 따라 다양한 검색 메소드를 준비한다. public List<User>
 *         getUserList(String name, int page, int itemCountPerPage) { String query = "" + "SELECT
 *         TOP "+ itemCountPerPage +" u.SEQ, u.USER_ID, u.DEPART_ID, u.NAME, d.DEPART_NAME " + "FROM
 *         ecom.dbo.T_USER AS u LEFT OUTER JOIN ecom.dbo.T_DEPARTMENT AS d ON d.DEPART_ID =
 *         u.DEPART_ID " + "WHERE u.SEQ <= ( " + " SELECT MIN(SEQ) " + " FROM ( " + " SELECT TOP "+
 *         ((page-1) * itemCountPerPage + 1) +" SEQ " + " FROM ecom.dbo.T_USER " + " WHERE NAME like
 *         ? " + " ORDER BY SEQ DESC " + " ) AS A) " + " AND u.NAME like ? " + "ORDER BY u.SEQ
 *         DESC"; return (List<User>)this.jdbcTemplate.query(query, new Object[] { "%"+name+"%",
 *         "%"+name+"%" }, this.userMapper); } public int getUserListCount(String name) { String
 *         query = ""+ "SELECT COUNT(*) AS cnt " + "FROM ecom.dbo.T_USER " + "WHERE NAME like ? ";
 *         return this.jdbcTemplate.queryForInt(query, new Object[] { "%"+name+"%" }); }
 * 
 *         //******* [View 페이지] 검색을 처리할 javascript 함수 function getUserList(page, departId, keyword)
 *         { $.ajax({ type:"POST", url:"/user_list.do", dataType:"html",
 *         data:"page="+page+"&departId="+departId+"&keyword="+escape(encodeURIComponent(keyword)),
 *         success:function(msg){ $("#listTable").html(msg); } }); } function searchList(frm, page)
 *         { var departId = frm.departId.value; var keyword = frm.keyword.value;
 * 
 *         getUserList(page, departId, keyword);
 * 
 *         return false; }
 * 
 *         //******* [View 페이지] bean을 request로 받아온다.
 *         <jsp:useBean id="board" type="java.util.List" scope="request" />
 *         <jsp:useBean id="currentPage" type="java.lang.Integer" scope="request" />
 *         <jsp:useBean id="maxPage" type="java.lang.Integer" scope="request" />
 *         <jsp:useBean id="paging" type="java.util.List" scope="request" />
 * 
 *         //******* [View 페이지] 페이징 처리를 위해 currentPage와 maxPage를 hidden으로 셋팅한다.
 *         <input type="hidden" name="currentPage" value="${ currentPage }" />
 *         <input type="hidden" name="maxPage" value="${ maxPage }" />
 * 
 *         //******* [View 페이지] 목록 부분을 처리한다. 검색된 자료만큼 foreach를 돌리거나 자료가 없을 때는 적절한 안내를 한다.
 *         <c:if test="${ board.size() > 0 }"> <c:forEach var="vo" items="${ board }">
 *         <tr>
 *         <td><input type="checkbox" name="box"></td>
 *         <td>${ vo.departName }</td>
 *         <td>${ vo.userId }</td>
 *         <td>${ vo.name }</td>
 *         <td>IKE-DESKTOP</td>
 *         <td>2011-03-11 12:31:19.0</td>
 *         </tr>
 *         </c:forEach> </c:if>
 * 
 *         <c:if test="${ userList.size() == 0 }">
 *         <tr>
 *         <td colspan="6" style="height:179px; text-align:center;">검색된 자료가 없습니다.</td>
 *         </tr>
 *         </c:if>
 * 
 *         //******* [View 페이지] 페이징 부분. javascript에 설정한 searchList()를 통해 페이징한다.
 *         <div class="pagelist"> <div class="num">
 *         <ul>
 *         <li class="mar0"><button type="button" class="btn1" onclick="searchList(this.form,
 *         1)">&nbsp;<<&nbsp;</button></li>
 *         <li><button type="button" class="btn1" onclick="if(this.form.currentPage.value>1)
 *         searchList(this.form, ${currentPage-1});">&nbsp;<&nbsp;</button></li>
 *         <c:forEach var="pg" items="${ paging }"> <c:if test="${ pg == currentPage }">
 *         <li><button type="button" class="btn" style="font-weight:bold;">&nbsp;${ pg
 *         }&nbsp;</button></li> </c:if> <c:if test="${ pg != currentPage }">
 *         <li><button type="button" class="btn" onclick="searchList(this.form, ${pg});">&nbsp;${ pg
 *         }&nbsp;</button></li> </c:if> </c:forEach>
 *         <li><button type="button" class="btn1" onclick=
 *         "if(this.form.currentPage.value<${maxPage}) searchList(this.form,
 *         ${currentPage+1});">&nbsp;>&nbsp;</button></li>
 *         <li><button type="button" class="btn1" onclick="searchList(this.form,
 *         ${maxPage})">&nbsp;>>&nbsp;</button></li>
 *         </ul>
 *         </div><img src="/images/btn_del.png" alt="삭제버튼" class="pointer"> </div>
 *****************************************************************************************************************/
public class ListController implements Controller {

  /**
   * 목록이 담기는 List
   */
  public List board;
  /**
   * 오픈하려는 페이지 수
   */
  public int page;
  /**
   * DB연결 및 bean이 설정된 ApplicationContext
   */
  public WebApplicationContext context;
  /**
   * 목록에 뿌려질 행의 수
   */
  public int itemCountPerPage;
  /**
   * 페이징에 노출될 페이지 번호의 갯수
   */
  public int pageCountPerPaging;
  /**
   * View 페이지의 url
   */
  public String targetUrl;
  /**
   * 처리결과 코드 : 목록에 추가, 수정, 삭제 등을 한 후에 다시 목록을 뿌려줄 경우 활용할 수 있다.
   */
  public String returnCode = "";
  /**
   * 처리결과 메세지 : 목록에 추가, 수정, 삭제 등을 한 후에 다시 목록을 뿌려줄 경우 활용할 수 있다.
   */
  public String returnMessage = "";

  public ModelAndView mav = new ModelAndView();

  /**
   * ModelAndView에 설정될 View의 url을 주입한다.
   * 
   * @param url
   */
  public void setTargetUrl(String url) {
    this.targetUrl = url;
  }

  /**
   * 목록에 보일 아이템(row)의 수를 주입한다.
   * 
   * @param itemCountPerPage
   */
  public void setItemCountPerPage(int itemCountPerPage) {
    this.itemCountPerPage = itemCountPerPage;
  }

  /**
   * 페이징에 보일 페이지 번호의 갯수를 주입한다.
   * 
   * @param pagingCountPerPaging
   */
  public void setPageCountPerPaging(int pagingCountPerPaging) {
    this.pageCountPerPaging = pagingCountPerPaging;
  }

  /**
   * HttpServletRequest의 session에서 뽑아낸 ServletContext를 통해 WebApplicationContext를 생성하여 리턴한다
   * WebApplicationContext는 WEB-INF의 web.xml에 설정한 applicationContext.xml이 설정된다.
   * 
   * @param req
   * @return WebApplicationContext
   */
  public static WebApplicationContext getContext(HttpServletRequest req) {
    ServletContext sc = req.getSession().getServletContext();
    return WebApplicationContextUtils.getRequiredWebApplicationContext(sc);
  }

  /**
   * 검색된 항목들의 갯수와 페이지당 아이템 갯수를 통해 마지막 페이지 번호를 계산하여 리턴한다.
   * 
   * @param itemCount
   * @param itemCountPerPage
   * @return int
   */
  public static int getMaxPage(int itemCount, int itemCountPerPage) {
    return (int) Math.ceil((float) itemCount / (float) itemCountPerPage);
  }

  /**
   * 마지막 페이지 번호, 페이징에 나열될 페이지번호의 갯수, 전역변수에 담겨있는 현재 페이지 번호를 통해 페이징에 나열될 페이지 번호가 담긴 List를 생성하여 반환한다.
   * 
   * @param maxPage
   * @param pageCountPerPaging
   * @return
   */
  public static List getPaging(int page, int maxPage, int pageCountPerPaging) {
    List paging = new ArrayList();
    int startPage = (page - 1) / pageCountPerPaging * pageCountPerPaging + 1;
    int pageNum = startPage;

    int i = 1;
    while (i <= pageCountPerPaging) {
      paging.add(pageNum);
      pageNum++;
      if (pageNum > maxPage)
        break;
      i++;
    }
    return paging;
  }

  public ModelAndView getBoardModelAndView(int itemCount) {

    // 검색결과의 갯수(itemCount)로 전체 페이지 수(maxPage)를 구하고, 전체페이지로 페이징에 뿌려줄 페이지 번호가 담긴 List를(paging) 만든다.
    int maxPage = this.getMaxPage(itemCount, itemCountPerPage);
    List paging = this.getPaging(page, maxPage, pageCountPerPaging);

    mav.setViewName(targetUrl);
    mav.addObject("board", board);
    mav.addObject("itemCount", itemCount);
    mav.addObject("currentPage", page);
    mav.addObject("maxPage", maxPage);
    mav.addObject("paging", paging);
    mav.addObject("returnCode", this.returnCode);
    mav.addObject("returnMessage", this.returnMessage);
    return mav;
  }

  @Override
  public ModelAndView handleRequest(HttpServletRequest req, HttpServletResponse res)
      throws Exception {
    return null;
  }

}
