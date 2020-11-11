package com.likeycakey.cake.biz.controller;

import com.likeycakey.cake.biz.model.service.BizService;
import com.likeycakey.cake.biz.model.vo.BizMember;
import com.likeycakey.cake.detailView.model.vo.*;
import com.likeycakey.cake.member.model.vo.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

@Controller
public class BizController {

	@Autowired
	private BizService bizService; // = new BizServiceImpl();

	// 사업자 로그인
	@RequestMapping(value = "bizLogin.ca", method = RequestMethod.GET)
	public String bizLogin() {

		return "biz/bizLogin";
	}

	// 로그인 체크
	@RequestMapping(value = "loginCheck2.ca", method = RequestMethod.POST)
	public void loginCheck(ModelAndView mv, HttpSession session, Member member, HttpServletResponse response) {

		try {

			PrintWriter out = response.getWriter();
			// 데이터베이스에 저장된 아이디와 비밀번호를 입력된 아이디와 비밀번호를 비교하여 결과값을 result에 저장
			member = bizService.loginCheck(member.getId(), member.getPasswd());

			session.setAttribute("member", member);
			int result = 0;
			if (member != null) {
				result = 1;
			}

			// 결과가 0보다 크면 ok출력
			if (result > 0) {
				out.print("ok");
			} else {
				out.print("no");
			}
			out.flush();
			out.close();

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 로그아웃
	@RequestMapping(value = "logout.ca", method = RequestMethod.GET)
	public ModelAndView memberLogout(HttpSession session, ModelAndView mv) {

		if (session.getAttribute("member") != null) {
			session.invalidate();
		}
		mv.setViewName("redirect:home.ca");

		return mv;
	}

	// 아이디 중복검사
	@RequestMapping(value = "dupid.ca", method = RequestMethod.POST)
	public void dupid(ModelAndView mv, @RequestParam("id") String id, HttpServletResponse response) throws IOException {

		PrintWriter out = response.getWriter();
		int result = bizService.dupid(id);
		if (result > 0)
			out.print("no");
		else
			out.print("ok");
		out.flush();
		out.close();
	}

	// 사업자 회원가입 페이지로 간다
	@RequestMapping(value = "bizJoin.ca", method = RequestMethod.GET)
	public String bizJoin() {

		return "biz/bizJoin";
	}

	// 회원가입한 멤버 등록
	@RequestMapping(value = "bizInsert.ca", method = RequestMethod.POST)
	public ModelAndView bizInsert(Member m, @RequestParam("bizName") String bizName,
			@RequestParam("bizPn") String bizPn, @RequestParam("bizNum") String bizNum,
			@RequestParam("bizDelivery") int bizDelivery, @RequestParam("masterName") String masterName,
			@RequestParam("bizDeliveryYn") String bizDeliveryYn, @RequestParam("bizCustomYn") String bizCustomYn,
			@RequestParam(value = "file", required = false) MultipartFile file, HttpServletRequest request,
			ModelAndView mv) {

		BizMember bm = new BizMember();
		bm.setId(m.getId());
		bm.setBizName(bizName);
		bm.setBizPn(bizPn);
		bm.setBizNum(bizNum);
		bm.setBizDelivery(bizDelivery);
		bm.setMasterName(masterName);
		bm.setBizDeliveryYn(bizDeliveryYn);
		bm.setBizCustomYn(bizCustomYn);

		try {

			// 해당 컨테이너의 구동중인 웹 애플리케이션의 루트 경로 알아냄
			String root = request.getSession().getServletContext().getRealPath("resources");
			// 업로드되는 파일이 저장될 폴더명과 경로 연결 처리
			String savePath = root + "\\img\\member";
			System.out.println("이미지가 저장되는 곳은 " + savePath);

			if (file != null && !file.isEmpty()) {
				if (!new File(savePath).exists()) {
					new File(savePath).mkdir();
				}

				String originFileName = file.getOriginalFilename();
				File fileupload = new File(savePath + "\\" + originFileName);
				file.transferTo(fileupload);
				System.out.println("이미지 저장 완료");
				m.setPhoto(originFileName.substring(0, originFileName.lastIndexOf('.')));
			}
			int result = bizService.insertBiz(m);
			int result2 = bizService.insertBiz2(bm);
			mv.setViewName("redirect:home.ca");
			System.out.println("비즈멤버등록성공");
		} catch (Exception e) {
			mv.setViewName("redirect:home.ca");
			System.out.println(e);
			System.out.println("비즈멤버등록실패");
		}

		return mv;
	}

	// 사업자 회원정보, 매장정보 수정 페이지 이동
	@RequestMapping(value = "bizMypageModify.ca", method = RequestMethod.GET)
	public String bizMypageModify(Model model, HttpSession session) {
		Member m = ((Member) session.getAttribute("member"));
		String bm2 = bizService.getBiz(new BizMember(m.getId()));
		model.addAttribute("mastername", bm2);

		return "biz/bizMypageModify";
	}

	// 사업자 회원정보, 매장정보 수정
	@RequestMapping(value = "bizModify.ca", method = RequestMethod.POST)
	public ModelAndView bizModify(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, @RequestParam("masterName") String masterName,
			@RequestParam("passwd") String passwd, @RequestParam("phone") String phone, ModelAndView mv,
			HttpSession session) {

		Member m = (Member) session.getAttribute("member");
		m.setPasswd(passwd);
		m.setPhone(phone);

		BizMember bm = new BizMember(m.getId(), masterName);

		try {
			if (file != null && !file.isEmpty()) {
				// 해당 컨테이너의 구동중인 웹 애플리케이션의 루트 경로 알아냄
				String root = request.getSession().getServletContext().getRealPath("resources");
				// 업로드되는 파일이 저장될 폴더명과 경로 연결 처리
				String savePath = root + "\\img\\member";

				System.out.println("이미지가 저장되는 곳은 " + savePath);

				if (!new File(savePath).exists()) {
					new File(savePath).mkdir();
				}

				String originFileName = file.getOriginalFilename();
				File fileupload = new File(savePath + "\\" + originFileName);
				file.transferTo(fileupload);
				new File(savePath + "\\" + m.getPhoto()).delete();
				m.setPhoto(originFileName);
			}

			int result = bizService.bizModify(m);
			int result2 = bizService.bizModify2(bm);
			session.setAttribute("member", m);
			mv.setViewName("redirect:home.ca");
			System.out.println("비즈 마이페이지 수정 성공");

		} catch (Exception e) {
			System.out.println("비즈 마이페이지 수정 실패" + e);
		}
		return mv;
	}

	// 등록된 케이크가 하나도 없는 상태에서 케이크 등록하는 페이지
	@RequestMapping(value = "nocakeUpload.ca", method = RequestMethod.GET)
	public String nocakeUpload() {

		return "biz/nocakeUpload";
	}

	// 등록한 케이크가 있는 상태에서 케이크 등록하는 페이지
	@RequestMapping(value = "yescakeUpload.ca", method = RequestMethod.GET)
	public String yescakeUpload() {

		return "biz/yescakeUpload";
	}

	// 완제품 케이크 등록 페이지
	@RequestMapping(value = "productCakeUpload.ca", method = RequestMethod.GET)
	public String productCakeUpload() {

		return "biz/productCakeUpload";
	}

	// productCakeUpload 페이지에서 등록하기를 누르면 실제로 데이터베이스에 값을 저장
	@RequestMapping(value = "cakeInsert.ca", method = RequestMethod.POST)
	public ModelAndView cakeInsert(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "file", required = false) MultipartFile file,
			@RequestParam(name = "inputtag1", required = false) String inputtag1,
			@RequestParam(name = "inputtag2", required = false) String inputtag2,
			@RequestParam(name = "inputtag3", required = false) String inputtag3,
			@RequestParam(name = "inputtag4", required = false) String inputtag4,
			@RequestParam(name = "inputtag5", required = false) String inputtag5, ModelAndView mv,
			ProductBoard productBoard) throws IOException {

		System.out.println("cakeInsert.ca입니다(배송비 꼭 숫자 넣어주세요!!!!)");
		// 해당 컨테이너의 구동중인 웹 애플리케이션의 루트 경로 알아냄
		String root = request.getSession().getServletContext().getRealPath("resources");
		// 업로드되는 파일이 저장될 폴더명과 경로 연결 처리
		String savePath = root + "\\img\\product";
		System.out.println("이미지가 저장되는 곳은 " + savePath);

		if (file != null && !file.isEmpty()) {
			if (!new File(savePath).exists()) {
				new File(savePath).mkdir();
			}

			// 업로도된 파일명을 "년월일시분초.확장자" 로 변경함
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String originFileName = file.getOriginalFilename();
			String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "."
					+ originFileName.substring(originFileName.lastIndexOf(".") + 1);

			File renameFile = new File(savePath + "\\" + renameFileName);
			file.transferTo(renameFile);
			productBoard.setpImg(renameFileName.substring(0, renameFileName.lastIndexOf('.')));
		}

		// productBoard에 이미지 넣기
		String inputtag = "";
		if (inputtag1 != "") {
			inputtag = inputtag + "#" + inputtag1;
			if (inputtag2 != "") {
				inputtag = inputtag + ", #" + inputtag2;
				if (inputtag3 != "") {
					inputtag = inputtag + ", #" + inputtag3;
					if (inputtag4 != "") {
						inputtag = inputtag + ", #" + inputtag4;
						if (inputtag5 != "") {
							inputtag = inputtag + ", #" + inputtag5;
						}
					}
				}
			}
		}

		productBoard.setPbTag(inputtag);

		// 상품정보
		System.out.println(" 상품정보 : " + productBoard);

		if (bizService.insertProductBoard(productBoard) > 0) {
			System.out.println("프로덕트 케이크 넣기 성공");
			mv.setViewName("biz/productCakeUpload");
		} else {
			System.out.println("프로덕트 케이크 넣기 실패");
			mv.addObject("error", "게시 원글 등록 서비스 실패!");
			mv.setViewName("biz/productCakeUpload");
		}
		return mv;
	}

	// 커스텀 케이크 등록 페이지로 이동
	@RequestMapping(value = "customCakeUpload.ca", method = RequestMethod.GET)
	public String customCakeUpload(HttpSession session) {

		return "biz/customCakeUpload";
	}

	@RequestMapping(value = "customCakeInsert.ca", method = RequestMethod.POST)
	public ModelAndView customCakeInsert(ModelAndView mv, CustomBoard customboard, CustomCream customcream,
			CustomSheet customsheet, CustomTopping customtopping, CustomSize customsize,
			@RequestParam(name = "inputtag1", required = false) String inputtag1,
			@RequestParam(name = "inputtag2", required = false) String inputtag2,
			@RequestParam(name = "inputtag3", required = false) String inputtag3,
			@RequestParam(name = "inputtag4", required = false) String inputtag4,
			@RequestParam(name = "inputtag5", required = false) String inputtag5,
			@RequestParam(name = "shPrice1", required = false) String shPrice1,
			@RequestParam(name = "shPrice2", required = false) String shPrice2,
			@RequestParam(name = "shPrice3", required = false) String shPrice3,
			@RequestParam(name = "shPrice4", required = false) String shPrice4,
			@RequestParam(name = "shPrice5", required = false) String shPrice5,
			@RequestParam(name = "crPrice1", required = false) String crPrice1,
			@RequestParam(name = "crPrice2", required = false) String crPrice2,
			@RequestParam(name = "crPrice3", required = false) String crPrice3,
			@RequestParam(name = "crPrice4", required = false) String crPrice4,
			@RequestParam(name = "crPrice5", required = false) String crPrice5,
			@RequestParam(name = "tpPrice1", required = false) String tpPrice1,
			@RequestParam(name = "tpPrice2", required = false) String tpPrice2,
			@RequestParam(name = "tpPrice3", required = false) String tpPrice3,
			@RequestParam(name = "tpPrice4", required = false) String tpPrice4,
			@RequestParam(name = "tpPrice5", required = false) String tpPrice5,
			@RequestParam(name = "sizePrice1", required = false) String sizePrice1,
			@RequestParam(name = "sizePrice2", required = false) String sizePrice2,
			@RequestParam(name = "sizePrice3", required = false) String sizePrice3,
			@RequestParam(name = "sizePrice4", required = false) String sizePrice4,
			@RequestParam(name = "sizePrice5", required = false) String sizePrice5) {

		String temp1[] = null;
		String temp2[] = null;
		String temp3[] = null;
		String temp4[] = null;
		String temp11[] = null;
		String temp22[] = null;
		String temp33[] = null;
		String temp44[] = null;
		
		int temp111 = 0;
		int temp222 = 0;
		int temp333 = 0;
		int temp444 = 0;
		int temp555 = 0;

		try {
			// Num temp
			temp1 = customsheet.getShNum().split(",");
			temp2 = customcream.getCrNum().split(",");
			temp3 = customtopping.getTpNum().split(",");
			temp4 = customsize.getSizeNum().split(",");

			// Name temp
			temp11 = customsheet.getShName().split(",");
			temp22 = customcream.getCrName().split(",");
			temp33 = customtopping.getTpName().split(",");
			temp44 = customsize.getSizeName().split(",");

			if (shPrice1 != null) {
				temp111 = Integer.parseInt(shPrice1);
				customsheet.setShNum(temp1[0]);
				customsheet.setShName(temp11[0]);
				customsheet.setShPrice(temp111);
				bizService.customSheetInsert(customsheet);

				if (shPrice2 != null) {
					temp222 = Integer.parseInt(shPrice2);
					customsheet.setShNum(temp1[1]);
					customsheet.setShName(temp11[1]);
					customsheet.setShPrice(temp222);
					bizService.customSheetInsert(customsheet);

					if (shPrice3 != null) {
						temp333 = Integer.parseInt(shPrice3);
						customsheet.setShNum(temp1[2]);
						customsheet.setShName(temp11[2]);
						customsheet.setShPrice(temp333);
						bizService.customSheetInsert(customsheet);

						if (shPrice4 != null) {
							temp444 = Integer.parseInt(shPrice4);
							customsheet.setShNum(temp1[3]);
							customsheet.setShName(temp11[3]);
							customsheet.setShPrice(temp444);
							bizService.customSheetInsert(customsheet);

							if (shPrice5 != null) {
								temp555 = Integer.parseInt(shPrice5);
								customsheet.setShNum(temp1[4]);
								customsheet.setShName(temp11[4]);
								customsheet.setShPrice(temp555);
								bizService.customSheetInsert(customsheet);
							}
						}
					}
				}
			}

			if (crPrice1 != null) {
				temp111 = Integer.parseInt(crPrice1);
				customcream.setCrNum(temp2[0]);
				customcream.setCrName(temp22[0]);
				customcream.setCrPrice(temp111);
				bizService.customCreamInsert(customcream);

				if (crPrice2 != null) {
					temp222 = Integer.parseInt(crPrice2);
					customcream.setCrNum(temp2[1]);
					customcream.setCrName(temp22[1]);
					customcream.setCrPrice(temp222);
					bizService.customCreamInsert(customcream);

					if (crPrice3 != null) {
						temp333 = Integer.parseInt(crPrice3);
						customcream.setCrNum(temp2[2]);
						customcream.setCrName(temp22[2]);
						customcream.setCrPrice(temp333);
						bizService.customCreamInsert(customcream);

						if (crPrice4 != null) {
							temp444 = Integer.parseInt(crPrice4);
							customcream.setCrNum(temp2[3]);
							customcream.setCrName(temp22[3]);
							customcream.setCrPrice(temp444);
							bizService.customCreamInsert(customcream);

							if (crPrice5 != null) {
								temp555 = Integer.parseInt(crPrice5);
								customcream.setCrNum(temp2[4]);
								customcream.setCrName(temp22[4]);
								customcream.setCrPrice(temp555);
								bizService.customCreamInsert(customcream);
							}
						}
					}
				}
			}

			if (tpPrice1 != null) {
				temp111 = Integer.parseInt(tpPrice1);
				customtopping.setTpNum(temp3[0]);
				customtopping.setTpName(temp33[0]);
				customtopping.setTpPrice(temp111);
				bizService.customToppingInsert(customtopping);

				if (tpPrice2 != null) {
					temp222 = Integer.parseInt(tpPrice2);
					customtopping.setTpNum(temp3[1]);
					customtopping.setTpName(temp33[1]);
					customtopping.setTpPrice(temp222);
					bizService.customToppingInsert(customtopping);

					if (tpPrice3 != null) {
						temp333 = Integer.parseInt(tpPrice3);
						customtopping.setTpNum(temp3[2]);
						customtopping.setTpName(temp33[2]);
						customtopping.setTpPrice(temp333);
						bizService.customToppingInsert(customtopping);

						if (tpPrice4 != null) {
							temp444 = Integer.parseInt(tpPrice4);
							customtopping.setTpNum(temp3[3]);
							customtopping.setTpName(temp33[3]);
							customtopping.setTpPrice(temp444);
							bizService.customToppingInsert(customtopping);

							if (tpPrice5 != null) {
								temp555 = Integer.parseInt(tpPrice5);
								customtopping.setTpNum(temp3[4]);
								customtopping.setTpName(temp33[4]);
								customtopping.setTpPrice(temp555);
								bizService.customToppingInsert(customtopping);
							}
						}
					}
				}
			}

			if (sizePrice1 != null) {
				temp111 = Integer.parseInt(sizePrice1);
				customsize.setSizeNum(temp4[0]);
				customsize.setSizeName(temp44[0]);
				customsize.setSizePrice(temp111);
				bizService.customSizeInsert(customsize);
			}else if(sizePrice1 == null) {
				
			}
			if (sizePrice2 != null) {
				temp222 = Integer.parseInt(sizePrice2);
				customsize.setSizeNum(temp4[1]);
				customsize.setSizeName(temp44[1]);
				customsize.setSizePrice(temp222);
				bizService.customSizeInsert(customsize);
			}
			if (sizePrice3 != null) {
				temp333 = Integer.parseInt(sizePrice3);
				customsize.setSizeNum(temp4[2]);
				customsize.setSizeName(temp44[2]);
				customsize.setSizePrice(temp333);
				bizService.customSizeInsert(customsize);
			}
			if (sizePrice4 != null) {
				temp444 = Integer.parseInt(sizePrice4);
				customsize.setSizeNum(temp4[3]);
				customsize.setSizeName(temp44[3]);
				customsize.setSizePrice(temp444);
				bizService.customSizeInsert(customsize);
			}
			if (sizePrice5 != null) {
				temp555 = Integer.parseInt(sizePrice5);
				customsize.setSizeNum(temp4[4]);
				customsize.setSizeName(temp44[4]);
				customsize.setSizePrice(temp555);
				bizService.customSizeInsert(customsize);

			}

			String inputtag = "";
			if (inputtag1 != null) {
				inputtag = inputtag + "#" + inputtag1;
				if (inputtag2 != null) {
					inputtag = inputtag + ", #" + inputtag2;
					if (inputtag3 != null) {
						inputtag = inputtag + ", #" + inputtag3;
						if (inputtag4 != null) {
							inputtag = inputtag + ", #" + inputtag4;
							if (inputtag5 != null) {
								inputtag = inputtag + ", #" + inputtag5;
							}
						}
					}
				}
			}

			customboard.setCbTag(inputtag);
			bizService.customBoardInsert(customboard);

			System.out.println("커스텀 케이크 보드 insert 성공!");
			mv.setViewName("redirect:uploadComplete.ca");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("커스텀 케이크 보드 insert 실패...   " + e);
		}

		return mv;
	}

	// 케이크 등록하기 버튼 클릭 후 완제품케이크를 등록할건지 커스텀 케이크를 등록할건지 선택하는 페이지
	@RequestMapping(value = "pcSelect.ca", method = RequestMethod.GET)
	public String pcSelect() {

		return "biz/pcSelect";
	}

	// 사업자에게 들어온 문의글 모아보는 페이지
	@RequestMapping(value = "bizQNA.ca", method = RequestMethod.GET)
	public String bizQNA() {

		return "biz/bizQNA";
	}

	// "등록이 완료되었습니다"페이지
	@RequestMapping(value = "uploadComplete.ca", method = RequestMethod.GET)
	public String uploadOK() {

		return "biz/uploadComplete";
	}
}
