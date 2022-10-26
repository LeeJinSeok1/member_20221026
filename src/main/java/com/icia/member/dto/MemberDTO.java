package com.icia.member.dto;

import lombok.*;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MemberDTO {
    private Long memberId;
    private String memberEmail ;
    private String memberPassword;
    private String memberName;
    private int memberAge;
    private String memberMobile;
}
