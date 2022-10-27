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




}
