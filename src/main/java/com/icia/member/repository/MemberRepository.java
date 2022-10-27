package com.icia.member.repository;

import com.icia.member.dto.MemberDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class MemberRepository {
    @Autowired
    private SqlSessionTemplate sql;

    public int save(MemberDTO memberDTO) {
        int result = sql.insert("member.save", memberDTO);
        return result;
    }


    public List<MemberDTO> members() {
        List<MemberDTO> members = sql.selectList("member.members");
        return members;
    }

    public MemberDTO findMember(Long memberId) {
        MemberDTO mem = sql.selectOne("member.findMember",memberId);
        return  mem;
    }

    public MemberDTO login(MemberDTO memberDTO) {
        return  sql.selectOne("member.login",memberDTO);
    }



}


