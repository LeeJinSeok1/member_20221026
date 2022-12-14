package com.icia.member.controller;

import com.icia.member.dto.MemberDTO;
import com.icia.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.lang.reflect.Member;
import java.util.List;

@Controller
public class MemberController {
    @Autowired
    private MemberService memberService;

    @GetMapping("/save")
    public String savePage(){
        return "memberSave";
    }

    @PostMapping("/save")
    public String save(@ModelAttribute MemberDTO memberDTO, Model model) {
        boolean result = memberService.save(memberDTO);
        model.addAttribute("member",memberDTO);
        if(result){
            return "memberLogin";
        }else {
            return "saveFail";
        }
    }

    @GetMapping("/members")
    public String members(Model model) {
        List<MemberDTO> mList = memberService.members();
        model.addAttribute("members",mList);
        return "memberList";
    }

    @GetMapping("/memberDetail")
    public String findMember(@RequestParam("memberId") Long memberId,Model model) {
        MemberDTO memberFind = memberService.findMember(memberId);
        model.addAttribute("memberFind",memberFind);
        return "memberDetail";
    }

    @GetMapping("/login")
    public String loginPage(){
        return "memberLogin";
    }

    @PostMapping("/login")
    public String login(@ModelAttribute MemberDTO memberDTO, HttpSession session,
                        Model model){
        boolean result= memberService.login(memberDTO);
       if(result){
           // 세션에 로그인한 사용자의 이메일을 저장
           session.setAttribute("loginEmail", memberDTO.getMemberEmail());
           model.addAttribute("mEmail",memberDTO.getMemberEmail());
           return "memberMain";
       }else{
           return "memberLogin";
       }
    }

    @GetMapping("/delete")
    public String delete(@RequestParam("memberId") Long id,Model model){
        memberService.delete(id);
        // 리스트가 없기때문에 반복문이 돌지 않음
        //해결방법 1. 삭제 후 목록을 DB에서 가져오고 memberList.jsp로간다.
        List<MemberDTO> memberDTOList= memberService.members();
        model.addAttribute("members",memberDTOList);

        return "redirect:/members";

    }

    //memberEmail로 DB에서 해당 회원의 전체 정보 조회
    //쎄션은 리턴타입이 오브젝트임.
    //쎄션은 오브젝트타입이고 좌변은 스트링 타입이라서
    //크기가 안 맞기 때문에 강제 형 변환을 진행해 주어야함.
    //(String)으로
    //추상메서드는 실행블록이 없는 메서드 (abstract)
    @GetMapping("/update")
    public String update(HttpSession session,Model model) {
       // session에서 값을 가져오기
        String memberEmail=(String)session.getAttribute("loginEmail");
        MemberDTO member1 = memberService.update(memberEmail);
        model.addAttribute("model",member1);
        return "memberUpdate";
    }
    @PostMapping("/update")
    public String updating(@ModelAttribute MemberDTO memberDTO){
        boolean result = memberService.updating(memberDTO);
        if(result){
            return "redirect:/memberDetail?memberId="+memberDTO.getMemberId();

        }else{
            return "index";
        }

    }
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "index";
    }
    @GetMapping("ajax-ex")
    public String ajaxEx() {
        return "ajaxEx";
    }
    @GetMapping("/ajax1")
    public @ResponseBody String ajax1() {
        System.out.println("MemberController.ajax1");
        return "ok";
    }
    @PostMapping("/ajax2")
    public @ResponseBody String ajax2() {
        System.out.println("MemberController.ajax2");
        return "good";
    }
    @GetMapping("/ajax3")
    public @ResponseBody String ajax3(@RequestParam("value1") String val1,
                                      @RequestParam("value2") String val2){
        System.out.println("val1 = " + val1 + ", val2 = " + val2);
        return "집에 보내줘";

    }
    @PostMapping("/ajax4")
    public @ResponseBody String ajax4(@RequestParam("value1") String val1,
                                      @RequestParam("value2") String val2){
        System.out.println("val1 = " + val1 + ", val2 = " + val2);
        return "go home";
    }
    @PostMapping("/ajax5")
    public @ResponseBody MemberDTO ajax5(@RequestParam("value1") String val1,
                                      @RequestParam("value2") String val2){
        System.out.println("val1 = " + val1 + ", val2 = " + val2);
        System.out.println("MemberController.ajax5");
        String val3 = "i am return";
        MemberDTO memberDTO= memberService.findMember(1L);
        return memberDTO;
    }
    @PostMapping("/ajax6")
    public @ResponseBody List<MemberDTO> ajax6(@RequestParam("value1") String val1,
                                         @RequestParam("value2") String val2){
        System.out.println("val1 = " + val1 + ", val2 = " + val2);
        System.out.println("MemberController.ajax5");
        String val3 = "i am return";
        List<MemberDTO> memberDTO= memberService.members();
        return memberDTO;
    }
    @GetMapping("/duplicate-check")
    public @ResponseBody String CheckEmail(@RequestParam("CheckEmail")String email) {
        String ckEmail = memberService.CheckEmail(email);
       return  ckEmail;

    }

    @GetMapping("/detail-ajax")
    public @ResponseBody MemberDTO mf(@RequestParam("fId") Long findId){
        MemberDTO member = memberService.mf(findId);
        System.out.println("findId = " + findId);


        return member;
    }




}
