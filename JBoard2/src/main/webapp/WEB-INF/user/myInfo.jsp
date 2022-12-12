<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<script src="http://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/JBoard2/js/postcode.js"></script>
<script src="/JBoard2/js/validation.js"></script>


        <main id="user">
            <section class="register">

                <form action="#" method="post">
                    <table border="1">
                        <caption>회원정보 설정</caption>
                        <tr>
                            <td>아이디</td>
                            <td>${sessUser.uid}</td>
                        </tr>
                        <tr>
                            <td>비밀번호</td>
                            <td>
                            	<input type="password" name="pass1" placeholder="비밀번호 입력"/></td>
                            </td>
                            
                        </tr>
                        <tr>
                            <td>비밀번호 확인</td>
                            <td><input type="password" name="pass2" placeholder="비밀번호 입력 확인"/>
                            <span class="resultPass"></span>
                            <button type="button" style="padding:6px; background: #e9e9e9;">비밀번호 수정</button>
                        </tr>
                        <tr>
		                    <td>회원가입일</td>
		                    <td>${sessUser.rdate}</td>
		                </tr>
                    </table>

                    <table border="1">
                        <caption>개인정보 입력</caption>
                        <tr>
                            <td>이름</td>
                            <td>
                                <input type="text" name="name" placeholder="이름 입력"/> 
                                <span class="resultName"></span>                       
                            </td>
                        </tr>
                        <tr>
                            <td>별명</td>
                            <td>
                                <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                                <input type="text" name="nick" placeholder="별명 입력"/>
                                <button type="button" id="btnNickCheck"><img src="/JBoard2/img/chk_id.gif" alt="중복확인"/></button>
                                <span class="nickResult"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>이메일</td>
                            <td>
                                <input type="email" name="email" placeholder="이메일 입력"/>
                                <span class="resultEmail"></span>
                                <button type="button" id="btnEmail"><img src="/JBoard2/img/chk_auth.gif" alt="인증번호 받기"/></button>
                                <div class="auth">
                                    <input type="text" name="auth" placeholder="인증번호 입력"/>
                                    <button type="button" id="btnEmailConfirm"><img src="/JBoard2/img/chk_confirm.gif" alt="확인"/></button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>휴대폰</td>
                            <td><input type="text" name="hp" placeholder="휴대폰 입력"/>
                            	<span class="resultHp"></span>
                            </td>
                        </tr>
                        <tr>
                            <td>주소</td>
                            <td>
                                <input type="text" name="zip" placeholder="우편번호" id="zip" readonly/>
                                <button type="button" onclick="postcode()"><img src="/JBoard2/img/chk_post.gif" alt="우편번호찾기"/></button>
                                <input type="text" name="addr1" placeholder="주소 검색" id="addr1" readonly/>
                                <input type="text" name="addr2" placeholder="상세주소 입력" id="addr2"/>
                            </td>
                        </tr>
                        <tr>
                        	<td>회원탈퇴</td>
                        	<td>
                        		<button type="button" style="padding:6px; background: #ed2f2f; color: #fff;">회원탈퇴</button>
                        	</td>
                        </tr>
                        
                    </table>

                    <div>
                        <a href="/JBoard2/user/login.do" class="btn btnCancel">취소</a>
                        <input type="submit" value="회원수정" class="btn btnRegister"/>
                    </div>

                </form>

            </section>
        </main>
        <jsp:include page="./_footer.jsp"/>