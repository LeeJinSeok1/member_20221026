package com.icia.member.controller;

import com.icia.member.dto.MemberDTO;
import com.icia.member.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
    public String members(@ModelAttribute MemberDTO memberDTO,Model model) {
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
//    DB에 이메일과 패스워드 정보를 가져와야함
//    그리고 입력한 이메일과 패스워드를 비교
   @PostMapping("/login")
    public String login(@RequestParam("memberEmail") String email,
                        @RequestParam("memberPass") String pass){
       MemberDTO md = new MemberDTO();
       md.setMemberEmail(email);
       md.setMemberPassword(pass);
       MemberDTO member1 = memberService.login(md);
       if(member1.getMemberEmail().equals(email) && member1.getMemberPassword().equals(pass)){
           return "memberMain";
       }else{
           return "saveFail";
       }

   }


}
